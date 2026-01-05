//
//  ApexPredator.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 05/01/26.
//

import SwiftUI

struct ApexPredator : Decodable, Identifiable /*to decode some json data to swift (json data to app code) */ {
    let id: Int
    let name: String
    let type: ApexType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene : Decodable{
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum ApexType: String, Decodable{
        case land // "land"
        case air
        case sea
        
        var backgroundColor: Color {
            switch self {
            case .land:
                return .brown
            case .air:
                return .teal
            case .sea:
                return .blue
            }
        }
    }
}
