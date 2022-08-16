//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by DSOFT on 15/08/2022.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
