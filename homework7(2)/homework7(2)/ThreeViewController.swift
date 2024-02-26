//
//  ThreeViewController.swift
//  homework7(2)
//
//  Created by НИКИТА ПЕСНЯК on 17.01.24.
//

import UIKit

class ThreeViewController: UIViewController {
    weak var delegate: FirstViewController?
       override func viewDidLoad() {
           super.viewDidLoad()
       }
       @IBAction private func nicknameButton(_ sender: UIButton) {
     
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController2 = storyboard.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
    let selectedValue = sender.titleLabel?.text ?? ""
           viewController2.delegate = delegate
    delegate?.didSelectNickname(selectedValue)
    navigationController?.pushViewController(viewController2, animated: true)
}
}
