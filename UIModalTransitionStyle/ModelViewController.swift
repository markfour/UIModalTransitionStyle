//
//  ModelViewController.swift
//  UIModalTransitionStyle
//
//  Created by kazumi hayashida on 2019/02/12.
//

import UIKit

final class ModelViewController: UIViewController {
  @IBOutlet weak var styleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    styleLabel.text = title
  }
  
  @IBAction func didTap(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
