//
//  ContentView.swift
//  UiPractice
//
//  Created by Akhil Chaudhary on 07/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple","cherry","star"]
    @State private var number = [0,1,2]
    private var betAmount = 5

    @State private var credits = 1000

    var body: some View {
        
       
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255)).rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                Spacer()

                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("Swift Ui Slots").foregroundColor(.white).bold()
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.scaleEffect(1.5).padding(.all,20)
                
                
                Spacer()

                
                Text("Credits : " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()

                
                HStack {
                   
                    Spacer()
                    
                    CardView(symbol: $symbols[number[0]])
                  
                    CardView(symbol: $symbols[number[1]])

                    CardView(symbol: $symbols[number[2]])
                    
                    Spacer()
                          
                }
                
                Spacer()
                
                Button(action: {
                    self.credits += 1
                    self.number[0] = Int.random(in: 0...symbols.count-1)
                    
                    self.number[1] = Int.random(in: 0...symbols.count-1)
                    
                    self.number[2] = Int.random(in: 0...symbols.count-1)
                    
                    
                    if self.number[0] == self.number[1] && self.number[1] == self.number[2] {
                        self.credits += self.betAmount * 10
                    }
                    else {
                        self.credits -= self.betAmount
                    }
                    
                }) {
                    Text("Spin")
                    .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading,.trailing],30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }//button
                  
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
    }
}
