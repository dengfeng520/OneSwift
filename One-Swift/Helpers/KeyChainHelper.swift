//
//  KeyChainHelper.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/11.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Security

let __userKeyChain: String = "userKeyChain"

class KeyChainHelper: NSObject {

    func configkeyChain(identifier: String) -> Dictionary<String, Any> {
        var keychainQuaryDic = Dictionary<String, Any>()
        keychainQuaryDic.updateValue(kSecClassGenericPassword, forKey: kSecClass as String)
        keychainQuaryDic.updateValue(identifier, forKey: kSecAttrService as String)
        keychainQuaryDic.updateValue(identifier, forKey: kSecAttrAccount as String)
        keychainQuaryDic.updateValue(kSecAttrAccessibleAfterFirstUnlock, forKey: kSecAttrAccessible as String)
        
        return keychainQuaryDic
    }
}

// MARK: - save
extension KeyChainHelper {
    func saveDataFromKeyChain(data: Any ,withIdentifier identifier: String) -> Bool {
        var keyChainSaveMutableDictionary = self.configkeyChain(identifier: identifier)
        SecItemDelete(keyChainSaveMutableDictionary as CFDictionary)
        keyChainSaveMutableDictionary.updateValue(NSKeyedArchiver.archivedData(withRootObject: data), forKey: kSecValueData as String)
        let saveState = SecItemAdd(keyChainSaveMutableDictionary as CFDictionary, nil)
        if saveState == noErr  {
            return true
        }
        return false
    }
}

// MARK: - delete
extension KeyChainHelper {
    func deleteDataFromKeyChain(data: Any ,withIdentifier identifier: String) -> Void {
        let keyChainDeleteMutableDictionary = self.configkeyChain(identifier: identifier)
        SecItemDelete(keyChainDeleteMutableDictionary as CFDictionary)
    }
}

// MARK: - read
extension KeyChainHelper {
    func readDataFromKeyChain(data: Any ,withIdentifier identifier: String) -> Any {
        var idObject:Any?
        var keyChainReadmutableDictionary = self.configkeyChain(identifier: identifier)
        keyChainReadmutableDictionary.updateValue(kCFBooleanTrue as Any, forKey: kSecReturnData as String)
        keyChainReadmutableDictionary.updateValue(kSecMatchLimitOne as Any, forKey: kSecMatchLimit as String)
        var queryResult: AnyObject?
        let readStatus = withUnsafeMutablePointer(to: &queryResult) { SecItemCopyMatching(keyChainReadmutableDictionary as CFDictionary, UnsafeMutablePointer($0))}
        if readStatus == errSecSuccess {
            if let data = queryResult as! NSData? {
                idObject = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as Any
            }
        }
        return idObject as Any
    }
}

// MARK: - update
extension KeyChainHelper {
    func updateDataFromKeyChain(data: Any ,withIdentifier identifier: String) -> Bool {
        let keyChainUpdataMutableDictionary = self.configkeyChain(identifier: identifier)
        var updataMutableDictionary = Dictionary<String, Any>()
        updataMutableDictionary.updateValue(NSKeyedArchiver.archivedData(withRootObject: data), forKey: kSecValueData as String)
        let updataStatus = SecItemUpdate(keyChainUpdataMutableDictionary as CFDictionary, updataMutableDictionary as CFDictionary)
        if updataStatus == noErr {
            return true
        }
        return false
    }
}
