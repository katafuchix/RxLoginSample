//
//  ViewController.swift
//  RxLoginSample
//
//  Created by cano on 2020/01/19.
//  Copyright © 2020 cano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.bind()
    }

    func bind() {
        self.usernameTextField.rx.text.map { $0 ?? "" }
            .bind(to: self.viewModel.usernameText)
            .disposed(by: rx.disposeBag)
        
        self.passwordTextField.rx.text.map { $0 ?? "" }
            .bind(to: self.viewModel.passwordText)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.isValid
            .bind(to: self.loginButton.rx.isEnabled)
            .disposed(by: rx.disposeBag)
    }

}

extension UIButton {
    override open var isEnabled : Bool {
        willSet{
            self.backgroundColor = newValue ? .orange : .lightGray
        }
    }
}
