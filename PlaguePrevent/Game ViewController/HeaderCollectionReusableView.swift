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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    
    private var cards = [UIView]()
    
    var casesCard: CasesCard?
    var populationcard: PopulationCard?
    
    var liveTickerMessages = [String]() {
        didSet {
            topLabel.text = liveTickerMessages.joined(separator: " +++ ")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topLabel.labelize = false
        topLabel.type = .continuous
        topLabel.animationDelay = 0
        topLabel.speed = .rate(70)
        topLabel.animationCurve = .linear
        topLabel.fadeLength = 0
        topLabel.restartLabel()
        scrollView.delegate = self
    }
    

    func addPopulationCard() {
        let card = PopulationCard.init(frame: scrollView.frame)
        populationcard = card
        addCard(card: card)
    }
    
    func addCasesCard() {
        let card = CasesCard.init(frame: scrollView.frame)
        casesCard = card
        addCard(card: card)
    }
    
    private func addCard(card: UIView) {
        scrollView.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false

        let widthConstraint = NSLayoutConstraint.init(item: card, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint.init(item: card, attribute: .height, relatedBy: .equal, toItem: scrollView, attribute: .height, multiplier: 1, constant: 0)
        let newCenterX = CGFloat(cards.count)*scrollView.frame.width
        let centerX = NSLayoutConstraint.init(item: card, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: newCenterX)
        let centerY = NSLayoutConstraint.init(item: card, attribute: .centerY, relatedBy: .equal, toItem: scrollView, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, centerY, centerX])
        
        let newContentWidth = scrollView.frame.size.width*CGFloat(cards.count+1)
        scrollView.contentSize = CGSize.init(width: newContentWidth, height: scrollView.frame.size.height)
        cards.append(card)
        updatePageControl()
    }
    
    func updatePageControl() {
        pageControl.numberOfPages = cards.count
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = pageIndex
    }
    
}

extension HeaderCollectionReusableView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updatePageControl()
    }
}
