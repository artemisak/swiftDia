import SwiftUI

enum selectedvar: String, CaseIterable, Identifiable {
    case natoshak = "Натощак"
    case zavtrak = "После завтрака"
    case obed = "После обеда"
    case uzin = "После ужина"
    case dop = "Дополнительно"
    case rodi = "При родах"
    var id: String { self.rawValue }
}

struct sugarChange: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var t : String
    @State var date : Date
    @State var isAct : Bool
    @State var bool1 : Int
    @State var spreviewIndex : selectedvar
    @State var idForDelete : [Int]
    @State private var isCorrect : Bool = false
    @Binding var txtTheme : DynamicTypeSize
    @Binding var hasChanged : Bool
    var body: some View {
        List {
            Section(header: Text("Общая информация").font(.system(size: 15.5))){
                TextField("Уровень сахара в крови, ммоль/л", text: $t)
                    .keyboardType(.decimalPad)
                NavigationLink(destination: sugarPicker(spreviewIndex: $spreviewIndex), label: {
                    HStack {
                        Text("Период")
                        Spacer()
                        Text("\(spreviewIndex.rawValue)")
                            .foregroundColor(.gray)
                    }
                })
                Toggle(isOn: $isAct, label: {
                    Text("Физическая нагрузка")
                })
            }
            Section(header: Text("Время измерения").font(.system(size: 15.5))){
                VStack(alignment: .center){
                    DatePicker(
                        selection: $date,
                        displayedComponents: [.date, .hourAndMinute]
                    ){}
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .clipped()
                        .compositingGroup()
                }.frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Измерение сахара")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: {
                    do {
                        if !idForDelete.isEmpty {
                            deleteFromBD(idToDelete: idForDelete, table: 3)
                            hasChanged = true
                        }
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "HH:mm dd.MM.yyyy"
                        if isAct {
                            bool1 = 1
                        } else {
                            bool1 = 0
                        }
                        addSugarChange(lvl: try convert(txt: t), period: spreviewIndex.rawValue, physical: bool1, time: dateFormatter.string(from: date))
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        isCorrect = true
                    }
                }) {
                    Text("Сохранить")
                        .dynamicTypeSize(txtTheme)
                }
                .alert(isPresented: $isCorrect) {
                    Alert(title: Text("Статус операции"), message: Text("Введите релевантное \nзначение"), dismissButton: .default(Text("ОК")))
                }
            })
            ToolbarItemGroup(placement: .keyboard, content: {
                Spacer()
                Button(action: {
                    UIApplication.shared.dismissedKeyboard()
                }, label: {
                    Text("Готово").dynamicTypeSize(txtTheme)
                })
            })
        }
        .ignoresSafeArea(.keyboard)
        .onAppear(perform: {
            UIScrollView.appearance().keyboardDismissMode = .onDrag
            UITableView.appearance().showsVerticalScrollIndicator = false
        })
    }
}

struct sugarPicker: View {
    @Binding var spreviewIndex: selectedvar
    var body: some View {
        Form {
            Picker(selection: $spreviewIndex , label: Text("Период").font(.system(size: 15.5))) {
                Text("Натощак").tag(selectedvar.natoshak)
                Text("После завтрака").tag(selectedvar.zavtrak)
                Text("После обеда").tag(selectedvar.obed)
                Text("После ужина").tag(selectedvar.uzin)
                Text("Дополнительно").tag(selectedvar.dop)
                Text("При родах").tag(selectedvar.rodi)
            }.pickerStyle(.inline)
        }
    }
}
