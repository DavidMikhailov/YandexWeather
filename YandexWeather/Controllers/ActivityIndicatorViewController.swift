//
//  ActivityIndicatorViewController.swift
//  YandexWeather
//
//  Created by Давид Михайлов on 15.01.2021.
//

import UIKit

final class ActivityIndicatorViewController: UIViewController {
        
    private var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.alpha = 0.7
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.color = .white
        activityIndicator.startAnimating()
    }
    
    // Покажем модально поверх всего экрана
    class func startAnimating(in viewController: UIViewController) {
        DispatchQueue.main.async {
            let activityVC = ActivityIndicatorViewController()
            activityVC.modalPresentationStyle = .overFullScreen
            viewController.navigationController?.present(activityVC, animated: false, completion: nil)
        }
    }
    
    class func stopAnimating(in viewController: UIViewController) {
        if viewController.navigationController?.presentedViewController is ActivityIndicatorViewController {
            viewController.navigationController?.dismiss(animated: false, completion: nil)
        }
    }
    
    
    class func stopAnimating() {
        DispatchQueue.main.async {
            if let navigationController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController as? UINavigationController {
                navigationController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
