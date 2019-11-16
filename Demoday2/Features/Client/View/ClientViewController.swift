//
//  ClientViewController.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import UIKit

protocol ClientViewLogic: class {
    func loadOK()
    func loadEMPTY()
    func loadERROR()
}


class ClientViewController: UIViewController {
    var presenter: ClientPresentationLogic?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension ClientViewController: ClientViewLogic {
    func loadOK() {
    }
    func loadEMPTY() {
    }
    func loadERROR() {
    }
}
