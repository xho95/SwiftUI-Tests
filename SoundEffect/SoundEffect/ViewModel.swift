//
//  ViewModel.swift
//  SoundEffect
//
//  Created by Kim, Min Ho on 2022/02/16.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var effect: SoundManager
    
    init(effect: SoundManager = SoundManager.instance) {
        self.effect = effect
    }
    
    func play() {
        self.effect.play()
    }
}
