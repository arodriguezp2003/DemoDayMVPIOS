//
//  ClientFactory.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class ClientFactory {
    func getVC() -> UIViewController {
        let service = ClientService()
        let model = ClientModel(service)
        let presenter = ClientPresenter(model)
        let view = ClientViewController()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
