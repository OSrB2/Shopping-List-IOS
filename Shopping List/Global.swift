//
//  Global.swift
//  Shopping List
//
//  Created by Pedro Oliveira on 30/07/24.
//

import Foundation
import UIKit

class Global:NSObject {
  static var parametros:NSMutableDictionary?
  
  public func proximaView(viewController proximaTela:UIViewController, id nomeView:String, navigation nav:UINavigationController, storyboardName story:String) {
    let storyboard = UIStoryboard.init(name: story, bundle: nil)
    var nextView = proximaTela
    nextView = storyboard.instantiateViewController(withIdentifier: nomeView)
    nav.pushViewController(nextView, animated: true)
  }
}
