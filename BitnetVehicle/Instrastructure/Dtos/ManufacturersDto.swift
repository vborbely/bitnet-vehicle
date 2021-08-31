//
//  Manufacturers.swift
//  BitnetVehicle
//
//  Created by Borbély Viktor on 2021. 08. 30..
//

import Foundation


struct ManufacturersDto : Decodable{
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case searchCriteria = "SearchCriteria"
        case results = "Results"
        case count = "Count"
    }
    
    let count: Int
    let message: String
    let searchCriteria: String?
    let results : [ResultDto]
}

struct ResultDto : Decodable{
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case commonName = "Mfr_CommonName"
        case id = "Mfr_ID"
        case name = "Mfr_Name"
        case vehicleTypes = "VehicleTypes"
    }
    
    let country: String
    let commonName : String?
    let id: Int
    let name: String
    let vehicleTypes : [VehicleTypeDto]
}

struct VehicleTypeDto: Decodable {
    enum CodingKeys: String, CodingKey {
        case isPrimary = "IsPrimary"
        case name = "Name"
    }
    
    let isPrimary: Bool
    let name: String
}

extension ManufacturersDto {
    static func fromJson(json:Data) -> ManufacturersDto? {
        do{
            return try  JSONDecoder().decode(ManufacturersDto.self,from: json)
        }catch let jsonErr {
            print("Error fromJson: " + jsonErr.localizedDescription)
            return nil
        }
    }
}
