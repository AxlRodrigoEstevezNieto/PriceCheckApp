//
//  NuevoProductoViewControllerExtension.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 06/05/23.
//

import UIKit

extension NuevoProductoViewController {
    
    func setupView() {
        if barcode != "" {
            barcodeTextField.text = barcode
            barcodeTextField.isUserInteractionEnabled = false
        }
        closeButton.setTitle("", for: .normal)
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor(named: "blue-background")?.cgColor
        saveButton.layer.cornerRadius = 5
    }
    
    func resetTextFields() {
        barcodeTextField.text = ""
        productoTextField.text = ""
        marcaTextField.text = ""
        presentationTextField.text = ""
        precioTextField.text = ""
    }
    
    func checkTextField() -> Bool {
        var isEmpty: Bool = false
        
        if (barcodeTextField.text == "") || (productoTextField.text == "") || (marcaTextField.text == "") ||
            (presentationTextField.text == "") || (precioTextField.text == "") {
            isEmpty = true
        }
        
        return isEmpty
    }
    
    func createRequestObj() {
        newProd.barcode = barcodeTextField.text
        newProd.nombre = productoTextField.text
        newProd.marca = marcaTextField.text
        newProd.presentacion = presentationTextField.text
        newProd.precio = precioTextField.text
    }
}
