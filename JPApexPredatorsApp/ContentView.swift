//
//  ContentView.swift
//  JPApexPredatorsApp
//
//  Created by m.kola on 05/01/26.
//

import SwiftUI

struct ContentView: View {
    
    let predator = Predators()
    
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelction = ApexType.all
    
    var filteredDinos: [ApexPredator]{
        predator.filter(by: currentSelction)
        
        predator.sort(by: alphabetical)
        
        return predator.seach(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos){ predator in
                NavigationLink{
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                }label:{
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
            }
            .navigationTitle("Apex Predator")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        alphabetical.toggle()
                    }label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Menu {
                        Picker("Filter", selection: $currentSelction.animation()){
                            ForEach(ApexType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    
                           
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
