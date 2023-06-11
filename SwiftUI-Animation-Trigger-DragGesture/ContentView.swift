//
//  ContentView.swift
//  SwiftUI-Animation-Trigger-DragGesture
//
//  Created by ekayaint on 11.06.2023.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var menuOffset : CGSize = .zero
    
    @State private var currentMenuY : CGFloat = 0.0
    var body: some View {
        VStack {
            Text("Triggers").font(.largeTitle)
            Text("Drag Gesture").font(.title).foregroundColor(.gray)
            
            Spacer()
            
            VStack {
                Circle().fill(Color.green)
                    .frame(width: 100, height: 100)
                    .overlay(Image(systemName: "line.horizontal.3").foregroundColor(.white)
                        .offset(y: -20)
                    )
                    .offset(y: -50)
                
                HStack {
                    Spacer()
                }
                Spacer()
            }.frame(height: 200)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
                .offset(y: currentMenuY + menuOffset.height)
                .gesture(
                    DragGesture()
                        .updating($menuOffset, body: { (value, mOfs, transaction) in
                            mOfs = value.translation
                            
                        })
                        .onEnded({value in
                            if value.translation.height > 100 {
                                currentMenuY = 200 //closed
                            } else {
                                currentMenuY = 0 //open
                            }
                            
                        })
                )
                .animation(.default, value: menuOffset)
            
        }
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
