//
//  NuevoProductoViewController.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 06/05/23.
//

import UIKit

class NuevoProductoViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var precioTextField: UITextField!
    @IBOutlet weak var presentationTextField: UITextField!
    @IBOutlet weak var marcaTextField: UITextField!
    @IBOutlet weak var productoTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
    
    var barcode: String?
    let model = ProductosModel()
    var newProd = Producto()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        model.saveDelegate = self
        precioTextField.delegate = self
        presentationTextField.delegate = self
        marcaTextField.delegate = self
        productoTextField.delegate = self
        barcodeTextField.delegate = self
        
    }
    
    init(barcode: String? = nil) {
        self.barcode = barcode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func closeAction(_ sender: Any) {
        resetTextFields()
        self.dismiss(animated: true)
    }
    
    
    @IBAction func saveProdAction(_ sender: Any) {
        if checkTextField(){
            let alert = UIAlertController(title: "Advertencia", message: "Debes de completar los campos", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            createRequestObj()
            model.saveNewProduct(producto: newProd)
        }
    }
        
}
