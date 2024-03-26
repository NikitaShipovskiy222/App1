//
//  KeychainManager.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import Foundation
import KeychainAccess


protocol KeychainManagerProtocol: AnyObject {
    func save(key: String, value: String)
    func load(key: String) -> Result<String, Error>
}


class KeychainManager: KeychainManagerProtocol {
    func save(key: String, value: String) {
        keyChain[key] = value
    }
    
    func load(key: String) -> Result<String, Error> {
        do {
            let passcode = try keyChain.getString(key) ?? ""
            return .success(passcode)
        } catch {
            return.failure(error)
        }
    }
    
    
   private let keyChain = Keychain(service: "Password")
}

enum KeychainKeys: String {
    case passcode = "passcode1"
}
