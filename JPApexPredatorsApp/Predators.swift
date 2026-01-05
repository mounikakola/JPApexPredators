//
//  Predators.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 05/01/26.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    //By default swift coding standards follow camelCase (starts with lower and goes capital)
    
    //Snake case => var_name
    
    init() {
        decodeApexPredators()
    }
    
    func decodeApexPredators() {
        
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.apexPredators = try decoder.decode([ApexPredator].self, from: data)
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
