//
//  DetailFactory.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class DetailFactory {
    func getVC(client: ClientEntity) -> UIViewController {
        let model = DetailModel(client: client)
        let presenter = DetailPresenter(model)
        let view = DetailViewController()
        presenter.view = view
        view.presenter = presenter
        return view
    }
}
