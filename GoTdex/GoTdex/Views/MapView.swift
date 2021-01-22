//
//  MapView.swift
//  GoTdex
//
//  Created by COBE on 20/01/2021.
//

import SwiftUI

struct MapView: View {

    init(nobleLocation: CGSize)
    {
        
        self.houseLocation = nobleLocation
    }
    
    var houseLocation : CGSize
    
    @State var finalAmount: CGFloat = 5.5
    @State var currentAmount: CGFloat = 0
    
    @State var dragged = CGSize.zero
    @State var accumulated = CGSize.zero
    
    @State var resetLocationOffset = false
    
        var body: some View {
        ZStack {
            Image("Westeros")
                .resizable()
                .scaleEffect(finalAmount + currentAmount < 1 ? 1 : finalAmount + currentAmount )
                .offset(CGSize(width: (resetLocationOffset ? 0 : houseLocation.width) + self.dragged.width, height: (resetLocationOffset ? 0 : houseLocation.height) + self.dragged.height))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            self.dragged = CGSize(width: value.translation.width + self.accumulated.width, height: value.translation.height + self.accumulated.height)
                        }
                        .onEnded{ value in
                            self.dragged = CGSize(width: value.translation.width + self.accumulated.width, height: value.translation.height + self.accumulated.height)
                            self.accumulated = self.dragged
                        }
                )
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            self.currentAmount = amount - 1
                        }
                        .onEnded { amount in
                            self.finalAmount += self.currentAmount
                            self.currentAmount = 0
                        }
                )
            VStack{
                Spacer()
                Button(action: {
                    finalAmount = 1
                    currentAmount = 0
                    dragged = CGSize.zero
                    accumulated = CGSize.zero
                    resetLocationOffset = true
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                })
                .padding(.bottom,30)
            }
        }
        .animation(.spring())
        .background(Color.black.opacity(0.85))
        .ignoresSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(nobleLocation:CGSize(width: -89.3333, height: 1083.3333))
    }
}




