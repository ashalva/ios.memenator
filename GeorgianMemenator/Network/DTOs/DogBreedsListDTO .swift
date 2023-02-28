//
//  DogBreedsListDTO .swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 25.02.23.

import Foundation

struct DogBreedDTO: Codable {
    struct Attributes: Codable {
        struct Weight: Codable {
            let max, min: Int
        }
        
        struct Life: Codable {
            let max, min: Int
        }
        
        let name, description: String
        let life: Life
        let maleWeight, femaleWeight: Weight
        let hypoallergenic: Bool
        
        enum CodingKeys: String, CodingKey {
            case name, description, life
            case maleWeight = "male_weight"
            case femaleWeight = "female_weight"
            case hypoallergenic
        }
    }
    
    let id: String
    let type: String
    let attributes: Attributes
}

struct DogBreedsListDTO: Codable {
    let data: [DogBreedDTO]
}
