import SwiftUI

struct fio: View {
    @Binding var pFio: Bool
    @Binding var txt: String
    @State var lineColor = Color.black
    @FocusState var focuseField: Bool
    var body: some View {
        ZStack{
            Color.black.opacity(0.2).ignoresSafeArea()
            VStack(spacing:0){
                Text("ФИО пациента")
                    .padding()
                Divider()
                VStack(spacing: 0){
                    TextField("Фамилия И.О.", text: $txt)
                        .focused($focuseField)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(lineColor)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                }.padding()
                Divider()
                HStack(){
                    Button(action: {
                        pFio.toggle()
                    }){
                        Text("Отменить")
                    }
                    .buttonStyle(TransparentButton())
                    Divider()
                    Button(action: {
                        do {
                            lineColor = Color.black
                            addName(pName: try checkName(txt: txt))
                            pFio.toggle()
                        } catch {
                            lineColor = Color.red
                        }
                    }){
                        Text("Сохранить")
                    }
                    .buttonStyle(TransparentButton())
                }.frame(height: 50)
            }
            .background(Color.white.cornerRadius(10))
            .padding([.leading, .trailing])
        }
        .onAppear(perform: {
            txt = ""
            focuseField = true
        })
    }
}
