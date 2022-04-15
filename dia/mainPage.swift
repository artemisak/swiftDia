
import SwiftUI

struct mainPage: View {
    @State private var showModal: Bool = false
    @State private var isLoad: Bool = true
    var sheets = exportTable()
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        GeometryReader { g in
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        NavigationLink(destination: sugarChange()) {
                            VStack {
                                Image("menu_sugar")
                                Text("Измерение сахара")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }
                        }.buttonStyle(ChangeColorButton())
                        NavigationLink(destination: inject()) {
                            VStack {
                                Image("menu_syringe")
                                Text("Введение инсулина")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }

                        }.buttonStyle(ChangeColorButton())
                        NavigationLink(destination: enterFood()) {
                            VStack {
                                Image("menu_food")
                                Text("Прием пищи")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }
                        }.buttonStyle(ChangeColorButton())
                        NavigationLink(destination: enterAct()) {
                            VStack {
                                Image("menu_sleep")
                                Text("Физическая \nактивность и сон")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }

                        }.buttonStyle(ChangeColorButton())
                        NavigationLink(destination: history()) {
                            VStack {
                                Image("menu_paper")
                                Text("История записей")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }
                        }.buttonStyle(ChangeColorButton())
                        Button(action:{
                            isLoad.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
                                isLoad.toggle()
                                let AV = UIActivityViewController(activityItems: [sheets.generate()], applicationActivities: nil)
                                AV.overrideUserInterfaceStyle = .light
                                UINavigationBar.appearance().overrideUserInterfaceStyle = .light
                                UITableView.appearance().overrideUserInterfaceStyle = .light
                                UIApplication.shared.currentUIWindow()?.rootViewController?.present(AV, animated: true, completion: nil)
                            }
                        }){
                            VStack{
                                Image("menu_xlsx")
                                Text("Экспорт данных")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .buttonStyle(ChangeColorButton())
                    }
                    .frame(width: g.size.width)
                    .frame(minHeight: g.size.height)
                }
                if !isLoad {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2.5)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("ДиаКомпаньон")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {showModal.toggle()}){
                    Image(systemName: "line.3.horizontal")
                }
                .buttonStyle(ChangeColorButton())
                .sheet(isPresented: $showModal) {
                    ModalView()
                }
            }
        }
    }
}

public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter({
                $0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }
        
        return window
        
    }
}

struct ChangeColorButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.white)
            .foregroundColor(.blue)
    }
}
