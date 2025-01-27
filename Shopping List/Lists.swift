//
//  Lists.swift
//  Shopping List
//
//  Created by Pedro Oliveira on 29/07/24.
//

import Foundation
import UIKit

class Lists:UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  @IBOutlet weak var tabela: UITableView!
  var elements = NSMutableArray()
  
  override func viewDidLoad() {
    tabela.delegate = self
    tabela.dataSource = self
    
    let global = Global()
    let database = global.leituraPlist(nome: "Database")
    print(database)
    elements = (database["listas"] as? NSMutableArray)!
    
//    let dicionario = NSMutableDictionary()
//    dicionario["listas"] = elements
//    global.salvarPlist(oDicionario: dicionario, naPlist: "Database")
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return elements.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Listas"
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "ListsCell"
    let cell:ListsCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ListsCell
    let dicionario = elements.object(at: indexPath.row) as? NSDictionary
    let name = dicionario?["name"] as? String
    
    cell.titulo.text = name
    cell.quantidade.text = dicionario?["itens"] as? String
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return "Toque na linha para selecionar uma lista."
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let dicionario = elements[indexPath.row]
    print(dicionario)
    tabela.reloadData()
    
    let global = Global()
    let details = Details()
    Global.parametros = NSMutableDictionary()
    Global.parametros?["resultado"] = dicionario
    global.proximaView(viewController: details, id: "details", navigation: self.navigationController!, storyboardName: "Main")
  }
  
}
