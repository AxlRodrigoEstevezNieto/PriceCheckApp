//
//  ProductTableViewCell.swift
//  PriceCheckApp
//
//  Created by Axl Estevez on 01/06/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var buttonSelect: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setViewCell()
    }
    
    func setData(producto: Producto){
        nameProductLabel.text = producto.nombre
    }
    
    func setViewCell() {
        buttonSelect.setTitle("", for: .normal)
    }
}
