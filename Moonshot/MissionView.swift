//
//  MissionView.swift
//  Moonshot
//
//  Created by Hadi Al zayer on 15/07/1446 AH.
//

import SwiftUI



struct MissionView: View {
    
    struct CrewMember{
        let role: String
        let astronaut : Astronaut
    }
    
    
    let mission : Mission
    let crew : [CrewMember]
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){ width, axis in
                        width * 0.6
                    }
                
               
                
                VStack(alignment: .leading){
                   
                    Text("Launch date: \(mission.formattedLaunchDate)")
                        .padding(.top)
                   
                    MyDevider()
                    Text("Missing Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    MyDevider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom , 5)
                }
                .padding(.horizontal)
                
              

                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            
                
                            NavigationLink(value: crewMember.astronaut.id){
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )
                                    
                                   
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }.navigationDestination(for: String.self){ astronautId in
                                if let astronaut = crew.first(where: { $0.astronaut.id == astronautId })?.astronaut {
                                    AstronautView(astronaut: astronaut)
                                }
                            }
                            
                            
                }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        }
    }
    
}

struct MyDevider :View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .background(.lightBackground)
            .padding(.vertical)
    }
    
}



#Preview {
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
