//
//  ContentView.swift
//  Expense Tracker
//
//  Created by DSOFT on 15/08/2022.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24, content: {
                    
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Chart ",form: CGSize(width: UIScreen.main.bounds.size.width - 20, height: 200)).frame(alignment: .center)
               
                    RecentTransactionList()
                })
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
       let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }.environmentObject(transactionListVM)
    }
}
