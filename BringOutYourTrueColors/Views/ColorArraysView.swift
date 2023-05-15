//
//  ColorArraysView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-04-26.
//

import SwiftUI

struct ColorArraysView: View {
    
    @State var isColorblindMode = false
    @State var viewModelArrays: ViewModelArrays
    
    var body: some View {
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
                .navigationBarItems(trailing: Button (action: { isColorblindMode.toggle()
                }, label: {
                    Text(isColorblindMode ? "Regular Mode" : "Colorblind mode")
                }))
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
//        .padding(.top, 50)
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
        ColorArraysView(viewModelArrays: ViewModelArrays())
    }
}




//nedan, var i den här filen från början men skapade en ny viewmodel som heter viewmodelarrays som är den här filen viewmodel. vill separera viewmodels i mitt projekt för bättre överblick.
//    var coolImages = ["KSvart", "KGrå", "KLjusgrå", "KVit", "KMörkblå", "KGrön", "KLila", "KCerise", "KRosa"]
//    var warmImages = ["VMörkbrun", "VLjusbrun", "VLatte", "VBeige", "VOlivgrön", "VLjusgrön", "VRöd", "VRödrosa", "VGul"]
//    var neutralImages = ["NMörkgrå", "NLjusgrå", "NVit", "NMörkblå", "NLjusblå", "NMörkgrön", "NLjusgrön", "NRosaröd", "NGul"]
