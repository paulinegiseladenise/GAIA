//
//  ContentView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI
// importerar firebase 2/5
import Firebase
//

// göra en splashscreeb med loggan??
struct StartView: View {
    
    @State var viewModel: ViewModel
    @State var isAppStarted: Bool = false
    
// lägger till variabeln db för connection med databas. 2/5
    var db = Firestore.firestore()
//
    
    
//    gör om nedan till viewbuilderfunktioner...
    var body: some View {
        VStack {
            // lägger till en knapp för att kunna koppla appen med firebase databasen.
                        Button(action: {
                            db.collection("Firebase Collection").addDocument(data: ["Namn" : "Pauline"])
                        }, label: {
                            Text("Add to FireStore")
                        }).foregroundColor(.gray)
            //
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
                Text("GAIA")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .scaleEffect(isAnimating ? 5.0 : 1.0)
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            Text("Vad är GAIA").font(.largeTitle).bold()
            Text("Gaia skapades för dig som vill få vägledning om vilka färger som framhäver dina egna naturliga färger på bästa sätt.")
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                StartView(viewModel: ViewModel())
//        HomeView()
    }
}


//nedan vet jag inte om jag ska ha med i appen eller inte.
//                Image("AppIcon")
//                NavigationLink(destination: InfoView(),
//                               isActive: $showInfoView,
//                               label: {
//                })
