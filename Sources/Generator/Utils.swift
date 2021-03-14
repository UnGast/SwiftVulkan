extension String {
  public func snakeCaseToCamelCase() -> String {
    var camel = ""

    for (index, part) in self.split(separator: "_").enumerated() {
      if index == 0 {
        camel += part.lowercased()
      } else {
        camel += String(part.first!) + String(part.dropFirst()).lowercased()
      }
    }

    return camel
  }

  public func camelCaseToSnakeCase() -> String {
    var snake = ""

    for character in self {
      if character.isLetter && character.isUppercase {
        snake += "_" + String(character)
      } else {
        snake += character.uppercased()
      }
    }
    snake.removeFirst()

    return snake
  }
}