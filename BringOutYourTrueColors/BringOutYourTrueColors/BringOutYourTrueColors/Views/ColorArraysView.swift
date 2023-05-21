//
//  ColorArraysView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-04-26.
//

import SwiftUI
import Firebase

struct ColorArraysView: View {
    
    @State var isColorblindMode: Bool
    @State var viewModelArrays: ViewModelArrays
    
    var db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack(spacing: 50) {
                    Spacer()
                    Text("Varma färger").font(.title2).fontWeight(.bold)
                    ScrollView(.horizontal) {
                        HStack(spacing: 70) {
                            Spacer()
                            ForEach(viewModelArrays.warmImages, id: \.self) { imageName in
                                Image(imageName)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .modifier(ColorblindModeModifier(isColorblindMode: $isColorblindMode))
                            }
                        }
                    }
                    
                    Text("Kalla färger").font(.title2).fontWeight(.bold)
                    ScrollView(.horizontal) {
                        HStack(spacing: 70) {
                            Spacer()
                            ForEach(viewModelArrays.coolImages, id: \.self) { imageName in
                                Image(imageName)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .modifier(ColorblindModeModifier(isColorblindMode: $isColorblindMode))
                            }
                        }
                    }
                    
                    Text("Neutrala färger").font(.title2).fontWeight(.bold)
                    ScrollView(.horizontal) {
                        HStack(spacing: 70) {
                            Spacer()
                            ForEach(viewModelArrays.neutralImages, id: \.self) { imageName in
                                Image(imageName)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .modifier(ColorblindModeModifier(isColorblindMode: $isColorblindMode))
                            }
                        }
                        Spacer()
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
//                från 18/5
//                om det skulle behövas så vill jag konvertera färgerna så att färgblinda lättare kan se
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isColorblindMode.toggle()
                            }) {
                                Text(isColorblindMode ? "Vanlig färgskala" : "Annan färgskala")
                                    .foregroundColor(.black)
                            }
                        }
                        
                    }
          
                Text("Hjälpte tipsen dig?")
                HStack {
                    Button(action: {
                        db.collection("Firebase Collection").addDocument(data: ["Svar" : "Ja"])
                    }, label: {
                        Text("Ja")
                    }).foregroundColor(.gray)
                    
                    Button(action: {
                        db.collection("Firebase Collection").addDocument(data: ["Svar" : "Nej"])
                    }, label: {
                        Text("Nej")
                    }).foregroundColor(.gray)
                }
            }
        }
    }
}

struct ColorblindModeModifier: ViewModifier {
    
    @Binding var isColorblindMode: Bool
    func body(content: Content) -> some View {
        if isColorblindMode {
            return AnyView(content.colorInvert())
        } else {
            return AnyView(content)
        }
    }
}


struct ColorArraysView_Previews: PreviewProvider {
    static var previews: some View {
        ColorArraysView(isColorblindMode: false, viewModelArrays: ViewModelArrays())
    }
}
