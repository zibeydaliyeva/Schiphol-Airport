//
//  Extensions.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

extension UINavigationBar {
    
    func customNavigationBar() {
        self.tintColor = .mainTextColor
        self.barTintColor = .white
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.mainTextColor]
        self.shadowImage = UIImage()
    }
    
}

extension UIBarButtonItem {
    
    func hideBackTitle() {
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        self.setTitleTextAttributes(attributes, for: .normal)
        self.setTitleTextAttributes(attributes, for: .highlighted)
    }
    
}

extension UIImage {
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
    
}


extension UILabel {
    
    convenience init(fontWeight: UIFont.Weight = .regular,
                     fontSize: CGFloat,
                     color: UIColor? = .black,
                     numLines: Int = 1,
                     alignment: NSTextAlignment = .left) {
        self.init()
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.textColor = color
        self.numberOfLines = numLines
        self.textAlignment = alignment
    }
    
}

extension UIViewController {

    func errorAlert(with errorMessage: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: "Error!",
                                                message: errorMessage,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Close", style: .cancel) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    func trackError(with message: String) {
        // we can print or save to file all logs
        print(message)
    }
    

}


extension UITableView{
    convenience init(backgroundColor: UIColor = .clear,
                     seperatorStyle: UITableViewCell.SeparatorStyle,
                     separatorColor: UIColor? = nil,
                     contentInset: UIEdgeInsets = .zero,
                     estimatedRowHeight: CGFloat = 44) {
        self.init()
        self.layer.masksToBounds = true
        self.allowsSelection = true
        self.backgroundColor = backgroundColor
        self.separatorStyle = seperatorStyle
        self.separatorColor = separatorColor
        self.showsVerticalScrollIndicator = false
        self.contentInset = contentInset
        self.separatorInset = .zero
        self.bounces = false
        self.tableFooterView = UIView()
        self.clipsToBounds = true
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = estimatedRowHeight
    }
}

extension UIEdgeInsets {
    
    init(horizontalInset: CGFloat, verticalInset: CGFloat) {
        self.init(top: verticalInset, left: horizontalInset,
                  bottom: verticalInset, right: horizontalInset)
    }
    
    init(inset: CGFloat) {
        self.init(horizontalInset: inset, verticalInset: inset)
    }
    
    init(horizontal inset: CGFloat) {
        self.init(horizontalInset: inset, verticalInset: 0)
    }
    
    init(vertical inset: CGFloat) {
        self.init(horizontalInset: 0, verticalInset: inset)
    }
    
}


