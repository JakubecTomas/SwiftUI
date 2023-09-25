//
//  ArraysBootcamp.swift
//  Pokracovani
//
//  Created by Tomáš Jakubec on 18.08.2023.
//

/*
 schování kusu kódu =     CMD + option + šipka v levo
 vždy schová celý celek - určuje se najetím myši / neoznačovat... pouze najet !! :-)
 
 */

import SwiftUI


struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let point: Int
    let isVarified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
        
    }
    
    func updateFilteredArray() {
        
        // sort
        /* níže jsou dva stejné zápisy
         //        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
         //            return user1.point > user2.point
         //        }
         filteredArray = dataArray.sorted(by: { $0.point > $1.point })
         */
        
        // filter
        /*
         //        filteredArray = dataArray.filter({ (user) -> Bool in
         //            return !user.isVarified
         //        })
         filteredArray = dataArray.filter({ $0.isVarified })
         */
        
        // map
        /*
         //        mappedArray = dataArray.map({ (user) -> String in
         //            return user.name ?? "ERROR"
         //        })
         //mappedArray = dataArray.map({ $0.name })
         
         // ošetření prázdných údajů v poli
         //        mappedArray = dataArray.compactMap({ user -> String? in
         //            return user.name
         //        })
         mappedArray = dataArray.compactMap({ $0.name})
         */
         
        // super krátký zápis - bodově seřazeno od největšího, pouze verifikovaní uživatelé se jménem
        mappedArray = dataArray
            .sorted(by: { $0.point > $1.point })
            .filter({ $0.isVarified })
            .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", point: 5, isVarified: true)
        let user2 = UserModel(name: "Chris", point: 2, isVarified: false)
        let user3 = UserModel(name: nil, point: 8, isVarified: true)
        let user4 = UserModel(name: "Hulk", point: 9, isVarified: false)
        let user5 = UserModel(name: "Peter", point: 2, isVarified: false)
        let user6 = UserModel(name: "Natasha", point: 3, isVarified: true)
        let user7 = UserModel(name: nil, point: 1, isVarified: false)
        let user8 = UserModel(name: "Clint", point: 8, isVarified: true)
        let user9 = UserModel(name: "Loki", point: 7, isVarified: false)
        let user10 = UserModel(name: "Bucky", point: 4, isVarified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
}


struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                
                ForEach(vm.mappedArray, id: \.self) { name in
                        Text(name)
                        .font(.title)
                }
                
                
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.point)")
//                            Spacer()
//                            if user.isVarified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
