//
//  NobleHouseViewModel.swift
//  GoTdex
//
//  Created by COBE on 22/01/2021.
//

import Foundation

class NobleHouseViewModel: ObservableObject {
    @Published var nobleHouses: [NobleHouse] = []
    private let housesID = [17,34,169,229,362,378,398]
    func getApiData()
    {
        if(nobleHouses.isEmpty)
        {
            for house in housesID {
                guard let url = URL( string: "https://anapioficeandfire.com/api/houses/\(house)") else {return}
                URLSession.shared.dataTask(with: url){ data,_,_ in
                    let nobleHousesData = try! JSONDecoder().decode(NobleHouse.self, from: data!)
                    DispatchQueue.main.async {
                        self.nobleHouses.append(nobleHousesData)
                    }
                }.resume()
            }
            nobleHouses.sort{
                $0.name < $1.name
            }
        }
    }
    
    func getImageName(nobleHouseName: String) -> String
    {
        let houseName = String(nobleHouseName.split(separator: " ")[1])
        return houseName
    }
}
