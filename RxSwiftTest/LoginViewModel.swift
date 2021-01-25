//
//  LoginViewModel.swift
//  RxSwiftTest
//
//  Created by Stanislav Terentyev on 25.01.2021.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    //проверка на валидность
    func isValid() -> Observable<Bool> {
        return Observable
            .combineLatest(usernameTextPublishSubject
                            .asObservable()
                            .startWith(""),
                           passwordTextPublishSubject
                            .asObservable()
                            .startWith(""))
            .map { username, password in
            return username.count > 3 && password.count > 5
            }.startWith(false)
    }
}
