//
//  Presenter.swift
//  CryptoPricesVIPERExample
//
//  Created by Erge Gevher Akova on 5.07.2022.
//

import Foundation

enum NetworkError: Error {
    case networkFaild
    case ParsingFaild
}

protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet{
            interactor?.downloadCryptos()
        }
    }
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.updateTable(with: cryptos)
        case .failure(_):
            view?.updateTable(with: "Try again!!!")
        }
    }
    
    
}
