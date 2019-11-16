//
//  ClientModel.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation

enum State {
    case OK
    case EMPTY
    case ERROR
}

protocol ClientModelLogic {
    func callClient(_ callback: @escaping (State) -> Void)
}

protocol ClientDataStore {
    var clients: [ClientEntity] { get set }
}

class ClientModel: ClientModelLogic, ClientDataStore {
    var service: ClientServicesLogic
    var clients: [ClientEntity] = []
    
    init(_ service: ClientService) {
        self.service = service
    }
    
    func callClient(_ callback: @escaping (State) -> Void) {
        service.callClient { [weak self] response in
            guard let req = response, let selfStrong = self else {
                return callback(.ERROR)
            }
            if req.payload.isEmpty {
                return callback(.EMPTY)
            } else {
                selfStrong.clients = req.payload
                return callback(.OK)
            }
        }
    }
}
