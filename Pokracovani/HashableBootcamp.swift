//
//  HashableBootcamp.swift
//  Pokracovani
//
//  Created by Tomáš Jakubec on 18.08.2023.
//

import SwiftUI


struct MyCustomModel: Hashable {
//    let id = UUID().uuidString
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "one"),
        MyCustomModel(title: "two"),
        MyCustomModel(title: "three"),
        MyCustomModel(title: "four"),
        MyCustomModel(title: "five"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {

                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
