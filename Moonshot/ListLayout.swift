//
//  ListLayout.swift
//  Moonshot
//
//  Created by Hadi Al zayer on 28/07/1446 AH.
//

import SwiftUI

struct ListLayout: View {
    let missions : [Mission]
    let astronauts : [String : Astronaut]
    
    var body: some View {
        List(missions){ mission in
            NavigationLink(value: mission.id){
                HStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40 , height: 40)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                    }
                }
            
            
            
            }.navigationDestination(for: Int.self){ missionId in
                if let mission = missions.first(where: {$0.id == missionId} ){
                    MissionView(mission: mission, astronauts: astronauts)
                }
            }
            .listRowBackground(Color.darkBackground)
           
        }
        .listStyle(.plain)
        
    }
        
}
#Preview {
    ListLayout(missions: Bundle.main.decode("missions.json"), astronauts: Bundle.main.decode("astronauts.json"))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
