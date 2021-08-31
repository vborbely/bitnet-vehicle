//
//  Error.swift
//  BitnetVehicle
//
//  Created by Borbély Viktor on 2021. 08. 30..
//

import Foundation

class Error {
    let code: Int?
    let message: String
    init(message: String, code: Int?) {
        self.message = message
        self.code = code
    }
}

class RequestError : Error {
    init(message: String = "Request Error", code: Int) {
        super.init(message: message, code: code)
    }
}

class ServerError : Error {
    init(message: String = "Server Error") {
        super.init(message: message, code: 500)
    }
}

class NetworkError : Error {
    init(message: String = "Network Error") {
        super.init(message: message, code: nil)
    }
}


