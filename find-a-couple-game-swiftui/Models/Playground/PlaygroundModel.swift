import Foundation

enum CardsModeList: Int, CaseIterable {
  case cards4 = 2
  case cards8 = 4
  case cards16 = 8
}

enum GameMode: String {
  case beginning
  case prepared
  case started
}

enum PlaygroundUserDefaultsKeys: String {
  case topScores
}

class PlaygroundModel: ObservableObject {
  @Published var gameCards: [GameCard] = []
  @Published var closedGameCards: [GameCard] = []
  @Published var cardsMode: Int
  @Published var topScoreByMode: Double = 0.0
  @Published var secondsTimer: Double = 0.0
  var timer: Timer = Timer()
  @Published var gameMode: GameMode = .beginning
  @Published var isGameOver: Bool = false
  @Published var topScores: [String: Double] = [:] {
    didSet {
      UserDefaults.standard.set(topScores, forKey: PlaygroundUserDefaultsKeys.topScores.rawValue)
    }
  }

  init(cardsMode: CardsModeList) {
    self.cardsMode = cardsMode.rawValue

    let UD = UserDefaults.standard
    let topScoresUD = UD.object(forKey: PlaygroundUserDefaultsKeys.topScores.rawValue) as? [String: Double] ?? [:]
    var topScores: [String: Double] = [:]

    if topScoresUD.isEmpty {
      CardsModeList.allCases.forEach {
        topScores[String($0.rawValue)] = 0.0
      }
    } else {
      topScores = topScoresUD
    }

    self.topScores = topScores
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

  func setTopScoreByMode() {
    if secondsTimer < topScoreByMode || topScoreByMode == 0.0 {
      let correctSecond = Double(Int(round(secondsTimer * 10))) / 10
      topScoreByMode = correctSecond

      if topScores[String(self.cardsMode)] != nil {
        topScores[String(self.cardsMode)] = correctSecond
      }
    }
  }
}
