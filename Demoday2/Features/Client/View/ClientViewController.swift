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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        guard let presenter = self.presenter else {
            return 
        }
        presenter.callService()
    }
    
    func setupView() {
        navigationItem.title = "Listado de Clientes"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ClientTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
extension ClientViewController: ClientViewLogic {
    func loadOK() {
        tableView.reloadData()
    }
    func loadEMPTY() {
        
    }
    func loadERROR() {
        let retry = UIAlertController(title: "brrss", message: "Ocurrio un error vuelve a intentar", preferredStyle: .alert)
        let btn = UIAlertAction(title: "Reintentar", style: .destructive) { [weak self] alert in
            guard let self = self,
                let presenter = self.presenter else {
                    return
            }
            presenter.callService()
        }
        retry.addAction(btn)
        present(retry, animated: true)
    }
}

extension ClientViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else {
            return 0
        }
        return presenter.dataStore.clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = self.presenter else {
            fatalError("No se pudo cargar el presenter")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ClientTableViewCell else {
            fatalError("No se pudo cargar el presenter")
        }
        
        cell.client = presenter.dataStore.clients[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = self.presenter else {
            return
        }
        let client = presenter.dataStore.clients[indexPath.row]
        let vc = DetailFactory().getVC(client: client)
        navigationController?.pushViewController(vc, animated: true)
    }
}
