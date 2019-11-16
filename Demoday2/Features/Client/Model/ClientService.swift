//
//  ClientService.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import Alamofire

protocol ClientServicesLogic {
    func callClient(callback: @escaping (IRequest?) -> Void)
}

class ClientService: ClientServicesLogic {
    func callClient(callback: @escaping (IRequest?) -> Void) {
        AF.request("https://glacial-beyond-09977.herokuapp.com/clients").responseData { (req) in
            guard let data = req.data else {
                return callback(nil)
            }
            
            do {
                callback(try JSONDecoder().decode(IRequest.self, from: data))
            } catch let e {
                print(e)
                callback(nil)
            }
        }
    }
}
