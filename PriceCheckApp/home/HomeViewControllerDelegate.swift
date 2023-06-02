//
//  HomeViewControllerDelegate.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 05/05/23.
//

import Foundation
import BarcodeScanner
import SwiftSpinner

extension HomeViewController: BarcodeScannerCodeDelegate {
    
    func scanner(_ controller: BarcodeScanner.BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        self.barcode = code
        productoModel.getProducto(barcode: code)
    }
}

extension HomeViewController: BarcodeScannerDismissalDelegate {
    
    func scannerDidDismiss(_ controller: BarcodeScanner.BarcodeScannerViewController) {
        controller.reset()
        controller.dismiss(animated: true)
    }

}

extension HomeViewController: BarcodeScannerErrorDelegate {
    
    func scanner(_ controller: BarcodeScanner.BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

extension HomeViewController: productoProtocol {
    
    func onSucess(producto: Producto) {
        barcodeValueLabel.text = producto.barcode
        nameValueLabel.text = producto.nombre
        marcaValueLabel.text = producto.marca
        presentationValueLabel.text = producto.presentacion
        priceValueLabel.text = producto.precio
    }
    
    func hideScannerView() {
        if !isError{
            stackDataDescription.isHidden = false
        }
        viewController.reset()
        viewController.dismiss(animated: true)
    }
    
    func onError() {
        stackDataDescription.isHidden = true
        viewController.reset()
        viewController.dismiss(animated: true)
        showAlertError()
    }
    
    func notificationError(notificationError: Bool) {
        self.isError = notificationError
    }
}

