//
//  NobleHouseView.swift
//  GoTdex
//
//  Created by COBE on 16/01/2021.
//

import SwiftUI

struct NobleHouseView: View {
    
    init()
    {
        nobleHouseViewModel.getApiData()
    }
    
    @ObservedObject var nobleHouseViewModel = NobleHouseViewModel()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.85)
            ScrollView {
                VStack {
                    Text("Noble Houses of Westeros")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    LazyVGrid(columns: [.init(),.init()]){
                        ForEach(nobleHouseViewModel.nobleHouses)
                        {
                            nobleHouse in
                            NavigationLink(
                                destination: HouseDetailView(nobleHouse: nobleHouse))
                            {
                                Image(nobleHouseViewModel.getImageName(nobleHouseName: nobleHouse.name))
                                    .resizable()
                                    .frame(width: 170.0, height: 170.0)
                                    .cornerRadius(30)
                            }
                        }
                    }
                }.padding(.top, 80)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}



struct NobleHouse_Previews: PreviewProvider {
    static var previews: some View {
        NobleHouseView()
    }
}
