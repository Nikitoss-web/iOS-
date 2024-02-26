//
//  TwoViewController.swift
//  homework7(2)
//
//  Created by НИКИТА ПЕСНЯК on 17.01.24.
//

import UIKit

class TwoViewController: UIViewController {
    var delegate: FirstViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction private func gendersButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
        let selectedValue = sender.titleLabel?.text ?? ""
        viewController2.delegate = delegate
        delegate?.didSelectGender(selectedValue)
        navigationController?.pushViewController(viewController2, animated: true)
    }
}
