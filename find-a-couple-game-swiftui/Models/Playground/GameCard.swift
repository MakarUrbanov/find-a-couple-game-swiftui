import Foundation

class GameCard: Identifiable, Codable {
  var id: String
  var randomPosition: Int
  var emoji: String
  var isOpen: Bool
  var isSuccess: Bool = false

  init(
    emoji: String,
    isOpen: Bool = true,
    id: String = UUID().uuidString,
    isSuccess: Bool = false,
    randomPosition: Int = Int.random(in: 1..<100)
  ) {
    self.emoji = emoji
    self.isOpen = isOpen
    self.id = id
    self.isSuccess = isSuccess
    self.randomPosition = randomPosition
  }
}
