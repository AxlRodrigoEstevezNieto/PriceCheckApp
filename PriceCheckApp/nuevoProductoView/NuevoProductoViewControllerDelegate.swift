//
//  NuevoProductoViewControllerDelegate.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 06/05/23.
//

import UIKit

extension NuevoProductoViewController: saveProductsProtocol {
    
    func onSucess() {
        resetTextFields()
        self.dismiss(animated: true)
    }
    
    func onError() {
        
    }
}

extension NuevoProductoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        barcodeTextField.resignFirstResponder()
        productoTextField.resignFirstResponder()
        marcaTextField.resignFirstResponder()
        presentationTextField.resignFirstResponder()
        precioTextField.resignFirstResponder()
        return true
    }
    
}
