//
//  PopupMoneyViewController.swift
//  PlaguePrevent
//
//  Created by Johannes on 22.03.20.
//  Copyright © 2020 Johannes. All rights reserved.
//

import UIKit

class PopupMoneyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }


}

// MARK: - UITextFieldDelegate

extension PopupMoneyViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}
