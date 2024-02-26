//
//  FirstViewController.swift
//  homework7(2)
//
//  Created by НИКИТА ПЕСНЯК on 23.01.24.
//

import UIKit

class FirstViewController: UIViewController {
   
    @IBOutlet private weak var nicknameLabel1:UILabel!
    @IBOutlet private weak var imageView1: UIImageView!
    weak var delegate:SelectedDelegate?
    var selectedValues = SelectedValues()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        nicknameLabel1.text = selectedValues.nickname
        
        fotoView(c: selectedValues.avatar ?? "")
        
    }
    func didSelectGender(_ gender: String) {
        selectedValues.gender = gender
        delegate?.didSelectGender(gender)
        
    }

    func didSelectNickname(_ nickname: String) {
        selectedValues.nickname = nickname
        delegate?.didSelectNickname(nickname)
        nicknameLabel1.text = selectedValues.nickname
   
    }

    func didSelectAvatar(_ avatar: String) {
        selectedValues.avatar = avatar
        delegate?.didSelectAvatar(avatar)
        let placeholderImage = UIImage(systemName: selectedValues.avatar ?? "")
        imageView1.image = placeholderImage
        imageView1.tintColor = .purple
        
       
    }
    private  func fotoView(c: String){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView1.clipsToBounds = true
        imageView1.contentMode = .scaleAspectFill
        imageView1.layer.borderColor = UIColor.purple.cgColor
        imageView1.layer.borderWidth = 1.0
        imageView1.layer.cornerRadius = imageView.frame.size.width / 2

        let placeholderImage = UIImage(systemName: c)
        imageView1.image = placeholderImage
        imageView1.tintColor = .purple
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: imageView1.frame.size.width, height: imageView1.frame.size.height))
        label.textAlignment = .center
        label.text = "No Avatar"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14)

        imageView1.addSubview(label)}
    
    @IBAction private func editButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        viewController2.delegate = self
        navigationController?.pushViewController(viewController2, animated: true)
    }
    @IBAction private func saveButton() {
        if let firstVC = navigationController?.viewControllers.first as? ViewController {
                   firstVC.selectedValues = selectedValues
            print(selectedValues)
               }
               navigationController?.popViewController(animated: true)
           }
    @IBAction private func canselButton() {
        if let firstVC = navigationController?.viewControllers.first as? ViewController {
               }
               navigationController?.popViewController(animated: true)
           }
    }
