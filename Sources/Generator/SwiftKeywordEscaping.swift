private var swiftKeywords = [
  "repeat"
]

func escapeIfSwiftKeyword(_ name: String) -> String {
  if swiftKeywords.contains(name) {
    return "`\(name)`"
  }
  return name
}