//
//  PredatorMap.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 12/01/26.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators().apexPredators
    
    @State var position: MapCameraPosition
    @State var satelliteView: Bool = false
    @State private var selectedID: ApexPredator.ID?
    
    var body: some View {
        Map(position: $position){
            ForEach(predators) { predator in
                Annotation(predator.name, coordinate: predator.location)
                {
                    VStack{
                        
                        // callout view
                        if selectedID == predator.id {
                            CalloutView(predator: predator)
                                .offset(y: 6)
                                .transition(.opacity)
                        }
                        
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .shadow(color: .white, radius: 3)
                            .scaleEffect(x: -1)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    selectedID = predator.id
                                }
                            }
                    }
                }
            }
        }
        .simultaneousGesture(
            TapGesture().onEnded {
                selectedID = nil
            }
        )
        .mapStyle(satelliteView ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing){
            Button{
                satelliteView.toggle()
            }label:{
                Image(systemName: satelliteView ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial) //material is like level of transparency
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location,
        distance: 1000, heading: 250,
        pitch: 80))
    )
    .preferredColorScheme(.dark)
}
