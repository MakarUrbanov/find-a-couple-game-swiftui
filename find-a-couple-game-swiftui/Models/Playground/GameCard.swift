import Foundation

class GameCard: Identifiable, Codable {
  var emoji: String
  var isOpen: Bool
  var isSuccess: Bool = false

  init(emoji: String, isOpen: Bool = true) {
    self.emoji = emoji
    self.isOpen = isOpen
  }
}
