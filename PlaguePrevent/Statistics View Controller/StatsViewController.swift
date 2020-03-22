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
        
    }
    

}

extension StatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let simulation = simulation else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfectedTableViewCell.Identifier, for: indexPath) as! InfectedTableViewCell
            // set cell data
            let infectedNumbers = simulation.y_values.map { (gesuchtewerte) -> Double in
                return gesuchtewerte.n_gefallen
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
