//
//  GameViewController.swift
//  GameCenterGame iOS
//
//  Created by Kim, Min Ho on 2021/08/06.
//

import UIKit
import RealityKit

class GameViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
