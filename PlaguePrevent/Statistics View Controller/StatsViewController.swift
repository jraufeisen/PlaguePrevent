//
//  StatsViewController.swift
//  PlaguePrevent
//
//  Created by Johannes on 22.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
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
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InfectedTableViewCell.Identifier, for: indexPath) as! InfectedTableViewCell
            // set cell data
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
}

extension StatsViewController: UITableViewDelegate {
    
}
