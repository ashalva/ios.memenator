//
//  DogBreedsMapper.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 25.02.23.
//

import Foundation

enum DogBreedsMapper {
    static func toEntity(dto: DogBreedDTO) -> DogBreed {
        .init(
            name: dto.attributes.name,
            description: dto.attributes.description,
            minLife: Int(dto.attributes.life.min),
            maxLife: Int(dto.attributes.life.max),
            maleMinWeight: Int(dto.attributes.maleWeight.min),
            maleMaxWeight: Int(dto.attributes.maleWeight.max),
            femaleMinWeight: Int(dto.attributes.femaleWeight.min),
            femaleMaxWeight: Int(dto.attributes.femaleWeight.max)

        )
    }
}
