//
//  ContentView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI
import Firebase

struct StartView: View {
    
    @State var viewModel: ViewModel
    @State var isAppStarted: Bool = false
    
    // lägger till variabeln db för connection med databas. 2/5
    var db = Firestore.firestore()
    
    var body: some View {
        VStack {
            ifAppStartView()
        }
    }
    
    @ViewBuilder func ifAppStartView() -> some View {
        VStack {
            Spacer()
            if !isAppStarted {
                AppStartView(isAppStarted: $isAppStarted)
                    .onTapGesture {
                        withAnimation {
                            self.isAppStarted = true
                        }
                    }
            } else {
                CustomTabBar()
            }
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    struct AppStartView: View {
        @Binding var isAppStarted: Bool
        @State var isAnimating = false
        
        var body: some View {
            VStack {
                Button(action: {
                    withAnimation {
                        self.isAppStarted = true
                    }
                }) {
                    Image("AppName")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .scaleEffect(isAnimating ? 0.4 : 0.1)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2.0)) {
                                self.isAnimating = true
                            }
                        }
                }
            }.background(.black)
        }
    }
}

struct HomeView: View {
    
    //    nedan är från 21/5
    @State var isShowingWarmView = false
    @State var isShowingCoolView = false
    @State var isShowingNeutralView = false
    //
    
    var body: some View {
        //        ScrollView() {
        NavigationView {
            VStack {
                Spacer()
                Text("Gaia skapades för dig som vill få vägledning om vilka färger som framhäver dina egna naturliga färger på bästa sätt.")
                        .font(.title)
                        .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Button(action: {
                            isShowingWarmView = true
                        }) {
                            Text("Varm hudton")
                                .foregroundColor(.black)
                        }  .sheet(isPresented: $isShowingWarmView) {
                            warmInfoView()
                            
                        }
                        
                        Button(action: {
                            isShowingCoolView = true
                        }) {
                            Text("Kall hudton")
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $isShowingCoolView) {
                            coolInfoView()
                        }
                        
                        Button(action: {
                            isShowingNeutralView = true
                        }) {
                            Text("Neutral hudton")
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $isShowingNeutralView) {
                            neutralInfoView()
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder func warmInfoView() -> some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Varm").font(.title2).fontWeight(.bold)
            Text("En vanlig frågeställning")
            Text("Kan jag bära blåa kläder fastän jag har varma färger?...").fontWeight(.thin)
            Text("Ja det kan du. Varm hudton är gul, olivfärgad eller persikofärgad och blodådror syns som gröna. Guldaktiga färger smälter in bra med hudtonen. Vanliga hårfärger är jordgubbsblond, röd, brun eller svart. Var man rödlätt som barn så är man en varm person. Enligt årstidssystemet tillhör en varm person vår och höst som är den varma färgskalan. Blåa färger kan faktiskt vara både varma och kalla och det bästa för dig som har en varm hudton är att välja en varmare blå nyans för bästa resultat.")
        }.frame(maxWidth: 300, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder func coolInfoView() -> some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Kall").font(.title2).fontWeight(.bold)
            Text("En vanlig frågeställning")
            Text("Kan jag färga håret rött då min hudton är kall?...").fontWeight(.thin)
            Text("Kall gudton är rosig eller blåtonad och blodådror syns som blåa. Silvriga färger passar bra med hudtonen. Håret kan vara blont, brunt, svart, askigt eller silvrigt men aldrig med röda reflexer så därför passar inte kalla personer i röda hårfärger. Enligt årstidssystemet tillhör en kall person sommar och vinter vilket är den kalla färgskalan.")
        }.frame(maxWidth: 300, maxHeight: .infinity, alignment: .center)
    }
    
    @ViewBuilder func neutralInfoView() -> some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Neutral").font(.title2).fontWeight(.bold)
            Text("En vanlig frågeställning")
            Text("Kan man kombinera grått och beige?...").fontWeight(.thin)
            Text("Ja det kan man. En neutral hudton passar varken bättre i kalla eller varma färger vilket innebär att personen har ungefär lika mycket kalla som varma pigment och bör använda neutrala färger som innebär att undvika färger som är för varma eller för kalla. Det går bra att kombinera grått och beige och det bästa tipset är att välja beige närmast ansiktet ifall dina färger är mer åt det varma hållet och grått närmast ansiktet om dina färger är aningen kallare för bästa framhävning.")
        }.frame(maxWidth: 300, maxHeight: .infinity, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: ViewModel())
        //        HomeView()
    }
}
