//
//  Utils.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 16.06.2021.
//

import UIKit

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
    var hasValidEmail: Bool {
        guard let email = text else {
            print("Error. No email")
            return false
        }
        return email.isValidEmail
    }
    var hasValidPaswword: Bool {
        guard let password = text else {
            print("Error. No Password")
            return false
        }
        return password.isValidPassword
    }
}

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var isValidPassword: Bool {
        count > 5
    }
}

extension UIViewController {
    func alertView(message: String) {
        let dialogMessage = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

extension UICollectionView {
    func scrollToLast() {
        guard numberOfSections > 0 else {
            return
        }
        let lastSection = numberOfSections - 1
        guard numberOfItems(inSection: lastSection) > 0 else {
            return
        }
        let lastItemIndexPath = IndexPath(item: numberOfItems(inSection: lastSection) - 1,
                                          section: lastSection)
        scrollToItem(at: lastItemIndexPath, at: .right, animated: true)
    }
}
