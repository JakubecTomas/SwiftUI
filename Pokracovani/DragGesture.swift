//
//  DragGesture.swift
//  Pokracovani
//
//  Created by Tomáš Jakubec on 03.08.2023.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offset:CGSize = .zero
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmout())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
            )
        }
    }
    
    func getScaleAmout() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmout = abs(offset.width)
        let percentage = currentAmout / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle

    }
    
}

struct DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
