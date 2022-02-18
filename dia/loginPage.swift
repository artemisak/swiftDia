//
//  login.swift
//  dia
//
//  Created by Артём Исаков on 12.02.2022.
//

import SwiftUI

struct loginPage: View {
    @State private var login: String = ""
    @State private var pass: String = ""
    @ObservedObject var islogin: check
    var body: some View {
        GeometryReader { g in
            ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Логин")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            TextField("email@gmail.com", text: $login)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .font(.system(size: 20))
                                .padding(.top, 5)
                            Divider()
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Пароль")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            SecureField("password", text: $pass)
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .font(.system(size: 20))
                                .padding(.top, 5)
                            Divider()
                        }
                        .padding(.top, 20)
                        Button(action: {
                            islogin.setlogged(upass: pass, ulogin: login)
                        }, label: {
                            Text("Войти")
                        })
                            .padding(.top, 20)
                            .buttonStyle(RoundedRectangleButtonStyle())
                    }
                    .padding()
                    .frame(minHeight: g.size.height)
                
            }
        }
        .ignoresSafeArea()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack{
                    Text("Dia ID")
                        .foregroundColor(Color.black)
                        .font(.title)
                        .fontWeight(.bold)
                    Image("ofIcon")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
            }
        }
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .padding()
    .background(Color.blue.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}