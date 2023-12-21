//
//  GeneralDocView.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import SwiftUI

struct GeneralDocView: View {
    @State private var isModalPresented = false
    var generalDoc = Doctor.listOfDoctors.filter({$0.isGeneralDoc})[0]
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .center, spacing: 16) {
                HStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .foregroundStyle(Color.white)
                            .frame(width: 50, height: 65)
                            .overlay{
                                generalDoc.avatarImage
                                    .resizable()
                                    .scaledToFill()
                                    .offset(y:5)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 0))
                            }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(generalDoc.fullName)
                            .font(.mainFontBold(size: 16).weight(.bold))
                            .foregroundColor(.white)
                        
                        Text(generalDoc.specilty)
                            .font(.mainFontRegular(size: 14))
                            .foregroundColor(.customLightGray)
                    }
                    
                    Spacer()
                    
                    Image(systemName:"chevron.right")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    // При тапе на HStack открываем модальное окно
                    isModalPresented.toggle()
                }
                // Модификатор .sheet для отображения модального окна
                .sheet(isPresented: $isModalPresented) {
                    DetailDocInfo(isModalPresented: $isModalPresented, doctor: generalDoc)
                }
                
                Divider().background(Color.white)
                
                HStack(alignment: .top, spacing: 12) {
                    HStack(alignment: .center, spacing: 8) {
                        Image.calendarWhiteIcon
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                        
                        Text(generalDoc.workDate)
                            .font(.mainFontRegular(size: 12))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 8) {
                        Image.clockIcon
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                        
                        Text(generalDoc.workTime)
                            .font(.mainFontRegular(size: 12))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(20)
            .background(Color.customBlue)
            
            
        }
        .frame(alignment: .top)
        .cornerRadius(12)
    }
}

#Preview {
    GeneralDocView()
}
