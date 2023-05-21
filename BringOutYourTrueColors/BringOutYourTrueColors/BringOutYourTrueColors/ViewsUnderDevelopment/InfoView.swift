//
//  HomepageView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//
//
//import SwiftUI
//
//struct InfoView: View {
//
//    @State var viewModel = ViewModel()
//
//    var body: some View {
//        ScrollView() {
//            VStack(spacing: 30) {
//          Spacer()
//            Text("Kall eller varm?").font(.largeTitle)
//                .fontWeight(.bold)
//            VStack(spacing: 10) {
//                Text("Enkelt sagt så bör varma personer ha varma färger och kalla personer kalla färger. Mellantinget kallas neutrala personer som inte bör ha färger som är för varma eller kalla.")
//                    .font(.headline)
//            }
//            Spacer()
//               Spacer()
//                VStack(alignment: .center, spacing: 20) {
//                    Text("Varm").font(.title2).fontWeight(.bold)
//                    Text("Kan jag bära blåa kläder fastän jag har varma färger?...").fontWeight(.thin)
//                    Text("Varm hudton är gul, olivfärgad eller persikofärgad och blodådror syns som gröna. Guldaktiga färger smälter in bra med hudtonen. Vanliga hårfärger är jordgubbsblond, röd, brun eller svart. Var man rödlätt som barn så är man en varm person. Enligt årstidssystemet tillhör en varm person vår och höst som är den varma färgskalan. Blåa färger kan faktiskt vara både varma och kalla och det bästa för dig som har en varm hudton är att välja en varmare blå nyans för bästa resultat.")
//                }
//                Spacer()
//                VStack(alignment: .center, spacing: 20) {
//                    Text("Kall").font(.title2).fontWeight(.bold)
//                    Text("Kan jag färga håret rött då min hudton är kall?...").fontWeight(.thin)
//                    Text("Kall gudton är rosig eller blåtonad och blodådror syns som blåa. Silvriga färger passar bra med hudtonen. Håret kan vara blont, brunt, svart, askigt eller silvrigt och aldrig med röda reflexer. Enligt årstidssystemet tillhör en kall person sommar och vinter vilket är den kalla färgskalan.")
//                }
//                Spacer()
//                VStack(alignment: .center, spacing: 20) {
//                    Text("Neutral").font(.title2).fontWeight(.bold)
//                    Text("Kan man kombinera grått och beige?...").fontWeight(.thin)
//                    Text("En neutral hudton passar varken bättre i kalla eller varma färger vilket innebär att personen har ungefär lika mycket kalla som varma pigment och bör använda neutrala färger som innebär att undvika färger som är för varma eller för kalla. Det går bra att kombinera grått och beige och det bästa tipset är att välja beige närmast ansiktet ifall dina färger är mer åt det varma hållet och grått närmast ansiktet om dina färger är aningen kallare för bästa framhävning.")
//                }
//            }
//        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoView()
//    }
//}
