//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Stanislav Terentyev on 20.01.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signBtn: UIButton!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.becomeFirstResponder()
        
        loginTF.rx.text
            .map {$0 ?? ""}
            .bind(to: loginViewModel.usernameTextPublishSubject)
            .disposed(by: disposeBag)
        
        passwordTF.rx.text
            .map {$0 ?? ""}
            .bind(to: loginViewModel.passwordTextPublishSubject)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid()
            .bind(to: signBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginViewModel.isValid()
            .map {$0 ? 1 : 0.1}
            .bind(to: signBtn.rx.alpha)
            .disposed(by: disposeBag)
        
        signBtn.rx
            .controlEvent(.touchUpInside)
            .subscribe(
                onNext:{ [self] in
                    guard let login = loginTF.text else {return}
                    print("Hello, \(login)")
                }
            ).disposed(by: disposeBag)
        
    }
}
