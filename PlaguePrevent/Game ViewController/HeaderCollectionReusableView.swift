//
//  HeaderCollectionReusableView.swift
//  
//
//  Created by Johannes on 21.03.20.
//

import UIKit
import MarqueeLabel

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var topLabel: MarqueeLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topLabel.text = "+++ Live Ticker +++ Something happened +++ anything else +++ Wer das liest ist doof +++"
        topLabel.labelize = false

        topLabel.type = .continuous
        topLabel.animationDelay = 0
        topLabel.speed = .rate(70)
        topLabel.animationCurve = .linear
        topLabel.fadeLength = 0

        topLabel.restartLabel()
    }

}

extension UIView {
    
    func snapshot() -> UIImage? {
        layoutIfNeeded()
        updateConstraintsIfNeeded()
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
