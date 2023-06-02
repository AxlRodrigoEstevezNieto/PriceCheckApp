//
//  ProductosRegisterViewControllerExtension.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 14/05/23.
//

import UIKit
import SwiftSpinner

extension ProductosRegisterViewController {
    
    func setupView() {
        self.closeButton.setTitle("", for: .normal)
    }
    
    func configureTableView() {
        let nibName = UINib(nibName: "\(ProductTableViewCell.self)", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "\(ProductTableViewCell.self)")
        tableView.rowHeight = 80
        tableView.reloadData()
    }
    
    func showSpinner() {
        SwiftSpinner.show("Obteniendo productos registrados ...")
    }
    
    func hideSpinner() {
        SwiftSpinner.hide()
    }
}
