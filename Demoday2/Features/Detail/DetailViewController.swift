//
//  DetailViewController.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import UIKit
protocol DetailViewControllerLogic: class {
    
}
class DetailViewController: UIViewController {
    var presenter: DetailPresentationLogic?
    @IBOutlet weak var photoURL: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        guard let presenter = self.presenter else {
            return
        }
      
        let client = presenter.dataStore.client
        navigationItem.title = client.first_name
        if let url = URL(string: client.photo_url) {
            photoURL.af_setImage(withURL: url)
        }
        
        fullName.text = client.fullName()
        email.text = client.email
    }
}
extension DetailViewController: DetailViewControllerLogic {
    
}
