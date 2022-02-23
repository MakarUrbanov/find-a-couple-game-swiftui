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

class PlaygroundModel: ObservableObject {
  @Published var gameCards: [GameCard] = []
  @Published var closedGameCards: [GameCard] = []
  @Published var cardsMode: Int
  @Published var topScoreByMode: Double = 0.0
  @Published var secondsTimer: Double = 0.0
  var timer: Timer = Timer()
  @Published var gameMode: GameMode = .beginning

  init(cardsMode: CardsModeList) {
    self.cardsMode = cardsMode.rawValue
  }
}
