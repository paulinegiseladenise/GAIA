//
//  TestView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-04-12.
//

import SwiftUI

struct TestView: View {
    
    @State var viewModel = ViewModel()
    @State var isShowingResultView = false
    @State var isShowingColorArraysView = false
  
    var body: some View {
        ScrollView() {
            Spacer()
            ZStack {
                testView()
                showResultView()
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $isShowingResultView) {
            ColorArraysView(isColorblindMode: false, viewModelArrays: ViewModelArrays())
        }
    }
    
    @ViewBuilder func testView() -> some View {
        ZStack {
            
            VStack(spacing: 50) {
                Spacer()
                VStack(spacing: 10) {
                    Text("Vilken ögonfärg har du?").font(.title)
                        .fixedSize()
                    VStack(spacing: 10) {
                        ForEach(0..<viewModel.options[0].count, id: \.self) { index in
                            Button(action: {
                                viewModel = viewModel.selectOption(at: 0, optionIndex: index)
                            }, label: {
                                Text(viewModel.options[0][index])
                            }).foregroundColor(viewModel.optionSelected(optionIndex: index, at: 0) ? Color.black : Color.gray)
                                .disabled(viewModel.allSelectionsMade)
                        }
                    }
                }
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Vilken hårfärg har du?").font(.title).fixedSize()
                    VStack(spacing: 10) {
                        ForEach(0..<viewModel.options[1].count, id: \.self) { index in
                            Button(action: {
                                viewModel = viewModel.selectOption(at: 1, optionIndex: index)
                            }, label: {
                                Text(viewModel.options[1][index])
                            }).foregroundColor(viewModel.optionSelected(optionIndex: index, at: 1) ? Color.black : Color.gray)
                        }
                    }
                }
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Vilken metall passar du bäst i?").font(.title)
                        .fixedSize()
                    VStack(spacing: 10) {
                        ForEach(0..<viewModel.options[2].count, id: \.self) { index in
                            Button(action: {
                                viewModel = viewModel.selectOption(at: 2, optionIndex: index)
                            }, label: {
                                Text(viewModel.options[2][index])
                            }).foregroundColor(viewModel.optionSelected(optionIndex: index, at: 2) ? Color.black : Color.gray)
                        }
                    }
                }
                Spacer()
            }
            .blur(radius: viewModel.calculateResult() != nil ? 20 : 0)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder func showResultView() -> some View {
        VStack(spacing: 30) {
            if let result = viewModel.calculateResult() {
                
                if result == "Dina färger är varma" {
                    VStack {
                        Text(result).font(.title).multilineTextAlignment(.center)
                    }
                } else if result == "Dina färger är kalla" {
                    VStack {
                        Text(result).font(.title).multilineTextAlignment(.center)
                    }
                } else if result == "Dina färger är neutrala" {
                    VStack {
                        Text(result).font(.title).multilineTextAlignment(.center)
                    }
                }
            }
            
            if viewModel.calculateResult() != nil {
                VStack {
                    Button(action: {
                        viewModel = viewModel.resetTest()
                    }, label: {
                        Text("Börja om")
                            .bold()
                            .frame(width: 200, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(radius: 3)
                            .disabled(!viewModel.allSelectionsMade)
                    })
                    
                    
                    Button(action: {
                        isShowingColorArraysView = true
                    }) {
                        Text("Läs mer här...")
                    }
                    .bold()
                    .frame(width: 200, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 3)
                }
                .sheet(isPresented: $isShowingColorArraysView) {
                    ColorArraysView(isColorblindMode: false, viewModelArrays: ViewModelArrays())
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
