//
//  LiveTickerLabel.swift
//  PlaguePrevent
//
//  Created by Johannes on 22.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class LiveTickerLabel: MarqueeLabel {

    private var canSetTextDirectly = true
    
    var liveTickerMessages = [String]() {
        didSet {
            checkForText()
        }
    }
    
    func addLiveTicker(text: String, duration: TimeInterval) {
        guard text != "" else {return}
        liveTickerMessages.append(text)
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { (timer) in
            if let index = self.liveTickerMessages.firstIndex(of: text) {
                self.liveTickerMessages.remove(at: index)
            }
        }
    }

    private func checkForText() {
        if canSetTextDirectly {
            buildText()
        }
        
    }
    
    private func buildText() {
        canSetTextDirectly = false
        if liveTickerMessages.count > 1 {
            text = liveTickerMessages.joined(separator: " +++ ") + " +++ "
            isHidden = false
        } else if liveTickerMessages.count == 1 {
            text = " +++ " + liveTickerMessages.first!
            isHidden = false
        } else if liveTickerMessages.count == 0 {
            text = "Live Ticker" // not empty or autolayout crashes
            isHidden = true
            canSetTextDirectly = true
        }
    }
    
    override func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        super.animationDidStop(anim, finished: flag)
        canSetTextDirectly = true
        buildText()
        
    }
    
}
