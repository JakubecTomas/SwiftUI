//
//  MultipleSheetsBootcamp.swift
//  Pokracovani
//
//  Created by Tomáš Jakubec on 17.08.2023.
//

/*
 
 Více variant jak vyřešit sheets
 1 - Buinding
 2 - Multiple .sheets // pouze v případě, že mám málo do 5 listů !
 3 - $item // nejuniverzálnější - nejlépe rozšířitelné
 
 */

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button number \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                    .padding(20)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .foregroundStyle(.black)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
            
            
            
            
//            Button("Button 1") {
//                selectedModel = RandomModel(title: "one")
//            }
//            Button("Button 2") {
//                selectedModel = RandomModel(title: "two")
//            }
//      }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
                .padding(50)
                .background(Color.green)
                .cornerRadius(20)
        }
       

    }
}

struct NextScreen: View {
    
    // @Binding var selectedModel: RandomModel
     var selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
