//
//  Entities.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation

struct IRequest: Codable {
    let status: Int
    let page: Int
    let next: Int
    let total: Int
    let payload: [ClientEntity]
    
}
struct ClientEntity: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let photo_url: String
    
    func fullName() -> String {
        return "\(self.first_name) \(self.last_name)"
    }
}
