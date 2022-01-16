//
//  ContentView.swift
//  Drawing SwiftUI
//
//  Created by Владимир Рябов on 15.01.2022.
//

import SwiftUI

struct Flower: Shape {
    //20 point away from the center
    var petalOffSet = -20.0
    //how wide is one petal
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        //all the petals
        var path = Path()
        
        //когда идет цикл он ставит точку каждый пи / 8
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 16) {
            //точка остается ось вращается или наоборот афинная трансформация
            let rotation = CGAffineTransform(rotationAngle: number)
            //объединение объединяет 2 афинный трансформации в нашем случае повернуть и сдвинуть
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffSet, y: 0, width: petalWidth, height: rect.width / 2))
            //применяем поворот и позицию
            let rotatedPetal = originalPetal.applying(position)
            
            //добавляем это к нашей дорожке
            path.addPath(rotatedPetal)
        }
        return path
    }
}


struct ContentView: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    
    var body: some View {
        VStack {
            Flower(petalOffSet: petalOffset, petalWidth: petalWidth)
                .fill(.blue, style: FillStyle(eoFill: true, antialiased: false))
//                .stroke(.red, lineWidth: 1)
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
              
            Text("Width")
            Slider(value: $petalWidth, in: -200...200)
            
        }
        .padding([.horizontal, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
