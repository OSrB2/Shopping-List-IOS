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
  var elements = [["name":"Supermercado","itens":"30"], ["name":"Happy hour","itens":"10"],["name":"Almoço de domingo","itens":"5"]]
  
  override func viewDidLoad() {
    tabela.delegate = self
    tabela.dataSource = self
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
    let dicionario = elements[indexPath.row]
    let name = dicionario["name"]
    
    cell.titulo.text = name
    cell.quantidade.text = dicionario["itens"]
    
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
