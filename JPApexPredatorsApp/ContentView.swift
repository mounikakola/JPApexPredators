//
//  ContentView.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 05/01/26.
//

import SwiftUI

struct ContentView: View {
    
    let predator = Predators()
    
    var body: some View {
        List(predator.apexPredators){ predator in
            HStack{
                //Image
                
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(color: .white, radius: 1)
                
                VStack(alignment: .leading){
                    //Name
                    Text(predator.name)
                        .fontWeight(.bold)
                    
                    //Type
                    Text(predator.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(predator.type.backgroundColor)
                        .clipShape(.capsule)
                    
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
