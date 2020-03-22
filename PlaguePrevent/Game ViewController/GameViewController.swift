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
    private var simulation: Simulation?
    
    private var tickerStayDuration: TimeInterval = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerNib = UINib(nibName: "HeaderCollectionReusableView", bundle: .main)
        measuresCollectionView.register(headerNib, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: "HeaderForCollectionViewID")
        measuresCollectionView.register(UINib.init(nibName: "MeasuresCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MeasuresCellID")
        measuresCollectionView.collectionViewLayout = stickySplitLayout
        stickySplitLayout.parallaxHeaderAlwaysOnTop = true
        
        let initCondition = GesuchteWerte.init(n_gesund: 8000000, n_infiziert: 30000, n_gefallen: 0, n_genesen: 0, n_krankenhaus: 100000, n_budget: 300000000000, moral: 100)
        simulation = Simulation.init(anfangswerte: initCondition)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            self.simulation?.simulateNextStep(measurePackage: self.measurePackage)
            self.updateUI()
        }
    }

    override func viewDidLayoutSubviews() {
        stickySplitLayout.parallaxHeaderReferenceSize = CGSize.init(width: measuresCollectionView.frame.width, height: 450) // set only after collectionview has been lyouted
        stickySplitLayout.parallaxHeaderMinimumReferenceSize = CGSize.init(width: measuresCollectionView.frame.width, height: 300)
    }
    
    private func updateUI() {
        guard let latestValue = simulation?.currentValue() else {return}
        let infected = latestValue.n_infiziert
        let deaths = latestValue.n_gefallen
        let recovered = latestValue.n_genesen
        header?.bigLabel.text = "\(Int(infected))"
        header?.casesCard?.deathsLabel.text = "\(Int(deaths)) deaths"
        header?.casesCard?.recoveredLabel.text = "\(Int(recovered)) recovered"
        header?.casesCard?.recoveredBarView.fillPercent = CGFloat(recovered/infected)
        header?.casesCard?.deathsBarView.fillPercent = CGFloat(deaths/infected)
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
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            cell.imageView.image = measure.smallLogo().withTintColor(.white)
        case .light:
            cell.imageView.image = measure.smallLogo()
        default:
            print("UI Warning: Unrecognized user trait")
        }
        
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
        let popup = measure.popUp(delegate: self)
        present(popup, animated: true, completion: nil)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 150, height: 150)
    }
}


// MARK: - Change measure package

extension GameViewController: ChangeMeasuresDelegate {
    
    func didChangeEffectiveness(state: MeasureEffectiveness) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.enforcement = state
    }
    
    func didChangeBorder(state: MeasureTypeBorder) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.border = state
    }
    
    func didChangeSchools(state: MeasureTypeSchools) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.school = state
    }
    
    func didChangeTraffic(state: MeasureTypeTraffic) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.traffic = state
    }
    
    func didChangeWork(state: MeasureTypeWork) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.work = state
    }
    
    func didChangeAusgangssperre(state: MeasureTypeAusgangssperre) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.ausgangssperre = state
    }
    
    func didChangeBusinesses(state: MeasureTypeBusinesses) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.business = state
    }
    
    func didChangeCommunication(state: MeasureTypeCommunication) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.communication = state
    }
    
    func didChangeScience(state: ScienceMeasure) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.science = state
    }
    
    func didChangeHealth(state: HealthServicesMeasure) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.health = state
    }
    
    func didChangeEconomics(state: EconomicHelpMeasure) {
        let newTicker = state.instantTickerFeedback()
        header?.addLiveTicker(text: newTicker, duration: tickerStayDuration)
        measurePackage.economicHelps = state
    }
    
    
}

// MARK: - Adopt Dark Mode

extension GameViewController {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateUI()
        measuresCollectionView.reloadData()
    }
    
}
