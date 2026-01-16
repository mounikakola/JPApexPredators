//
//  Predators.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 05/01/26.
//

import Foundation

class Predators {
    var allApexPredators: [ApexPredator] = []
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
                self.allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func seach(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty{
            return apexPredators
        }else{
            return apexPredators.filter{ predator in predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool){
        apexPredators.sort{predator1, predator2 in
            if alphabetical{
                predator1.name < predator2.name
            }else{
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: ApexType){
        if type == .all{
            apexPredators = allApexPredators
        }
        else{
            apexPredators = allApexPredators.filter{predator in
                predator.type == type
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let predator = apexPredators[index]
            
            apexPredators.remove(at: index)
            
            allApexPredators.removeAll {
                $0.id == predator.id
            }
        }
    }
}
