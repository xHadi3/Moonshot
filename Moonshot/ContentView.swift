//
//  ContentView.swift
//  Moonshot
//
//  Created by Hadi Al zayer on 06/07/1446 AH.
//

import SwiftUI



struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
   
    @AppStorage("showingGrid") private var showGrid = false
    
    var body: some View {
        NavigationStack {
            Group{
                if showGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                }else{
                    ListLayout(missions: missions, astronauts: astronauts)
                    
                }
            }
            .toolbar{
            ToolbarItem{
                Button{
                    showGrid.toggle()
                }  label: {
                    if showGrid {
                        Label("show as table", systemImage: "list.dash")
                    }else{
                        Label("Show as grid", systemImage: "square.grid.2x2")}
                    }
            }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
               
        }
      
    }
    
}

#Preview {
    ContentView()
}
