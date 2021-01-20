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

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.rx
            .controlEvent(.editingChanged)
            .withLatestFrom(textField.rx.text.orEmpty)
            .subscribe(onNext: {text in
                self.lbl.text = text
            }).disposed(by: disposeBag)
    }
}
