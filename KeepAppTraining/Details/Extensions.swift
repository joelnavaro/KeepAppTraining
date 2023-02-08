//
//  Extensions.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-08.
//

import SwiftUI

extension Color{
    static let appBackground = LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color6")]), startPoint: .bottomLeading, endPoint: .topTrailing)
    static let appBackground2 = LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color8")]), startPoint: .topTrailing, endPoint: .bottomLeading)
    static let inApp = LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color6")]), startPoint: .bottom, endPoint: .topTrailing)
    static let inApp2 = LinearGradient(gradient: Gradient(colors: [Color("Color4"), Color("Color6")]), startPoint: .bottom, endPoint: .topTrailing)
    static let appButtons = LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color7")]), startPoint: .bottom, endPoint: .top)
}
