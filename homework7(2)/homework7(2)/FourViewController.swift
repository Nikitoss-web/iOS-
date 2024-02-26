//
//  FourViewController.swift
//  homework7(2)
//
//  Created by НИКИТА ПЕСНЯК on 17.01.24.
//

import UIKit

class FourViewController: UIViewController {
    weak var delegate: FirstViewController?
       override func viewDidLoad() {
           super.viewDidLoad()
       }
       @IBAction private func avatarButton(_ sender: UIButton) {
          let selectedValue = sender.titleLabel?.text ?? ""
           delegate?.didSelectAvatar(selectedValue)
           navigationController?.popToViewController(navigationController?.viewControllers[1] ?? self, animated: true)
           }
}
