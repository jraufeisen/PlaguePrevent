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
    
    var n_krankenhaus: Double
    var n_budget: Double
    var moral: Double
    
    static func *(lhs: Double, rhs: GesuchteWerte) -> GesuchteWerte {
        let new_gesund = rhs.n_gesund * lhs
        let new_infiziert = rhs.n_infiziert * lhs
        let new_gefallen = rhs.n_gefallen * lhs
        let new_genesen = rhs.n_genesen * lhs
        
        let new_krankenhaus = rhs.n_krankenhaus * lhs
        let new_budget = rhs.n_budget * lhs
        let new_moral = rhs.moral * lhs
        return GesuchteWerte.init(n_gesund: new_gesund, n_infiziert: new_infiziert, n_gefallen: new_gefallen, n_genesen: new_genesen, n_krankenhaus: new_krankenhaus, n_budget: new_budget, moral: new_moral)
    }
    
    static func /(lhs: GesuchteWerte, rhs: Double) -> GesuchteWerte {
        let new_gesund = lhs.n_gesund / rhs
        let new_infiziert = lhs.n_infiziert / rhs
        let new_gefallen = lhs.n_gefallen / rhs
        let new_genesen = lhs.n_genesen / rhs
        
        let new_krankenhaus = lhs.n_krankenhaus / rhs
        let new_budget = lhs.n_budget / rhs
        let new_moral = lhs.moral / rhs

        return GesuchteWerte.init(n_gesund: new_gesund, n_infiziert: new_infiziert, n_gefallen: new_gefallen, n_genesen: new_genesen, n_krankenhaus: new_krankenhaus, n_budget: new_budget, moral: new_moral)
    }

    static func +(lhs: GesuchteWerte, rhs: GesuchteWerte) -> GesuchteWerte {
        let new_gesund = lhs.n_gesund + rhs.n_gesund
        let new_infiziert = lhs.n_infiziert + rhs.n_infiziert
        let new_gefallen = lhs.n_gefallen + rhs.n_gefallen
        let new_genesen = lhs.n_genesen + rhs.n_genesen
        let new_krankenhaus = lhs.n_krankenhaus + rhs.n_krankenhaus
        let new_budget = lhs.n_budget + rhs.n_budget
        let new_moral = lhs.moral + rhs.moral

        return GesuchteWerte.init(n_gesund: new_gesund, n_infiziert: new_infiziert, n_gefallen: new_gefallen, n_genesen: new_genesen, n_krankenhaus: new_krankenhaus, n_budget: new_budget, moral: new_moral)
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
    var mort_care: Double = 0.03; // Sterblichkeitsrate mit Behandlung
    var mort_nocare: Double = 0.09; // Sterblichkeitsrate ohne Behandlung
    var krankheitsdauer: Double = 21.0; // Nachwievielen Tagen ist die Krankheit abgeklungen
    var risk_g: Double = 0.2; // Ansteckungsrisiko einer gesunden Person
    var risk_h: Double = 0.03; // Ansteckungsrisiko einer genesenen Person

    
    let operating_cost_health: Double = 10000 // Laufende Ausgaben fuer ein Krankenbett
    let capital_cost_health: Double = 40000000 // Kapitalkosten fuer ein Krankenbett

    
    
    private func simulationStep(t: Double, y: GesuchteWerte, measures: MeasurePackage = MeasurePackage()) -> GesuchteWerte {
        let health_cost = Double(measures.health.money) // Ausgaben fuer Gesundheitssystem
        let research_cost = Double(measures.science.money);// Ausgaben fuer Forschung
        let fiscal_support = Double(measures.economicHelps.money) // Wirtschaftshilfen des Staates - Sozialismus
        let GDP: Double = 2000000000000.0;

        var grenzschutz: Double = 1.15
        var verkehr:Double = 1.1
        var arbeit: Double = 1.1
        var ausgang: Double = 1.1
        var geschaefte: Double = 0.5
        var moral:Double  = 0.8
        
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
        
        switch measures.traffic {
        case .noRestriction: verkehr = 1
        case .noFlights: verkehr = 1.25
        case .restrictedLongDistance: verkehr = 1.5
        case .regionalOnly: verkehr = 2
        }
        
        let bevoelkerung: Double = y.n_gesund + y.n_genesen + y.n_infiziert
        let progress: Double = 1 - y.n_gesund / bevoelkerung
        let workforce: Double = (y.n_gesund + y.n_genesen) / bevoelkerung
        let workforce_real: Double = workforce * (0.4/(0.4 + log(grenzschutz) + log(verkehr) + log(arbeit) + log(ausgang)))
        
        let sparerquote: Double = (1-moral/100) * 0.45 + 0.15
        let fiscal_effect: Double = (fiscal_support / sparerquote) / (GDP*0.3)
        let revenue: Double = sqrt(progress)*GDP*0.3*(1+fiscal_effect+workforce_real-geschaefte)
        let totalcost: Double = health_cost + fiscal_support + research_cost
        
        
        var grenzschutz_vorfaktor: Double = 0.75
        switch measures.border {
        case .open: grenzschutz_vorfaktor = 0
        case .noTourists: grenzschutz_vorfaktor = 0.75
        case .goodsOnly: grenzschutz_vorfaktor = 1.25
        case .closed: grenzschutz_vorfaktor = 2
        }
        
        var verkehr_vorfaktor: Double = 1.1
        switch measures.traffic {
        case .noRestriction: verkehr_vorfaktor = 0
        case .noFlights:    verkehr_vorfaktor = 0.75
        case .restrictedLongDistance: verkehr_vorfaktor = 1.25
        case .regionalOnly: verkehr_vorfaktor = 2
        }
        
        var arbeit_vorfaktor: Double = 1.1
        switch measures.work {
        case .asUsual: arbeit_vorfaktor = 0
        case .homeOfficeWherePossible: arbeit_vorfaktor = 1.1
        case .homeOfficeEverywhere: arbeit_vorfaktor = 2
        }
        
        var ausgang_vorfaktor: Double = 2
        switch measures.ausgangssperre {
        case .active: ausgang_vorfaktor = 2
        case .sperrstunden: ausgang_vorfaktor = 1
        case .inactive: ausgang_vorfaktor = 0
        }
        
        var geschaefte_vorfaktor: Double = 2
        switch measures.business {
        case .businessAsUsual: geschaefte_vorfaktor = 0
        case .restrictedClosingHours: geschaefte_vorfaktor = 1
        case .supermarketOnly: geschaefte_vorfaktor = 2
        }
        
        var staerke_vorfaktor: Double = 3
        switch measures.enforcement {
        case .voluntarily: staerke_vorfaktor = 0
        case .enforcedByPolice: staerke_vorfaktor = 1
        case .enforcedByMilitary: staerke_vorfaktor = 3
        }
        
        let grenzschutz_moral: Double = grenzschutz_vorfaktor * 1 * (((2*y.n_infiziert)/(0.08*bevoelkerung)) - min(2,(0.05*bevoelkerung/max(y.n_infiziert,1000))))
        let verkehr_moral: Double = verkehr_vorfaktor * 2 * (((2*y.n_infiziert)/(0.11*bevoelkerung)) - min(3,(0.08*bevoelkerung/max(y.n_infiziert,1000))))
        let arbeit_moral: Double = arbeit_vorfaktor * 2 * (((2*y.n_infiziert)/(0.11*bevoelkerung)) - min(3,(0.08*bevoelkerung/max(y.n_infiziert,1000))))
        let ausgang_moral:Double = ausgang_vorfaktor * 2 * (((2*y.n_infiziert)/(0.11*bevoelkerung)) - min(3,(0.08*bevoelkerung/max(y.n_infiziert,1000))))
        let geschaefte_moral: Double = geschaefte_vorfaktor * 2 * (((2*y.n_infiziert)/(0.11*bevoelkerung)) - min(3,(0.08*bevoelkerung/max(y.n_infiziert,1000))))
        let staerke_demonstriert: Double = staerke_vorfaktor * 6

        moral = (fiscal_effect*5.0) + grenzschutz_moral + verkehr_moral + arbeit_moral + ausgang_moral + geschaefte_moral - staerke_demonstriert - progress * 5

        let Pgi: Double = Ki*y.n_infiziert / (Kg*(y.n_gesund+y.n_genesen)+Ki*y.n_infiziert)
        let Kki: Double = Pgi * Kg * (risk_g * y.n_gesund + risk_h * y.n_genesen)
        
        // Real ODE
        
        let part1: Double = -(Ki * y.n_infiziert / (Kg*(y.n_gesund+y.n_genesen)+Ki*y.n_infiziert ))
        let part2: Double = Kg*risk_g*y.n_gesund
        let f_gesund: Double = part1 * part2
        let f_infiziert: Double = -y.n_infiziert / krankheitsdauer + Kki
        
        let part5: Double = y.n_infiziert * mort_nocare - y.n_krankenhaus
        let part6: Double = max((part5),0) + min(y.n_krankenhaus,y.n_infiziert) * mort_care
        let f_gefallen: Double = (part6) / krankheitsdauer
        
        let part7: Double = max((y.n_infiziert * mort_nocare - y.n_krankenhaus),0)
        let part8: Double = min(y.n_krankenhaus,y.n_infiziert)*mort_care
        let part9: Double = (Ki*y.n_infiziert / (Kg*(y.n_gesund+y.n_genesen)+Ki*y.n_infiziert))
        let f_genesen: Double = (y.n_infiziert - (part7 + part8)) / krankheitsdauer - part9 * Kg*(risk_h*y.n_genesen)
        
        let f_krankenhaus: Double = (health_cost - y.n_krankenhaus * operating_cost_health)/capital_cost_health
        let f_budget: Double = (revenue - totalcost) / 10
        let f_moral: Double = moral / 100
        
        return GesuchteWerte.init(n_gesund: f_gesund, n_infiziert: f_infiziert, n_gefallen: f_gefallen, n_genesen: f_genesen, n_krankenhaus: f_krankenhaus, n_budget: f_budget, moral: f_moral)
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
    func simulateNextStep(measurePackage: MeasurePackage) {
        let i = y_values.count
        let newValue = self.rk4(dx: dx, x: dx*Double(i-1), y: y_values[i-1], measures: measurePackage, f: simulationStep )
        y_values.append(newValue)
    }
 
    func currentValue() -> GesuchteWerte {
        return y_values.last!
    }
}
