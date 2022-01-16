//
//  ContentView.swift
//  Drawing SwiftUI
//
//  Created by Владимир Рябов on 15.01.2022.
//

import SwiftUI

struct ContentView: View {
    

    var body: some View {
        VStack {
            Text("Hello world")
                 .frame(width: 300, height: 300)
                 .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 50)
     //            .border(.red, width: 30)
                 .padding()
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), lineWidth: 10)
                
                .frame(width: 300, height: 200)
                .padding()
                
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
