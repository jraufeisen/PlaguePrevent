//
//  StatsViewController.swift
//  PlaguePrevent
//
//  Created by Johannes on 22.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    static func instantiate(simulation: Simulation) -> StatsViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(identifier: "StatsVCID") as! StatsViewController
        vc.simulation = simulation
        return vc
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var simulation: Simulation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "InfectedTableViewCell", bundle: nil), forCellReuseIdentifier: InfectedTableViewCell.Identifier)
        tableView.register(UINib(nibName: "DeathsTableViewCell", bundle: nil), forCellReuseIdentifier: DeathsTableViewCell.Identifier)
        tableView.register(UINib(nibName: "HospitalTableViewCell", bundle: nil), forCellReuseIdentifier: HospitalTableViewCell.Identifier)
        tableView.register(UINib(nibName: "MoneyTableViewCell", bundle: nil), forCellReuseIdentifier: MoneyTableViewCell.Identifier)
        tableView.register(UINib(nibName: "MoralTableViewCell", bundle: nil), forCellReuseIdentifier: MoralTableViewCell.Identifier)
        tableView.register(UINib(nibName: "RecoveredTableViewCell", bundle: nil), forCellReuseIdentifier: RecoveredTableViewCell.Identifier)

    }
    

}

extension StatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let simulation = simulation else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfectedTableViewCell.Identifier, for: indexPath) as! InfectedTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.n_infiziert
            }
            cell.data = infectedNumbers
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DeathsTableViewCell.Identifier, for: indexPath) as! DeathsTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.n_gefallen
            }
            cell.data = infectedNumbers
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecoveredTableViewCell.Identifier, for: indexPath) as! RecoveredTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.n_genesen
            }
            cell.data = infectedNumbers
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HospitalTableViewCell.Identifier, for: indexPath) as! HospitalTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.n_krankenhaus
            }
            cell.data = infectedNumbers
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MoneyTableViewCell.Identifier, for: indexPath) as! MoneyTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.n_budget
            }
            cell.data = infectedNumbers
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MoralTableViewCell.Identifier, for: indexPath) as! MoralTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.moral
            }
            cell.data = infectedNumbers
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
}

extension StatsViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
