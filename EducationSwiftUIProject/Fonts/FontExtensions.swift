//
//  FontExtensions.swift
//  EduSwiftUIProject
//
//  Created by Sergey Ivanov on 18.11.2023.
//

import SwiftUI

extension Font {
    static func mainFontBold(size: CGFloat) -> Font {
        return Font.custom("Poppins-Bold", size: size)
    }
    static func mainFontRegular(size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    static func secondFontBold(size: CGFloat) -> Font {
        return Font.custom("NunitoSans7ptCondensed-Bold", size: size)
    }
    static func secondFontRegular(size: CGFloat) -> Font {
        return Font.custom("NunitoSans7ptCondensed-Regular", size: size)
    }
}
