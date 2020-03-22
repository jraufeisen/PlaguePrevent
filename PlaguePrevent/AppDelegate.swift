//
//  AppDelegate.swift
//  PlaguePrevent
//
//  Created by Johannes on 20.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let ab = GesuchteWerte.init(n_gesund: 8000000, n_infiziert: 30000, n_gefallen: 0, n_genesen: 0)
        let sim = Simulation.init(anfangswerte: ab)
        let values = sim.simulate(dx: 0.1, end: 700)
        
        let infected = values.map { (gesuchtewerte) -> Double in
            return gesuchtewerte.n_infiziert
        }
        var text = ""
        for i in 0..<infected.count {
            let y = infected[i]
            text += "\(y)\n"
        }
        //print(text)
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

