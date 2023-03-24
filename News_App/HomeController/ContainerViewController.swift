//
//  ContainerViewController.swift
//  News_App
//
//  Created by devsenior on 20/03/2023.
//

import UIKit
import SwiftUI

class ContainerViewController: UIViewController {
    
    enum MenuSate {
      case opened
      case closed
    }
    
    let menuVC = MenuViewController()
    let moviesVC = MoviesNewsViewController()
    let homeVC = HomeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func addChildVCs(){
        //Menu
        addChild(menuVC)
        view.addSubview(menuVC.view)
      
        //Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        
//        addChild(moviesVC)
//        view.addSubview(moviesVC.view)
    }


}
extension ContainerViewController: HomeViewControllerDelegate{
    func didTapMenuButton() {
        switch MenuSate {
        case.closed:
            // open it
            UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
        }
    }

}
