//
//  ProductosModel.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 05/05/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Producto {
    var barcode: String!
    var nombre: String?
    var precio: String?
    var marca: String?
    var presentacion: String?
    
    init() { }
}

protocol productoProtocol {
    func onSucess(producto: Producto)
    func onError()
    func hideScannerView()
    func notificationError(notificationError: Bool)
}

protocol saveProductsProtocol {
    func onSucess()
    func onError()
}

protocol productsAllProtocol {
    func onSucces(productos: [Producto])
    func onError()
}

class ProductosModel {
    
    private let database = Firestore.firestore()
    var delegate: productoProtocol!
    var saveDelegate: saveProductsProtocol!
    var productosArrayDelegate: productsAllProtocol!
    private var producto = Producto()
    
    func getProducto(barcode: String) {
        database.collection("productos").document(barcode).getDocument {
            (document, error) in
            if let document = document, error == nil {
                if let price = document.get("precio") as? String {
                    self.producto.precio = price
                } else {
                    self.delegate?.onError()
                }
                
                if let name = document.get("nombre") as? String {
                    self.producto.nombre = name
                }
                
                if let barcode = document.get("barcode") as? String {
                    self.producto.barcode = barcode
                }
                
                if let marca = document.get("marca") as? String {
                    self.producto.marca = marca
                }
                
                if let presentationProd = document.get("presentacion") as? String {
                    self.producto.presentacion = presentationProd
                }
                
                self.delegate?.notificationError(notificationError: false)
                self.delegate?.onSucess(producto: self.producto)
                self.delegate?.hideScannerView()
                
            } else {
                self.delegate?.notificationError(notificationError: true)
                self.delegate?.onError()
            }
        }
    }
    
    func saveNewProduct(producto: Producto) {
        database.collection("productos").document(producto.barcode).setData([
            "barcode" : producto.barcode!,
            "nombre" : producto.nombre ?? "",
            "precio" : producto.precio ?? "",
            "marca" : producto.marca ?? "",
            "presentacion" : producto.presentacion ?? ""
        ])
        
        self.saveDelegate?.onSucess()
    }
    
    func getProductoAll() {
        database.collection("productos").getDocuments(completion: {
            (documents, error) in
            if let productos = documents, error == nil{
                let productosArray = self.makeProductsArray(data: productos.documents)
                if productosArray.isEmpty{
                    self.productosArrayDelegate?.onError()
                } else {
                    self.productosArrayDelegate?.onSucces(productos: productosArray)
                }
            }
        })
    }
    
    private func makeProductsArray(data: [QueryDocumentSnapshot]) -> [Producto] {
        var productosArray: [Producto] = []
        for producto in data {
            var productoAux = Producto()
            productoAux.barcode = producto.get("barcode") as? String
            productoAux.nombre = producto.get("nombre") as? String
            productoAux.precio = producto.get("precio") as? String
            productoAux.marca = producto.get("marca") as? String
            productoAux.presentacion = producto.get("presentacion") as? String
            productosArray.append(productoAux)
        }
        
        return productosArray
    }
}
