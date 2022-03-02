//
//  poldny.swift
//  dia
//
//  Created by Артем  on 26.10.2021.
//

import SwiftUI

struct poldny: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var multipleIsPresented = false
    var rkManager3 = RKManager(calendar: Calendar.current, minimumDate: Calendar.current.date(byAdding: .month, value: -1, to: Date())!, maximumDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!, mode: 3)
    var body: some View {
        RKViewController(isPresented: self.$multipleIsPresented, rkManager: self.rkManager3)
            .interactiveDismissDisabled()
            .onAppear(perform: startUp)
            .navigationTitle("Выбрать дни")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        addDatesToDB(dates: rkManager3.selectedDates)
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Сохранить")
                    }
                }
            }
        
    }
    func startUp() {
        rkManager3.selectedDates = getDatesFromDB()
        rkManager3.colors.weekdayHeaderColor = Color.blue
        rkManager3.colors.monthHeaderColor = Color.black
        rkManager3.colors.textColor = Color.blue
        rkManager3.colors.disabledColor = Color.red
        rkManager3.colors.todayBackColor = Color.blue
        rkManager3.colors.weekdayHeaderColor = Color.black
    }
}

struct poldny_Previews: PreviewProvider {
    static var previews: some View {
        poldny()
    }
}
