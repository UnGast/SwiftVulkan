//  
// Copyright (c) Alexander Ubillus. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import CVulkan

public class SurfaceKHR {

    public let instance: Instance
    public let pointer: VkSurfaceKHR

    public init(instance: Instance, pointer: VkSurfaceKHR) {
        self.instance = instance
        self.pointer = pointer
    }

    deinit {
        print("Destroying surface")
        vkDestroySurfaceKHR(instance.pointer, pointer, nil)
    }
}
