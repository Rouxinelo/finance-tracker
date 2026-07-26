//
//  ContentView.swift
//  finance-tracker
//
//  Created by João Rouxinol on 26/07/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ZStack {
            Color
                .backgroundColor
                .ignoresSafeArea(.all)
            
            VStack(spacing: 10) {
                MonthlyBalanceView(viewData: MonthlyBalanceView.ViewData(style: .withDivider,
                                                                         earnings: 4000,
                                                                         expenses: 3000,
                                                                         dateSelectorViewData: getDateSelectorViewData()))
                
                HeaderView(viewData: HeaderView.ViewData(style: .withButton(buttonAction: {}),
                                                         title: "Spendings",
                                                         subtitle: "Monthly Expenses",
                                                         value: "3000 €"))
                
                HeaderView(viewData: HeaderView.ViewData(style: .withButton(buttonAction: {}),
                                                         title: "Earnings",
                                                         subtitle: "Monthly earnings",
                                                         value: "2000 €"))
                
                Spacer()
            }
        }
    }
    
    func getDateSelectorViewData() -> DateSelectorView.ViewData {
        DateSelectorView.ViewData(month: "January",
                                  isNextMonthAvailable: true,
                                  onPreviousMonthClick: {},
                                  onNextMonthClick: {})
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
