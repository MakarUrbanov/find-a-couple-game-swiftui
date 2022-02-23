import Foundation

class GameCard: Identifiable, Codable {
  var id: String = UUID().uuidString
  var randomPosition = Int.random(in: 1..<100)
  var emoji: String
  var isOpen: Bool
  var isSuccess: Bool = false

  init(emoji: String, isOpen: Bool = true) {
    self.emoji = emoji
    self.isOpen = isOpen
  }
}
