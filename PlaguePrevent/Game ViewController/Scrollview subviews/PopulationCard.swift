//
//  IncomeStatementCard.swift
//  MyBudget
//
//  Created by Johannes on 29.10.19.
//  Copyright © 2019 Johannes Raufeisen. All rights reserved.
//

import UIKit

class PopulationCard: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var moralBarView: BarView!
    @IBOutlet var budgetBarView: BarView!
    @IBOutlet var hospitalBarView: BarView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PopulationCard", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        //contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .secondarySystemGroupedBackground
        } else {
            contentView.backgroundColor = UIColor.white
        }

    }

}