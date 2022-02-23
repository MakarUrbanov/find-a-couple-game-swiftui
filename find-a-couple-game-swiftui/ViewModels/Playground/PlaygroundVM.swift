import Foundation

class PlaygroundVM: PlaygroundModel {
  override init(cardsMode: CardsModeList) {
    super.init(cardsMode: cardsMode)
  }

  func changeCardsMode(cardsMode: CardsModeList) {
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

  func restartGame() {
    gameCards = []
    closedGameCards = []
    gameMode = .beginning
    timer.invalidate()
    secondsTimer = 0.0
    self.isGameOver = false
  }

  func checkTheEndGame() {
    let isGameOver = gameCards.count == closedGameCards.count

    if isGameOver {
      timer.invalidate()
      self.isGameOver = true
    }
  }

  func checkSameCardHandler(card: GameCard) {
    if closedGameCards.count % 2 == 0 || closedGameCards.isEmpty {
      closedGameCards.append(card)

      return
    }

    let lastClosedGameCard = closedGameCards[closedGameCards.count - 1]
    let isLastSameCard = lastClosedGameCard.emoji == card.emoji

    if isLastSameCard {
      closedGameCards.append(card)
      checkTheEndGame()

      return
    }

    closedGameCards.removeLast()

    gameCards = gameCards.map { gameCard in
      if gameCard.id == card.id || gameCard.id == lastClosedGameCard.id {
        gameCard.isOpen = false
        gameCard.isSuccess = false
        return gameCard
      }

      return gameCard
    }
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

      gameCards = gameCards.map { card in
        if card.id == gameCard.id {
          card.isSuccess = true
          card.isOpen = true
          return card
        }

        return card
      }

      let card = gameCards[gameCardIndex]

      checkSameCardHandler(card: card)
    }
  }
}
