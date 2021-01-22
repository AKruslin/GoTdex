//
//  HouseDetailView.swift
//  GoTdex
//
//  Created by COBE on 18/01/2021.
//

import SwiftUI

//VIewModel




//MARK: View

struct HouseDetailView: View {
    init(nobleHouse: NobleHouse)
    {
        self.nobleHouse = nobleHouse
        self.nobleHouseViewModel = HouseDetailViewModel()
        self.houseDetails = nobleHouseViewModel.getHouseDetails(name: nobleHouse.name)
    }
    let nobleHouse : NobleHouse
    let houseDetails : (imageName:String,location: CGSize)
    let nobleHouseViewModel : HouseDetailViewModel
    
    @State private var focusEmblem = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.85).edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack(alignment: .leading){
                    Image(houseDetails.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10.0)
                        .frame(width: geo.size.width, height: focusEmblem ? geo.size.height * 0.65 : 280)
                        .onTapGesture {focusEmblem.toggle()}
                    ScrollView {
                        HouseDescription(nobleHouse: nobleHouse, nobleHouseLocation: houseDetails.location)
                    }
                }.foregroundColor(.white)
                .animation(.spring())
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

//MARK: -Subviews

struct HouseDescription: View {
    let nobleHouse: NobleHouse
    let nobleHouseLocation: CGSize
    var body: some View {
        Group {
            VStack(alignment: .leading){
                HStack {
                    Spacer()
                    Text(nobleHouse.name).font(.largeTitle).multilineTextAlignment(.center).padding(.horizontal)
                    Spacer()
                }
                HStack{
                    Text("\(nobleHouse.words)")
                        .font(.title3)
                        .fontWeight(.thin)
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .padding()
                HStack(alignment: .firstTextBaseline)
                {
                    Text("Coat of arms:")
                        .font(.title2)
                    Text(nobleHouse.coatOfArms)
                }.padding()
                HStack{
                    Text("Region:")
                        .font(.title2)
                    Text(nobleHouse.region)
                }.padding()
                HStack(alignment: .firstTextBaseline)
                {
                    Text("Titles:")
                        .font(.title2)
                    VStack(alignment: .leading) {
                        ForEach(nobleHouse.titles, id: \.self)
                        { title in
                            Text(title)
                        }
                    }
                }.padding()
                HStack(alignment: .firstTextBaseline)
                {
                    Text("Seats:")
                        .font(.title2)
                    VStack(alignment: .leading) {
                        ForEach(nobleHouse.seats, id: \.self)
                        { seat in
                            Text(seat)
                        }
                    }
                }.padding()
            }
            NavigationLink(destination: MapView(nobleLocation: nobleHouseLocation)){
                Text("Show map").padding(8)
                    .background(Color.green.opacity(0.8))
                    .clipShape(Capsule())
            }
            
        }
    }
}

//MARK: -Preview
//--------------------------------------------------------------------------------------------
let testHouse = NobleHouse(url: "https://anapioficeandfire.com/api/houses/378", name: "House Targaryen of King\'s Landing", region: "The Crownlands", coatOfArms: "Sable, a dragon thrice-headed gules", words: "Fire and Blood", titles: ["King of the Andals, the Rhoynar and the First Men", "Lord of the Seven Kingdoms", "Prince of Summerhall"], seats: ["Red Keep (formerly)", "Summerhall (formerly)"], currentLord: "https://anapioficeandfire.com/api/characters/1303", founded: "House Targaryen: >114 BCHouse Targaryen of King\'s Landing:1 AC")

struct HouseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HouseDetailView(nobleHouse: testHouse )
    }
}
//--------------------------------------------------------------------------------------------
