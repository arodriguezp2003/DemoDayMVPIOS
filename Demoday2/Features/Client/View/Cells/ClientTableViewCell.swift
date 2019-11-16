//
//  CellTableViewCell.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import AlamofireImage
class ClientTableViewCell: UITableViewCell {

    @IBOutlet weak var photoURL: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var client: ClientEntity?  {
        didSet {
            guard let client = client else  {
                return
            }
            if let url = URL(string: client.photo_url) {
                 self.photoURL.af_setImage(withURL: url)
            }
            self.fullName.text = client.fullName()
            self.email.text = client.email
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoURL.af_cancelImageRequest()
        self.fullName.text = ""
        self.email.text = ""
    }
}
