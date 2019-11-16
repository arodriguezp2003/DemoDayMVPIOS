//
//  ClientPresenter.swift
//  Demoday2
//
//  Created by Alejandro  Rodriguez on 11/16/19.
//  Copyright © 2019 Alejandro Rodriguez. All rights reserved.
//

import Foundation

protocol ClientPresentationLogic {
    var dataStore: ClientDataStore { get set }
    func callService() -> Void
}

class ClientPresenter: ClientPresentationLogic {
    weak var view: ClientViewLogic?
    var model: ClientModelLogic
    var dataStore: ClientDataStore
    
    init(_ model: ClientModel) {
        self.model = model
        self.dataStore = model
    }
    
    func callService() {
        model.callClient { [weak self] state in
            guard let selfStrong = self, let view = selfStrong.view else {
                return
            }
            
            switch state {
            case .OK:
                print("Se cargo la data")
                view.loadOK()
            case .EMPTY:
                print("la lista es vacia")
                view.loadEMPTY()
            case .ERROR:
                print("ocurrio un error en el Request")
                view.loadERROR()
            }
        }
    }
}

