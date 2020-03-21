//
//  Simulation.swift
//  PlaguePrevent
//
//  Created by Johannes on 21.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import Foundation

struct GesuchteWerte {
    var n_gesund: Double
    var n_infiziert: Double
    var n_gefallen: Double
    var n_genesen: Double
    
    static func *(lhs: Double, rhs: GesuchteWerte) -> GesuchteWerte {
        let new_gesund = rhs.n_gesund * lhs
        let new_infiziert = rhs.n_infiziert * lhs
        let new_gefallen = rhs.n_gefallen * lhs
        let new_genesen = rhs.n_genesen * lhs
        return GesuchteWerte.init(n_gesund: new_gesund, n_infiziert: new_infiziert, n_gefallen: new_gefallen, n_genesen: new_genesen)
    }
    
    static func /(lhs: GesuchteWerte, rhs: Double) -> GesuchteWerte {
        let new_gesund = lhs.n_gesund / rhs
        let new_infiziert = lhs.n_infiziert / rhs
        let new_gefallen = lhs.n_gefallen / rhs
        let new_genesen = lhs.n_genesen / rhs
        return GesuchteWerte.init(n_gesund: new_gesund, n_infiziert: new_infiziert, n_gefallen: new_gefallen, n_genesen: new_genesen)
    }

    static func +(lhs: GesuchteWerte, rhs: GesuchteWerte) -> GesuchteWerte {
        let new_gesund = lhs.n_gesund + rhs.n_gesund
        let new_infiziert = lhs.n_infiziert + rhs.n_infiziert
        let new_gefallen = lhs.n_gefallen + rhs.n_gefallen
        let new_genesen = lhs.n_genesen + rhs.n_genesen
        return GesuchteWerte.init(n_gesund: new_gesund, n_infiziert: new_infiziert, n_gefallen: new_gefallen, n_genesen: new_genesen)
    }

    
}

class Simulation {
    
    typealias SimulationsFunktion = (Double, GesuchteWerte, MeasurePackage)->GesuchteWerte
    

    private var dx = 0.1 /// Simluation step size
    var y_values = [GesuchteWerte]() /// This will contain the values for each time step
    private var anfangswerte: GesuchteWerte
    
    init(anfangswerte: GesuchteWerte) {
        self.anfangswerte = anfangswerte
        y_values.append(anfangswerte)
    }
    
    // Runge Kutta Algorithm of 4th order
    private func rk4(dx: Double, x: Double, y: GesuchteWerte, measures: MeasurePackage, f: SimulationsFunktion) -> GesuchteWerte {
        let k1 = dx * f(x, y, measures)
        let k2 = dx * f(x + dx / 2, y + k1 / 2, measures)
        let k3 = dx * f(x + dx / 2, y + k2 / 2, measures)
        let k4 = dx * f(x + dx, y + k3, measures)
        return y + (k1 + 2 * k2 + 2 * k3 + k4) / 6
    }

    
    var Ki: Double = 0.5
    var Kg: Double = 3
    var mort_care: Double = 0.003; // Sterblichkeitsrate mit Behandlung
    var mort_nocare: Double = 0.9; // Sterblichkeitsrate ohne Behandlung
    var h_capacity: Double = 1500000; // Krankenhaus KapazitÃ¤
    var krankheitsdauer: Double = 21.0; // Nachwievielen Tagen ist die Krankheit abgeklungen
    var risk_g: Double = 0.2; // Ansteckungsrisiko einer gesunden Person
    var risk_h: Double = 0.03; // Ansteckungsrisiko einer genesenen Person

    
    let operating_cost_health = 10000 // Laufende Ausgaben fuer ein Krankenbett
    let capital_cost_health = 40000000 // Kapitalkosten fuer ein Krankenbett

    
    
    private func simulationStep(t: Double, y: GesuchteWerte, measures: MeasurePackage = MeasurePackage()) -> GesuchteWerte {
        let health_cost = Double(measures.health.money) // Ausgaben fuer Gesundheitssystem
        let research_cost = Double(measures.science.money);// Ausgaben fuer Forschung
        let fiscal_support = Double(measures.economicHelps.money) // Wirtschaftshilfen des Staates - Sozialismus
        let GDP = 2000000000000;

        var grenzschutz = 1.15
        var fernverkehr = 1.1
        var nahverkehr = 1.1
        var arbeit = 1.1
        var ausgang = 1.1
        var geschaefte = 0.5
        
        // Now take into account the measures
        switch measures.border {
        case .open: grenzschutz = 1
        case .noTourists: grenzschutz = 1.05
        case .goodsOnly: grenzschutz = 1.15
        case .closed: grenzschutz = 2
        }
        
        switch measures.ausgangssperre {
        case .active: ausgang = 2
        case .inactive: ausgang = 1
        case .sperrstunden: ausgang = 1.5
        }
        
        switch measures.work {
        case .asUsual: arbeit = 1
        case .homeOfficeWherePossible: arbeit = 1.1
        case .homeOfficeEverywhere: arbeit = 2
        }
        
        switch measures.business {
        case .supermarketOnly: geschaefte = 0
        case .restrictedClosingHours: geschaefte = 0.25
        case .businessAsUsual: geschaefte = 0
        }
        

        
        
        let part1 = -(Ki * y.n_infiziert / (Kg*(y.n_gesund+y.n_genesen)+Ki*y.n_infiziert ))
        let part2 = Kg*risk_g*y.n_gesund
        let f_gesund = part1 * part2
     
        let part3 = Kg*(y.n_gesund+y.n_genesen)+Ki*y.n_infiziert
        let part4 = -y.n_infiziert / krankheitsdauer
        let part10 = Kg*(risk_g*y.n_gesund + risk_h * y.n_genesen)
        let f_infiziert = part4 + (Ki*y.n_infiziert / (part3)) * part10
        
        let part5 = y.n_infiziert * mort_nocare - h_capacity
        let part6 = max((part5),0) + min(h_capacity,y.n_infiziert)
        let f_gefallen = (part6)*mort_care / krankheitsdauer
        
        let part7 = max((y.n_infiziert * mort_nocare - h_capacity),0)
        let part8 = min(h_capacity,y.n_infiziert)
        let part9 = (Ki*y.n_infiziert / (Kg*y.n_gesund+y.n_genesen+Ki*y.n_infiziert))
        let f_genesen = (y.n_infiziert - (part7 + part8)*mort_care) / krankheitsdauer - part9 * Kg*(risk_h*y.n_genesen)
        
        return GesuchteWerte.init(n_gesund: f_gesund, n_infiziert: f_infiziert, n_gefallen: f_gefallen, n_genesen: f_genesen)
    }
    
    // Call this once to receive the complete simulation results
    func simulate(dx: Double, end: Double) -> [GesuchteWerte] {
        let start: Double = 0.0
        let n_steps = Int((end-start)/dx)
        var y_values = [GesuchteWerte]()
        y_values.append(anfangswerte)
        for i in 1...n_steps {
            let newValue = self.rk4(dx: dx, x: dx*Double(i-1), y: y_values[i-1], measures: MeasurePackage(), f: simulationStep )
            y_values.append(newValue)
        }
        
        return y_values
    }
    
    // Call this repeatedly to advance the simulation
    func simulateNextStep() {
        let i = y_values.count
        let newValue = self.rk4(dx: dx, x: dx*Double(i-1), y: y_values[i-1], measures: MeasurePackage(), f: simulationStep )
        y_values.append(newValue)
    }
 
    func currentValue() -> GesuchteWerte {
        return y_values.last!
    }
}
