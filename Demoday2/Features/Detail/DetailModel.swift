//
//  DetailModel.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation

protocol DetailModelDataSource {
    var client: ClientEntity { get set }
}

class DetailModel : DetailModelDataSource {
    var client: ClientEntity
    init(client: ClientEntity) {
        self.client = client
    }
}
