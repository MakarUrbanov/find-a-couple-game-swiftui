import Foundation

enum CardsModeList: Int {
  case cards4 = 2
  case cards8 = 4
  case cards16 = 8
}

class PlaygroundModel: ObservableObject {
  @Published var gameCards: [GameCard] = []
  @Published var closedGameCards: [GameCard] = []
  @Published var cardsMode: Int
  @Published var topScoreByMode: Double = 0
  @Published var secondsTimer: Double = 0.0
  var timer: Timer = Timer()
  @Published var isStarted: Bool = false

  init(cardsMode: CardsModeList) {
    self.cardsMode = cardsMode.rawValue
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

    self.isStarted = true
    self.gameCards = gameCards
  }

  func startGame() {
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      self.secondsTimer += 0.1
    }
  }
}
