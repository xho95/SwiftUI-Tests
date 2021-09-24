//
//  GameCenterManager.swift
//  Authenticate
//
//  Created by Kim, Min Ho on 2021/08/06.
//

import SwiftUI
import UIKit
import GameKit

struct GameCenterManager: UIViewControllerRepresentable {
    let controller = GameViewController()
    
    func makeUIViewController(context: Context) -> GameViewController {
        return controller //GameViewController()
    }
    
    func updateUIViewController(_ uiViewController: GameViewController, context: Context) {
        //
    }
    
    func authenticate() {
        self.controller.authenticateUser()
    }
}

class GameViewController: UIViewController {
    let localPlayer = GKLocalPlayer.local
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.insetsLayoutMarginsFromSafeArea = false
        
        //authenticateUser()
    }
//    
//    override var prefersStatusBarHidden: Bool {
//        true
//    }
    
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
                // GKAccessPoint.shared.location = .topLeading
                GKAccessPoint.shared.showHighlights = true
                //GKAccessPoint.shared.isActive = false
                GKAccessPoint.shared.isActive = self.localPlayer.isAuthenticated
            }
        }
    }
}
