//
//  Router.swift
//  arabamCase
//
//  Created by ELİF BEYZA SAĞLAM on 26.07.2024.
//

import UIKit

protocol RouterProtocol {
    func route(from baseViewController: UIViewController , to viewController: UIViewController, animated: Bool)
    func pop()
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool)
}

 class Router: RouterProtocol {

    var navigationController: UINavigationController?

    func route(from baseViewController: UIViewController ,to viewController: UIViewController, animated: Bool) {
        baseViewController.navigationController?.pushViewController(viewController, animated: animated)
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        navigationController?.setViewControllers(viewControllers, animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
}
