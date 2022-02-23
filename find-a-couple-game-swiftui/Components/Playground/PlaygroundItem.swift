import SwiftUI

func getHeightByMode(parentHeight: Double, mode: Int) -> Double {
  switch mode {
  case CardsModeList.cards32.rawValue:
    return parentHeight * 0.125

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
  @State var isTapped = false
  let ANIMATION_DURATION = 0.06
  @State var rotateAnimation: Double = 0.0

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
      .scaleEffect(isTapped ? 0.9 : 1)
      .rotation3DEffect(.degrees(isOpen ? 0 : 180), axis: (x: 0, y: 1, z: 0))
      .animation(.easeInOut(duration: ANIMATION_DURATION), value: isTapped)
      .animation(.easeInOut(duration: ANIMATION_DURATION), value: isOpen)
      .onTapGesture {
        isTapped = true

        DispatchQueue.main.asyncAfter(deadline: .now() + ANIMATION_DURATION) {
          isTapped = false
          playgroundVM.onPressCard(id: card.id)
        }
      }
    }
  }
}
