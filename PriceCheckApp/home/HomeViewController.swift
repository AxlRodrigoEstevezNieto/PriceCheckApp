//
//  HomeViewController.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 05/05/23.
//

import UIKit
import SwiftSpinner
import BarcodeScanner

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scannerButton: UIButton!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var showProductsButton: UIButton!
    
    @IBOutlet weak var stackDataDescription: UIStackView!
    
    @IBOutlet weak var barcodeValueLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    @IBOutlet weak var marcaValueLabel: UILabel!
    @IBOutlet weak var presentationValueLabel: UILabel!
    
    var barcode: String!
    var isError: Bool!
    var productoModel = ProductosModel()
    let viewController = BarcodeScannerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isError = true
        productoModel.delegate = self
        setupView()
    }
    
    @IBAction func showNewProdAction(_ sender: Any) {
        presentViewNewProduct()
    }
    
    
    @IBAction func showSannerViewAction(_ sender: Any) {
        showScanner()
    }
    
    @IBAction func showProductosAction(_ sender: Any) {
        presentAllProducts()
    }
    
}
