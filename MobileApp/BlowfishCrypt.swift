//
//  BlowfishCrypt.swift
//  MobileApp
//
//  Created by Marketing Sharks on 22.03.2022.
//

import Foundation
import CryptoSwift
class BlowfishCrypt{
    let password: String
    
    init(_ password: String){
        self.password = password
    }
    func encrypt(passwrd: String) -> Array<UInt8>{
        let passwordarray: [UInt8] = Array(password.utf8)
        let salt: Array<UInt8> = Array("nacllcan".utf8)
        let iv = AES.randomIV(AES.blockSize)
        var encrypted = passwordarray
        do{
        let key = try PKCS5.PBKDF2(password: passwordarray, salt: salt, iterations: 4096, keyLength: 16, variant: .sha256).calculate()
        encrypted = try Blowfish(key: key, blockMode: CBC(iv: iv), padding: .pkcs7).encrypt(passwordarray)
        } catch {
            print(passwordarray)
            print(error)
        }
        return encrypted
    }
    
    
    
}
