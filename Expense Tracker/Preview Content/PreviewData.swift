//
//  PreviewData.swift
//  Expense Tracker
//
//  Created by DSOFT on 15/08/2022.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "13/11/2022", institution: "Apple", account: "Visa", merchant: "Apple", amount: 10, type: "debit", categoryId: 801, category: "Hardware", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
