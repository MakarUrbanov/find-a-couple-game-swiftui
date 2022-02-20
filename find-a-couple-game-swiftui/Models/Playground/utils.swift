import Foundation

let emojiList: [String] = [
  "😂", "🥰", "😎", "😡", "😱", "💩", "🎃", "🤖", "🐭", "🐶", "🐵", "🦊", "🐸", "🐷", "🐼", "🌚"]

struct PlaygroundUtils {
  static func getRandomEmoji() -> String {
    let emojiListCount = emojiList.count
    return emojiList[Int.random(in: 0..<emojiListCount)]
  }
}
