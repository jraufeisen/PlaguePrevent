//
//  BarView.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

enum BarOrientation: Int {
    case vertical /// bot to top fill
    case horizontal /// left to right fill
}

@IBDesignable
class BarView: UIView {

    @IBInspectable var cornerRadius = 7 {
        didSet {
            updateFill()
        }
    }
    
    @IBInspectable var alwaysFilledDistance: CGFloat = 0 {
        didSet {
            updateFill()
        }
    }
    
    @IBInspectable var fillPercent: CGFloat = 0.5 {
        didSet {
            fillPercent = min(1,fillPercent)
            fillPercent = max(0,fillPercent)
            updateFill()
        }
    }
    
    var orientation: BarOrientation = .vertical {
        didSet {
            updateFill()
        }
    }
    
    override func awakeFromNib() {
        updateFill()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateFill()
    }
    
    private func updateFill() {
        switch orientation {
        case .vertical:
            let fillHeight = max(alwaysFilledDistance,bounds.height * fillPercent)
            let maskRect = CGRect.init(x: bounds.origin.x, y: bounds.size.height - fillHeight, width: bounds.size.width, height: fillHeight)
            layer.round(roundedRect: maskRect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case .horizontal:
            let fillWidth = max(alwaysFilledDistance,bounds.width * fillPercent)
            let maskRect = CGRect.init(x: bounds.origin.x , y: bounds.origin.y, width: fillWidth, height: bounds.size.height)
            layer.round(roundedRect: maskRect, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))

        }
    }

}

extension CALayer {

    func round(roundedRect rect: CGRect, byRoundingCorners corners: UIRectCorner, cornerRadii: CGSize) -> Void {
        let bp = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let sl = CAShapeLayer()
        sl.frame = self.bounds
        sl.path = bp.cgPath
        self.mask = sl
    }
}
