//
//  ProductosRegisterViewController.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 14/05/23.
//

import UIKit

class ProductosRegisterViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var productos: [Producto] = []
    var productosModel = ProductosModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        productosModel.productosArrayDelegate = self
        productosModel.getProductoAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showSpinner()
    }
    
    @IBAction func closeViewAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
