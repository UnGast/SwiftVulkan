//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan
import Foundation

extension VkExtent3D {
    func swiftVersion() -> Extent3D {
        return Extent3D(
            width: self.width,
            height: self.height,
            depth: self.depth
        )
    }
}

extension String {
    public func asCString() -> UnsafePointer<Int8>? {
        let nsVal = self as NSString
        return nsVal.cString(using: String.Encoding.utf8.rawValue)
    }

    public var vulkan: UnsafePointer<Int8>? {
        asCString()
    }
}

extension Bool {
    var vulkan: VkBool32 {
        return self ? 1 : 0
    }
    func toUInt32() -> UInt32 {
        return self ? 1 : 0
    }
}

extension UInt32 {
    func toBool() -> Bool {
        return self > 0
    }
}