//
//  ViewController.swift
//  UIModalTransitionStyle
//
//  Created by kazumi hayashida on 2019/02/11.
//

import UIKit

class RootViewController: UIViewController {
  enum Style: Int, CaseIterable {
    case coverVertical, flipHorizontal, crossDissolve, partialCurl
  }

  @IBOutlet private weak var tableView: UITableView!
}

extension RootViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Style.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    
    let style = Style(rawValue: indexPath.row)
    switch style! {
    case .coverVertical:
      cell.textLabel?.text = "coverVertical"
    case .flipHorizontal:
      cell.textLabel?.text = "flipHorizontal"
    case .crossDissolve:
      cell.textLabel?.text = "crossDissolve"
    case .partialCurl:
      cell.textLabel?.text = "partialCurl"
    }
    
    return cell
  }
}

extension RootViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let storyborad = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyborad.instantiateViewController(withIdentifier: "ModelViewController")
    
    let style = Style(rawValue: indexPath.row)
    switch style! {
    case .coverVertical:
      viewController.title = "coverVertical"
      viewController.modalTransitionStyle = .coverVertical
    case .flipHorizontal:
      viewController.title = "flipHorizontal"
      viewController.modalTransitionStyle = .flipHorizontal
    case .crossDissolve:
      viewController.title = "crossDissolve"
      viewController.modalTransitionStyle = .crossDissolve
    case .partialCurl:
      viewController.title = "partialCurl"
      viewController.modalTransitionStyle = .partialCurl
    }
    
  present(viewController, animated: true, completion: nil)
  }
}
