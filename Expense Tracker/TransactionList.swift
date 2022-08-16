//
//  TransactionList.swift
//  Expense Tracker
//
//  Created by DSOFT on 15/08/2022.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel

    var body: some View {
        
        VStack {
            List {
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key){ month, transitions in
                    Section {
                        ForEach(transitions) { transition in
                            TransactionRow(transaction: transition)
                        }
                    } header: {
                        Text (month)
                    }.listSectionSeparator(.hidden)
                }
            }.listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
       let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList().preferredColorScheme(.dark)
            }
        }.environmentObject(transactionListVM)
    }
}
