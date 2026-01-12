//
//  ApexPredator.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 05/01/26.
//

import SwiftUI
import MapKit

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
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene : Decodable, Identifiable{
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum ApexType: String, Decodable, CaseIterable, Identifiable{
    case all
    case land // "land"
    case air
    case sea
    
    var id: ApexType{
        self
    }
    
    var backgroundColor: Color {
        switch self {
        case .land:
            return .brown
        case .air:
            return .teal
        case .sea:
            return .blue
        case .all:
            return .black
        }
    }
    
    var icon: String{
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        case .land:
            "leaf.fill"
        }
    }
}
