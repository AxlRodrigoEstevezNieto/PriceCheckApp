//
//  HomeViewControllerExtension.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 05/05/23.
//

import UIKit
import BarcodeScanner
import SwiftSpinner

extension HomeViewController {
    
    func setupView() {
        scannerButton.setTitle("", for: .normal)
        addProductButton.setTitle("", for: .normal)
        showProductsButton.setTitle("", for: .normal)
        stackDataDescription.isHidden = true
        barcodeValueLabel.text = ""
        nameValueLabel.text = ""
        priceValueLabel.text = ""
        marcaValueLabel.text = ""
        presentationValueLabel.text = ""
    }
    
    func showScanner() {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.headerViewController.titleLabel.text = "Escanera el código del producto"
        viewController.headerViewController.titleLabel.font = UIFont(name: "Helvetica Neue", size: 12.0)
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        setupColorScannerView(controller: viewController)
        self.present(viewController, animated: true)
    }
    
    func setupColorScannerView(controller: BarcodeScannerViewController){
        let isDarkMode = traitCollection.userInterfaceStyle
        if isDarkMode == .dark {
            controller.headerViewController.closeButton.setTitleColor(.white, for: .normal)
            controller.headerViewController.titleLabel.textColor = UIColor(named: "white")
        }
    }
    
    func showSpinner(){
        SwiftSpinner.show("Validando producto")
    }
    
    func showAlertError() {
        let alert = UIAlertController(
            title: "¡Oh no!",
            message: "Producto no encontrado\n ¿Deseas agregarlo?",
            preferredStyle: .alert
        )
        let addNewProdAction = UIAlertAction(title: "Si", style: .default, handler: { action in
            alert.dismiss(animated: true)
            self.presentViewNewProduct()
        })
        let cancelAlertAction = UIAlertAction(title: "No", style: .cancel, handler: { action in
            self.barcode = ""
        })
        
        alert.addAction(addNewProdAction)
        alert.addAction(cancelAlertAction)
        self.present(alert, animated: true)
    }
    
    func presentViewNewProduct(){
        let viewController = NuevoProductoViewController(barcode: barcode)
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
    
    func presentAllProducts() {
        let viewController = UIStoryboard(name: "productosRegisterView", bundle: nil)
        let controller = viewController.instantiateViewController(withIdentifier: "ProductosRegisterViewController")
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: true)
    }

}
