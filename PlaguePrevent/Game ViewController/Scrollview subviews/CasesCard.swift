//
//  IncomeStatementCard.swift
//  MyBudget
//
//  Created by Johannes on 29.10.19.
//  Copyright © 2019 Johannes Raufeisen. All rights reserved.
//

import UIKit

class CasesCard: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var deathsBarView: BarView!
    @IBOutlet var recoveredBarView: BarView!

    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CasesCard", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds

        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = UIColor.white
        }

        deathsBarView.fillPercent = 0
        recoveredBarView.fillPercent = 0
    }

}
