//
//  SwiftUIView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-03-16.
//

import SwiftUI

struct ResultView: View {
    
    @State var viewModel = ViewModel()
    @State var warmCircle = false
    @State var coolCircle = false
    @State var neutralCircle = false
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 10) {
            warmView()
            coolView()
            neutralView()
        }
    }
    
    @ViewBuilder func warmView() -> some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundStyle(.linearGradient(colors: [.yellow, .green, .red],
                                             startPoint: .top,
                                             endPoint: .bottom))
            .offset(x: warmCircle ? 56 : 0, y: warmCircle ? -100 : 0)
            .scaleEffect(warmCircle ? 2.0 : 1.0)
            .onTapGesture {
                withAnimation(.spring(response: 1.0)) {
                    warmCircle.toggle()
                }
            }
    }
    
    @ViewBuilder func coolView() -> some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundStyle(.linearGradient(colors: [.purple, .blue, .pink],
                                             startPoint: .top,
                                             endPoint: .bottom))
            .offset(x: coolCircle ? 0 : 0, y: coolCircle ? -100 : 0)
            .scaleEffect(coolCircle ? 2.0 : 1.0)
            .onTapGesture {
                withAnimation(.spring(response: 1.0)) {
                    coolCircle.toggle()
                }
            }
    }
    
    @ViewBuilder func neutralView() -> some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundStyle(.linearGradient(colors: [.brown, .white, .black],
                                             startPoint: .top,
                                             endPoint: .bottom))
            .offset(x: neutralCircle ? -56 : 0, y: neutralCircle ? -100 : 0)
            .scaleEffect(neutralCircle ? 2.0 : 1.0)
            .onTapGesture {
                withAnimation(.spring(response: 1.0)) {
                    neutralCircle.toggle()
                }
            }
    }
}




struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
                ResultView()
    }
}



//nedan är extramaterial som jag använt tidigare men ej vet om det ska vara med i appen.
//    var colorItems = Array(1...50).map({"Pic \($0)"})
//    var layout = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]

//                LazyVGrid(columns: layout, content: {
