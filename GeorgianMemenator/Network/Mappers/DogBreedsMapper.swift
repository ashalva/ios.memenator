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
            minLife: dto.attributes.life.min,
            maxLife: dto.attributes.life.max,
            maleMinWeight: dto.attributes.maleWeight.min,
            maleMaxWeight: dto.attributes.maleWeight.max,
            femaleMinWeight: dto.attributes.femaleWeight.min,
            femaleMaxWeight: dto.attributes.femaleWeight.max
        )
    }
}
