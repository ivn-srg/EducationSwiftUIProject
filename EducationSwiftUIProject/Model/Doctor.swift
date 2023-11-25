//
//  Doctor.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 14.11.2023.
//

import SwiftUI

class Doctor: Identifiable {
    
    var id = UUID()
    let fullName: String
    let specilty: String
    let avatarImage: Image
    let phone: URL?
    let distance: String
    let reviews: String
    let workDate: String
    let workTime: String
    let isGeneralDoc: Bool
    
    init(fullName: String, specilty: String, avatarImage: Image, phone: URL? = nil, distance: String, 
         reviews: String, workDate: String, workTime: String, isGeneralDoc: Bool = false) {
        self.fullName = fullName
        self.specilty = specilty
        self.avatarImage = avatarImage
        self.phone = phone
        self.distance = distance
        self.reviews = reviews
        self.workDate = workDate
        self.workTime = workTime
        self.isGeneralDoc = isGeneralDoc
    }
}
