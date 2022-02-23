import SwiftUI

func getHeightByMode(parentHeight: Double, mode: Int) -> Double {
  switch mode {
  case CardsModeList.cards16.rawValue:
    return parentHeight * 0.25

  case CardsModeList.cards8.rawValue:
    return parentHeight * 0.3

  default:
    return parentHeight * 0.5
  }
}

func getWidthByMode(parentWidth: Double, mode: Int) -> Double {
  switch mode {
  case CardsModeList.cards4.rawValue:
    return parentWidth * 0.5

  default:
    return parentWidth * 0.25
  }
}

struct PlaygroundItem: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM
  @State var card: GameCard
  @State var width: Double
  @State var height: Double

  init(card: GameCard, cardsMode: Int, parentHeight: Double, parentWidth: Double) {
    self.card = card
    self.width = getWidthByMode(parentWidth: parentWidth, mode: cardsMode)
    self.height = getHeightByMode(parentHeight: parentHeight, mode: cardsMode)
  }

  var body: some View {
    let isOpen = card.isOpen
    let isSuccess = card.isSuccess

    HStack {
      VStack {
        if isOpen || isSuccess {
          Text(card.emoji)
            .font(.system(size: 40))
        }
      }
        .frame(width: width, height: height)
        .background(isSuccess ? .green : .orange)
        .cornerRadius(12)
        .onTapGesture {
          playgroundVM.onPressCard(id: card.id)
        }
    }
  }
}
