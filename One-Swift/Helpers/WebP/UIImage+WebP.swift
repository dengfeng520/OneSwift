//
//  UIImage+Webp.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/12.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

private func freeWebPData(info: UnsafeMutableRawPointer?, data: UnsafeRawPointer, size: Int) -> Void {
    free(UnsafeMutableRawPointer(mutating: data))
}

extension UIImage {
    /// 加载webp图片
    convenience init?(webPPath path: String) {
        guard let imageData = NSData(contentsOfFile: path) else {
            return nil
        }
        
        var width: CInt = 0
        var height: CInt = 0
        let rgbaData = WebPDecodeRGBA(imageData.bytes.assumingMemoryBound(to: UInt8.self), imageData.length, &width, &height)
        
        let provider = CGDataProvider(dataInfo: nil, data: rgbaData!, size: Int(width) * Int(height) * 4, releaseData: freeWebPData)
        let bitmapWithAlpha = CGBitmapInfo(rawValue: CGImageAlphaInfo.last.rawValue)
        
        if let cgimage = CGImage(width:Int(width),
                                 height:Int(height),
                                 bitsPerComponent: 8,
                                 bitsPerPixel: 32,
                                 bytesPerRow: 4 * Int(width),
                                 space: CGColorSpaceCreateDeviceRGB(),
                                 bitmapInfo: bitmapWithAlpha,
                                 provider: provider!,
                                 decode: nil,
                                 shouldInterpolate: true,
                                 intent: CGColorRenderingIntent.defaultIntent) {
            self.init(cgImage: cgimage)
        } else {
            return nil
        }
    }
}
