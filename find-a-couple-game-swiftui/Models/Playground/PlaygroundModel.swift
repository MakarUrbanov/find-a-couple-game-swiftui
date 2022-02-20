import Foundation

class PlaygroundModel: ObservableObject {
  enum CardsModeList: Int {
    case cards4 = 2
    case cards8 = 4
    case cards16 = 8
    case cards32 = 16
  }

  @Published var gameCards: [GameCard] = []
  @Published var closedGameCards: [GameCard] = []
  @Published var cardsMode: Int
  @Published var topScoreByMode: Double = 0
  @Published var timing: Timer = Timer()

  init(cardsMode: CardsModeList) {
    self.cardsMode = cardsMode.rawValue
  }

  func prepareGame() {
    var gameCards: [GameCard] = []


    while gameCards.count < cardsMode {
      let randomEmoji = PlaygroundUtils.getRandomEmoji()
      let isRepeat = gameCards.contains { gameCard in
        gameCard.emoji == randomEmoji
      }

      if !isRepeat {
        let newGameCard = GameCard(emoji: randomEmoji)
        gameCards.append(newGameCard)
      }
    }

    self.gameCards = gameCards
  }
}
