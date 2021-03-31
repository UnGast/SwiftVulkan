# Vulkan + Swift

This library contains Swift bindings for Vulkan that are largely generated.

You can find a demo application here: [SwiftVulkanDemo](https://github.com/UnGast/SwiftVulkanDemo).

<img alt="screenshot" src="https://github.com/UnGast/SwiftVulkanDemo/raw/master/Docs/Assets/screenshot.png?raw=true" width="300"/>

<br><br>

There are still some types and functions for which there is no binding. I'm adding as I need them for my projects.

<br>

Documentation will be written later. If you have question or problems just open an issue.

<br>

The general approach and a good amount of bindings have been taken from: [alexanderuv/vulkanSwift](https://github.com/alexanderuv/vulkanSwift).

<br>
<br>

# List of things that could cause bugs

- uint32_t type fields that are marked as optional will get a value of 0 if not specified
  - this could overwrite the default value of the specification (if there is any)
  - but something like this is necessary because some fields are marked as optional, but they are not recognized as optional when imported into swift
  - example: DescriptorSetLayoutBinding.descriptorCount