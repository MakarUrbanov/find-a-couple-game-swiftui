import Foundation

class GameCard: Identifiable, Codable {
  var emoji: String
  var isOpen: Bool = false
  var isSuccess: Bool = false

  init(emoji: String) {
    self.emoji = emoji
  }

}
