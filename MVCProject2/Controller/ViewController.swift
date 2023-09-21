//
//  ViewController.swift
//  MVCProject2
//
//  Created by Eman Khaled on 21/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkService.fetchResult{[weak self ](res) in
            DispatchQueue.main.async {
                self?.idLabel.text = "\(res?.data[0].id ?? 0)"
                self?.myLabel.text = res?.data[1].employee_name
                
                if let salary = res?.data[2].employee_salary {
                    self?.salaryLabel.text = String(salary)
                } else {
                    self?.salaryLabel.text = nil // Set to nil if id is nil
                }
                
                self?.ageLabel.text = "\(res?.data[3].employee_age ?? 0)"
                if let imageUrl = URL(string: res?.data[4].profile_image ?? "No photo"),
                   let imageData = try? Data(contentsOf: imageUrl) {
                    self?.imageView.image = UIImage(data: imageData)
                    
                }
            }
            
            
        }
    }
    
}
