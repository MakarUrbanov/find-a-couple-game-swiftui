import Foundation

class PlaygroundVM: PlaygroundModel {
  override init(cardsMode: CardsModeList) {
    super.init(cardsMode: cardsMode)
  }

  func prepareGame() {
    var gameCards: [GameCard] = []

    while gameCards.count < cardsMode * 2 {
      let randomEmoji = PlaygroundUtils.getRandomEmoji()
      let isRepeat = gameCards.contains { gameCard in
        gameCard.emoji == randomEmoji
      }

      if !isRepeat {
        let newGameCard = GameCard(emoji: randomEmoji)
        gameCards.append(newGameCard)
      }
    }

    self.gameMode = .prepared
    self.gameCards = gameCards
  }

  func startGame() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      self.secondsTimer += 0.1
    }

    self.gameCards = gameCards.map { gameCard in
      return GameCard(emoji: gameCard.emoji, isOpen: false)
    }

    self.gameMode = .started
  }
}
