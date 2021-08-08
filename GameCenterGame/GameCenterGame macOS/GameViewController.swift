//
//  GameViewController.swift
//  GameCenterGame macOS
//
//  Created by Kim, Min Ho on 2021/08/06.
//

import AppKit
import RealityKit

class GameViewController: NSViewController {
    
    @IBOutlet var arView: ARView!
    
    override func awakeFromNib() {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
