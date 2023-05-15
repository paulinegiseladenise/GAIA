//
//  BringOutYourTrueColorsApp.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct BringOutYourTrueColorsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
                StartView(viewModel: ViewModel())
        }
    }
}


