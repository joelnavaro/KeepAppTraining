//
//  Extensions.swift
//  KeepAppTraining
//
//  Created by Joel Pena Navarro on 2023-02-08.
//

import SwiftUI

extension Color{
    static let appBackground = LinearGradient(
        gradient: Gradient(colors: [Color("Color1"), Color("Color6")]),
        startPoint: .bottomLeading,
        endPoint: .topTrailing)
    
    static let appBackground2 = LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color8")]), startPoint: .topTrailing, endPoint: .bottomLeading)
    static let inApp = LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color6")]), startPoint: .bottom, endPoint: .topTrailing)
    static let inApp2 = LinearGradient(gradient: Gradient(colors: [Color("Color4"), Color("Color6")]), startPoint: .bottom, endPoint: .topTrailing)
    static let appButtons = LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color7")]), startPoint: .bottom, endPoint: .top)
    static let testCard = LinearGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color6")]), startPoint: .bottom, endPoint: .top)
    static let blankSpace = LinearGradient(gradient: Gradient(colors: [Color("Color6"), Color("Color8")]), startPoint: .bottom, endPoint: .top)
    
    /*
     ex
     RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 650)
     
     ex
     Rectangle().fill(.blue.gradient)
     
     ex
     Text("Hello World")
         .padding()
         .foregroundColor(.white)
         .font(.largeTitle)
         .background(
             LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                                                        or 3 colors
             LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
         )
     
     ex using circle angle and stroke
     Circle()
         .strokeBorder(
             AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
             lineWidth: 50
         )
         .frame(width: 200, height: 200)
     
     */
}
