//
//  Router.swift
//  CryptoPricesVIPERExample
//
//  Created by Erge Gevher Akova on 5.07.2022.
//

import Foundation

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter{
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
}
