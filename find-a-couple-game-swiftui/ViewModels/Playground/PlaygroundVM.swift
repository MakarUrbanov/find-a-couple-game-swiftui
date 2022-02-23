import Foundation

class PlaygroundVM: PlaygroundModel {
  override init(cardsMode: CardsModeList) {
    super.init(cardsMode: cardsMode)
  }

  func getPreparedGameCardsList(_ gameCards: [GameCard]) -> [GameCard] {
    var newGameCards: [GameCard] = gameCards

    newGameCards.forEach { gameCard in
      newGameCards.append(GameCard(emoji: gameCard.emoji))
    }

    newGameCards = newGameCards.sorted { gameCard1, gameCard2 in
      gameCard1.randomPosition > gameCard2.randomPosition
    }

    return newGameCards
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

    self.gameMode = .prepared

    self.gameCards = getPreparedGameCardsList(gameCards)
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

  func checkCardHandler(card: GameCard) {

  }

  func onPressCard(id: String) {
    if gameMode != .started {
      return
    }

    if let gameCardIndex = gameCards.firstIndex(where: { $0.id == id }) {
      let gameCard = gameCards[gameCardIndex]

      if gameCard.isOpen || gameCard.isSuccess {
        return
      }

      let newGameCard = GameCard(emoji: gameCard.emoji, isOpen: true)
      gameCards[gameCardIndex] = newGameCard


    }
  }
}
