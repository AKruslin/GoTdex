//
//  HouseDetailViewModel.swift
//  GoTdex
//
//  Created by COBE on 22/01/2021.
//

import SwiftUI

struct HouseDetailViewModel
{
    let nobleData = ["Baratheon": CGSize(width: -427.3333, height: -1238),"Bolton": CGSize(width: -327.6666, height: 1206),
                     "Greyjoy": CGSize(width: 247.6666, height: -167),"Lannister": CGSize(width: 257.3333, height: -647.3333),
                     "Stark": CGSize(width: -89.3333, height: 1083.3333),"Targaryen": CGSize(width: -338, height: -814.6666),
                     "Tyrell": CGSize(width: 121, height: -1383.3333)]
    
    func getHouseDetails(name: String) -> (imageName: String, location: CGSize){
        let houseImageName = String(name.split(separator: " ")[1])
        guard let houseIndex = nobleData.index(forKey: houseImageName) else {
            return ("maintenance",CGSize.zero)
        }
        return (houseImageName, nobleData[houseIndex].value)
    }
}
