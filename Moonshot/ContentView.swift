//
//  ContentView.swift
//  Moonshot
//
//  Created by Hadi Al zayer on 06/07/1446 AH.
//

import SwiftUI

struct User : Codable{
    let name : String
    let adress : Adress
}

struct Adress : Codable{
    let street : String
    let city : String
    
}


struct ContentView: View {
    var body: some View {
        Button("Decode JSON"){
            let input = """
                        {
                        "name": "Tyler swift"
                        "adress": {
                        "street": "555 , tyler swift avenue"
                        "city": "nashville"
                        }
                        
                        }
                        """
             let decode = JSONDecoder()
             let data = Data(input.utf8)
            
            if let user = try? decode.decode(User.self, from: data){
                print(user.adress.street)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
