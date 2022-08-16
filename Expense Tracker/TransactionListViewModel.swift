//
//  TransactionListViewModel.swift
//  Expense Tracker
//
//  Created by DSOFT on 15/08/2022.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

final class TransactionListViewModel: ObservableObject {
    @Published var transactions = [Transaction]()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        getTransaction()
    }
    
    func getTransaction() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url).tryMap { (data, response) -> Data in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                dump(response)
                throw URLError(.badServerResponse)
            }
            return data
        }
        .decode(type: [Transaction].self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("Competed fetch")
            }
            
        } receiveValue: { [weak self] result in
            self?.transactions = result
        }
        .store(in: &cancellable)

    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {return [:]}
        let groupdTransactions = TransactionGroup(grouping: transactions) {$0.month }
        return groupdTransactions
    }
    
}
