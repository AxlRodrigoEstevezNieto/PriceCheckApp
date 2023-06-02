//
//  ProductosRegisterViewControllerDelegate.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 01/06/23.
//

import UIKit

extension ProductosRegisterViewController: productsAllProtocol {
    func onSucces(productos: [Producto]) {
        self.productos = productos
        
        DispatchQueue.main.async {
            self.hideSpinner()
            self.configureTableView()
        }
    }
    
    func onError() {
        print("💭 Ha ocurrido un error")
    }
    
    
}

extension ProductosRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductTableViewCell.self)") as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(producto: productos[indexPath.row])
        return cell
    }
    
    
}
