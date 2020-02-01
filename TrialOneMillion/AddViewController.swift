//
//  AddViewController.swift
//  TrialOneMillion
//
//  Created by Timm, Adria M on 2/1/20.
//  Copyright © 2020 Timm, Adria M. All rights reserved.
//

import Foundation
import Cocoa

class AddViewController: NSViewController {
    
    let vc: ViewController = ViewController()
    @IBOutlet var isbnTF: NSTextField!
    @IBOutlet var titleTF: NSTextField!
    @IBOutlet var authorTF: NSTextField!
    @IBOutlet var quantityTF: NSTextField!
    @IBOutlet var priceTF: NSTextField!
    
    
    var isbn: String = ""
    var Title: String = ""
    var author: String = ""
    var quantity: String = ""
    var price: String = ""
    
    @IBAction func addButton(_ sender: Any) {
        isbn = isbnTF.stringValue
        Title = titleTF.stringValue
        author = authorTF.stringValue
        quantity = quantityTF.stringValue
        price = priceTF.stringValue
       
        
        vc.writeToFile(i: isbn, t: Title, a: author, q: quantity, p: price)
        
        self.dismiss(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
