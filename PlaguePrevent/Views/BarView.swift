//
//  BarView.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class BarView: UIView {

    var fillPercent: CGFloat = 0.5 {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        updateFill()
    }
    
    private func updateFill() {
        let cornerRadius = 7
        let fillHeight = bounds.height * fillPercent
        let maskRect = CGRect.init(x: bounds.origin.x, y: bounds.size.height - fillHeight, width: bounds.size.width, height: fillHeight)
        layer.round(roundedRect: maskRect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
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
