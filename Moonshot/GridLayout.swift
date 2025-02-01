//
//  GridLayout.swift
//  Moonshot
//
//  Created by Hadi Al zayer on 28/07/1446 AH.
//

import SwiftUI

struct GridLayout: View {
    
    let missions : [Mission]
    let astronauts : [String : Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
             LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    
                    NavigationLink(value: mission.id){
                        
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                        
                    }.navigationDestination(for: Int.self){ missionId in
                        if let mission = missions.first(where: { $0.id == missionId }) {
                                           MissionView(mission: mission, astronauts: astronauts)
                                       }
                    }
                    
                }
               
            }
            .padding([.horizontal, .bottom])
        }
       
    }
}

#Preview {
    GridLayout(missions: Bundle.main.decode("missions.json"), astronauts: Bundle.main.decode("astronauts.json"))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
