//
//  RealmHelper.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/24.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
//import RealmSwift

//class RealmHelper: NSObject {
//    // 单例模式
//    static let shared = RealmHelper()
//
//    override init() {
//        super.init()
//    }
//    func configServer() {
//        let dbVersion : UInt64 = 2
//        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
//        let dbPath = docPath.appending("/oneDB.realm")
//        let config = Realm.Configuration(fileURL: URL.init(string: dbPath), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: dbVersion, migrationBlock: { (migration, oldSchemaVersion) in
//
//        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
//        Realm.Configuration.defaultConfiguration = config
//        Realm.asyncOpen { (realm, error) in
//            if let _ = realm {
//                print("Realm 服务器配置成功!")
//            }else if let error = error {
//                print("Realm 数据库配置失败：\(error.localizedDescription)")
//            }
//        }
//    }
//
//    func convertDB() -> Realm {
//        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
//        let dbPath = docPath.appending("/oneDB.realm")
//        let defaultRealm = try! Realm(fileURL: URL.init(string: dbPath)!)
//        return defaultRealm
//    }
//}
//
//// MARK: - add data
//extension RealmHelper {
//    func addDataWithModel(dbModel: UserModel) -> Void {
//        let realmDB = convertDB()
//        try! realmDB.write {
//            realmDB.add(dbModel)
//        }
//        print("realmDB==============\(String(describing: realmDB.configuration.fileURL))")
//    }
//}
//// MARK: - delete
//extension RealmHelper {
//    func deleteDataWithModel() {
//
//    }
//}
//// MARK: - update
//extension RealmHelper {
//    // 更新全部信息
//    func updateAllDataWithModel(dbModel: UserModel) {
//        let realmDB = convertDB()
//        try! realmDB.write {
//            realmDB.add(dbModel, update: .all)
//        }
//    }
//}
//// MARK: - read
//extension RealmHelper {
//    func readDataWithModel() -> Results<UserModel> {
//        let realmDB = convertDB()
//        return realmDB.objects(UserModel.self)
//    }
//}
