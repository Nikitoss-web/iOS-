//
//  ViewController.swift
//  homework7(2)
//
//  Created by НИКИТА ПЕСНЯК on 17.01.24.
//


import UIKit

struct SelectedValues {
    var gender: String?
    var nickname: String?
    var avatar: String?
}

protocol SelectedDelegate: AnyObject {
    func didSelectGender(_ gender: String)
       func didSelectNickname(_ nickname: String)
       func didSelectAvatar(_ avatar: String)
}


    
class ViewController: UIViewController, SelectedDelegate {
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var nicknameLabel:UILabel!
    @IBOutlet private weak var avatarButton: UILabel!
    @IBOutlet private weak var imageView1: UIImageView!
    weak var delegate: SelectedDelegate?
    var selectedValues = SelectedValues()
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoView()
        
//        selectedValues.nickname = "No name"
        selectedValues.avatar = ""
        nicknameLabel.text = "No name"
       
    }
    func updateLabels() {
       nicknameLabel.text = selectedValues.nickname
        let placeholderImage = UIImage(named: selectedValues.avatar ?? "")
               imageView1.image = placeholderImage
   }
   func didSelectGender(_ gender: String) {
       
           selectedValues.gender = gender
           updateLabels()
       }
       func didSelectNickname(_ nickname: String) {
           selectedValues.nickname = nickname
           updateLabels()
       }
       
       func didSelectAvatar(_ avatar: String) {
           selectedValues.avatar = avatar
           updateLabels()
           let placeholderImage = UIImage(systemName: selectedValues.avatar ?? "")
           imageView1.image = placeholderImage
           imageView1.tintColor = .purple
       }
   private  func fotoView(){
        imageView1.clipsToBounds = true
        imageView1.contentMode = .scaleAspectFill
        imageView1.layer.borderColor = UIColor.purple.cgColor
        imageView1.layer.borderWidth = 1.0
        imageView1.layer.cornerRadius = imageView1.frame.size.width / 2
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: imageView1.frame.size.width, height: imageView1.frame.size.height))
        let placeholderImage = UIImage(named: "")
               imageView1.image = placeholderImage
            label.textAlignment = .center
            label.text = "No Avatar"
            label.textColor = UIColor.gray
            label.font = UIFont.systemFont(ofSize: 14)
            imageView1.addSubview(label)}
    
    @IBAction private func editButton(_ sender: UIButton) {
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        firstVC.delegate = self
        firstVC.selectedValues = selectedValues
                navigationController?.pushViewController(firstVC, animated: true)
    }

  
}
