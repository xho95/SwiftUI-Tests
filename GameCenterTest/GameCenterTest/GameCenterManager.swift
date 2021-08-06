//
//  GameCenterManager.swift
//  GameCenterTest
//
//  Created by Kim, Min Ho on 2021/08/06.
//

import SwiftUI
import UIKit
import GameKit

struct GameCenterManager: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> GameViewController {
        let gameViewController = GameViewController()
        return gameViewController
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {
        //
    }
}

class GameViewController: UIViewController {
    let localPlayer = GKLocalPlayer.local
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateUser()
    }
    
    func authenticateUser() {
        localPlayer.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            if vc != nil {
                self.present(vc!, animated: true, completion: nil)
            }
            
            if #available(iOS 14.0, *) {
                GKAccessPoint.shared.location = .topLeading
                GKAccessPoint.shared.showHighlights = true
                GKAccessPoint.shared.isActive = self.localPlayer.isAuthenticated
            }
        }
    }

}
