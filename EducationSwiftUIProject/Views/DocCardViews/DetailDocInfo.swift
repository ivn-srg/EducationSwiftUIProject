//
//  DetailDocInfo.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 15.11.2023.
//

import SwiftUI

struct DetailDocInfo: View {
    @Binding var isModalPresented: Bool
    @State var showAlert: Bool = false
    let doctor: Doctor

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            // Закрыть модальное окно
                            isModalPresented = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .frame(alignment: .leading)
                            Spacer()
                        }
                        .padding([.top, .leading], 10)
                    }
                    
                    VStack(spacing: 0) {
                        ZStack {
                            Circle()
                                .foregroundStyle(Color.white)
                                .frame(width: 200, height: 250)
                                .overlay{
                                    doctor.avatarImage
                                        .resizable()
                                        .scaledToFill()
                                        .offset(y:45)
                                        .frame(width: 200, height: 300)
                                        .clipShape(Circle())
                                }
                        }
                        
                        VStack(alignment: .center, spacing: 8) {
                            Text(doctor.fullName)
                                .font(.mainFontBold(size: 23))
                                .foregroundStyle(Color.white)
                            
                            Text(doctor.specilty)
                                .font(.mainFontRegular(size: 20))
                                .foregroundStyle(Color.white)
                        }
                    }
                    .padding(20)
                }
                .frame(alignment: .top)
                .frame(maxWidth: .infinity)
                .background(Color.customBlue)
//                .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .center, spacing: 8) {
                        Image.calendarFillIcon
                            .frame(width: 20, height: 20)
                        
                        Text("Work day: \(doctor.workDate)")
                            .font(.mainFontRegular(size: 20))
                            .foregroundStyle(Color.customBlue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 8) {
                        Image.clockBlueIcon
                            .font(.system(size: 20))
                        
                        Text("Work time: \(doctor.workTime)")
                            .font(.mainFontRegular(size: 20))
                            .foregroundStyle(Color.customBlue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(24)
                
                Spacer()
                
                HStack() {
                    Button(action: {
                        guard let phoneURL = doctor.phone  else { return }
                        UIApplication.shared.open(phoneURL)
                        
                    }) {
                        Text(NSLocalizedString("buttonAction1", comment: ""))
                            .padding()
                            .frame(width: 80)
                            .background(Color.customBlue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding()
                    
//                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        NavigationLink("Chat", destination: ChatDetailView(
                            chat: chatData.filter({$0.doctor.fullName == doctor.fullName})[0]
                            )
                        ).padding()
                            .frame(width: 80)
                            .background(Color.customBlue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .padding()
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Ошибка"),
                            message: Text("Что-то пошло не так"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
                
            }
        }
    }
}

#Preview {
    DetailDocInfo(isModalPresented: .constant(false), showAlert: false, doctor: listOfDoctors[0])
}
