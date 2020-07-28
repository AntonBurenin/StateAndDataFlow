//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            
            VStack {
                ButtonView(timer: timer)
            }
            Spacer()
            Button(action: {
                self.user.isRegister = false
                UserDefaults.standard.removeObject(forKey: "username")
                UserDefaults.standard.set(false, forKey: "isRegister")
            }) {
                Text("LogOut")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .customModifier(color: .blue)
            .offset(x: 0, y: -20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        VStack {
            Button(action: { self.timer.startTemer() }) {
                Text("\(timer.buttonTitle)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .customModifier(color: .red)
        }
    }
}

struct ButtonCustomModifier: ViewModifier{
    let color: Color
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
        )
    }
}

extension Button {
    func customModifier(color: Color) -> some View {
        modifier(ButtonCustomModifier(color: color))
    }
}
