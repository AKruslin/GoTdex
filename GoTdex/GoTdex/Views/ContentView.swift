//
//  ContentView.swift
//  GoTdex
//
//  Created by COBE on 16/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                GeometryReader { geo in
                Image("Westeros")
                    .resizable().scaledToFill()
                    .scaleEffect(1)
                    .offset(x: -225.0)
                }
                VStack {
                    HStack {
                        Text("Welcome to Westeros!")
                            .font(.system(size:32))
                            .fontWeight(.bold)
                            .padding()
                            .shadow(color: .black, radius: 0, x: 2, y: 2)
                    }.frame(maxWidth: .infinity,alignment: .center)
                    
                        NavigationLink(destination: NobleHouseView())
                            {
                            Text("Enter the world")
                            .font(.headline)
                            .fontWeight(.bold).shadow(color: .black, radius: 1, x: 1, y: 1)
                        }
                        .padding(6)
                        .background(Color.green)
                        .cornerRadius(30)
                    
                }
            }
            .ignoresSafeArea()
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
