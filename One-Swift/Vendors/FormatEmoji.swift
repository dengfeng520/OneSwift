//
//  FormatEmoji.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/16.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class FormatEmoji: NSObject {
    static func emojiFlag(regionCode: String) -> String? {
        let code = regionCode.uppercased()
        
        guard Locale.isoRegionCodes.contains(code) else {
            return nil
        }
        
        var flagString = ""
        for s in code.unicodeScalars {
            guard let scalar = UnicodeScalar(127397 + s.value) else {
                continue
            }
            flagString.append(String(scalar))
        }
        return flagString
    }
}
