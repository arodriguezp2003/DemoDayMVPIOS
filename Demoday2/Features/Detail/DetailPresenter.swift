//
//  DetailPresenter.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation
protocol DetailPresentationLogic {
    var dataStore: DetailModelDataSource { get set }
}

class DetailPresenter: DetailPresentationLogic {
    weak var view: DetailViewControllerLogic?
    var dataStore: DetailModelDataSource
    var model: DetailModelDataSource
    
    init(_ model: DetailModel) {
        self.model = model
        self.dataStore = model
    }
}
