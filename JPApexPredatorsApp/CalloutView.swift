//
//  CalloutView.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 16/01/26.
//

import SwiftUI

struct CalloutView: View {
    let predator: ApexPredator
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Bubble
            VStack(spacing: 6) {
                Text(predator.name)
                    .font(.headline)
                
                Text(predator.type.rawValue.capitalized)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(predator.type.backgroundColor)
                    .clipShape(Capsule())
            }
            .padding(10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 6)
            
            // Arrow
            Triangle()
                .fill(.ultraThinMaterial)
                .frame(width: 16, height: 8)
                .shadow(radius: 2)
        }
    }
}

#Preview {
    let predator = Predators().apexPredators[2]
    CalloutView(predator: predator)
}
