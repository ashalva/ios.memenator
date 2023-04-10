//
//  DogBreedsService.swift
//  GeorgianMemenator
//
//  Created by Qeti Avanashvili on 24.02.23.
//
import Combine
import Foundation

protocol DogBreedsServing {
    func getDogBreeds() -> AnyPublisher<[DogBreed], Error>
    func getDogBreedDetails(with id: String) -> AnyPublisher<DogBreed, Error>
}

class DogBreedsService: DogBreedsServing {
    private let dogBreedApiUrl = "https://dogapi.dog/api/v2/"

    func getDogBreeds() -> AnyPublisher<[DogBreed], Error> {
        let request = Endpoint<DogBreedsListDTO>(baseURL: dogBreedApiUrl)
            .appendingPathParameter("breeds")
            .usingDefaultParameters()
        
        return try! request
            .usingMethod(.GET)
            .build()
            .asFuture()
            .map {
                $0.data.map { breed in DogBreedsMapper.toEntity(dto: breed) }
            }
            .eraseToAnyPublisher()
    }
    
    func getDogBreedDetails(with id: String) -> AnyPublisher<DogBreed, Error> {
        let request = Endpoint<DogBreedDetailDTO>(baseURL: dogBreedApiUrl)
            .appendingPathParameter("breeds/\(id)")
            .usingDefaultParameters()
        
        return try! request
            .usingMethod(.GET)
            .build()
            .asFuture()
            .map {
                DogBreedsMapper.toEntity(dto: $0.data)
            }
            .eraseToAnyPublisher()
    }
}
