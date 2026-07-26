//
//  ContentView.swift
//  finance-tracker
//
//  Created by João Rouxinol on 26/07/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var activeSheet: ActiveSheet?
    
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
                
                MonthlyListView(viewData: getSpendingsListViewData())
                
                HeaderView(viewData: HeaderView.ViewData(style: .withButton(buttonAction: {}),
                                                         title: "Earnings",
                                                         subtitle: "Monthly earnings",
                                                         value: "2000 €"))
                
                MonthlyListView(viewData: getEarningsListViewData())
                
                Spacer()
            }
        }
        .sheet(item: $activeSheet) { sheet in
            ActiveSheetView(sheet: sheet)
                .presentationBackground(Color.sheetBackgroundColor)
        }
    }
}

private extension ContentView {
    func getDateSelectorViewData() -> DateSelectorView.ViewData {
        DateSelectorView.ViewData(month: "January",
                                  isNextMonthAvailable: true,
                                  onPreviousMonthClick: {},
                                  onNextMonthClick: {})
    }
    
    func getSpendingsListViewData() -> MonthlyListView.ViewData {
        MonthlyListView.ViewData(entries: [
            MonthlyListEntryViewData(id: "1",
                                     name: "Gym membership",
                                     category: "Other",
                                     amount: "30 €",
                                     infoButtonAction: { entryId in
                                         activeSheet = .entryInfo(getEntryInfoViewData())
                                     }),
            
            MonthlyListEntryViewData(id: "",
                                     name: "Food",
                                     category: "Restaurants",
                                     amount: "30 €",
                                     infoButtonAction: { entryId in
                                     }),
        ])
    }
    
    func getEarningsListViewData() -> MonthlyListView.ViewData {
        MonthlyListView.ViewData(entries: [
            MonthlyListEntryViewData(id: "",
                                     name: "Coca Cola Dividends",
                                     category: "Investments",
                                     amount: "10 €",
                                     infoButtonAction: { entryId in
                                     }),
        ])
    }
    
    func getEntryInfoViewData() -> EntryInfoView.ViewData {
        EntryInfoView.ViewData(entryId: "",
                               entryType: .earning,
                               name: "Francesinha",
                               entry: ExpenseType.eatingOut,
                               amount: 100,
                               date: "23/09/2026",
                               isRecurring: false,
                               onEditAction: { entryId in },
                               onDeleteAction: { entryId in })
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
