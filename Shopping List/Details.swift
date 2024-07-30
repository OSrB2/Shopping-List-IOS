//
//  Details.swift
//  Shopping List
//
//  Created by Pedro Oliveira on 30/07/24.
//

import Foundation
import UIKit

class Details:UIViewController {
  @IBOutlet weak var descricao:UILabel!
  
  override func viewDidLoad() {
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    let parametros = Global.parametros
    let resultado = parametros?["resultado"] as? NSDictionary
    let name = resultado?["name"] as? String
    descricao.text = name
    self.navigationItem.title = name
  }
}
