//
//  ViewController.swift
//  PlaguePrevent
//
//  Created by Johannes on 20.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout

class GameViewController: UIViewController {

    @IBOutlet var measuresCollectionView: UICollectionView!
    @IBOutlet private var stickySplitLayout: CSStickyHeaderFlowLayout!
    private var header: HeaderCollectionReusableView?
    
    private var measurePackage = MeasurePackage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerNib = UINib(nibName: "HeaderCollectionReusableView", bundle: .main)
        measuresCollectionView.register(headerNib, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: "HeaderForCollectionViewID")
        measuresCollectionView.register(UINib.init(nibName: "MeasuresCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MeasuresCellID")
        measuresCollectionView.collectionViewLayout = stickySplitLayout
        stickySplitLayout.parallaxHeaderAlwaysOnTop = true        
    }

    override func viewDidLayoutSubviews() {
        stickySplitLayout.parallaxHeaderReferenceSize = CGSize.init(width: measuresCollectionView.frame.width, height: 450) // set only after collectionview has been lyouted
        stickySplitLayout.parallaxHeaderMinimumReferenceSize = CGSize.init(width: measuresCollectionView.frame.width, height: 300)
    }
    

    
}

// MARK: - UICollectionViewDataSource

extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return measurePackage.allMeasures().count // Number of measure types
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeasuresCellID", for: indexPath) as! MeasuresCollectionViewCell
        let measure = measurePackage.allMeasures()[indexPath.row]
        
        cell.textLabel.text = measure.shortTitle()
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.imageView.image = measure.titleImage()
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension GameViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            case CSStickyHeaderParallaxHeader:
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: CSStickyHeaderParallaxHeader,
                                                                           withReuseIdentifier: "HeaderForCollectionViewID",
                                                                           for: indexPath) as! HeaderCollectionReusableView
                header = cell
                DispatchQueue.main.async {
                    self.header?.addCasesCard()
                    self.header?.addPopulationCard()
                }
                return cell
            default:
                assertionFailure("other kinds not implemented")
                return UICollectionReusableView()
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let measure = measurePackage.allMeasures()[indexPath.row]
        let popup = measure.popUp()
        present(popup, animated: true, completion: nil)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
}

