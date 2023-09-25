//
//  SheetsBootcamp.swift
//  Pokracovani
//
//  Created by Tomáš Jakubec on 17.08.2023.
//

import SwiftUI

struct SheetsBootcamp: View {
    
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
            // zakryje celou obrazovku, nelze skrýt tažením dolů
//            .fullScreenCover(isPresented: $showSheet, content: {
//                SecondScreen()
//            })
            
            // pouze list
            .sheet(isPresented: $showSheet, content: {
            //NIKDY NEPOUŽÍVAT LOGIKU IF/SELSE PRO RŮZNÉ ZOBRAZOVÁNÍ SHEET - POUŽÍT MULTIPLESHEET
                SecondScreen()
                    
                    .padding(.top, 50)
                    .background(.red)
            })
        }
    }
}


// v reálném projektu vlastní soubor
struct SecondScreen: View {
    
    // navrácení na předchozí stránku
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                // navrácení na předchozí stránku
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
                  
            })

        }
    }
}

struct SheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBootcamp()

    }
}
