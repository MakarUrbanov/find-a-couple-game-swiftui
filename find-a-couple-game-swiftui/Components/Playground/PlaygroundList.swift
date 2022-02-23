import SwiftUI

struct PlaygroundList: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM

  var countOfColumns: Int {
    get {
      switch playgroundVM.cardsMode {
      case 2:
        return 2

      default:
        return 4
      }
    }
  }
  var columns: [GridItem] {
    get {
      Array(repeating: GridItem(.flexible()), count: countOfColumns)
    }
  }

  var body: some View {
    GeometryReader { metrics in

      if playgroundVM.gameMode != .beginning {
        ZStack {

          if playgroundVM.isGameOver {
            Text("Game over!")
            .padding(20)
            .padding(.horizontal, 20)
            .background(.blue)
            .cornerRadius(8)
            .foregroundColor(.white)
            .font(.body.weight(.bold))
            .zIndex(2)
            .onTapGesture {
              playgroundVM.restartGame()
            }
          }

          LazyVGrid(columns: columns, spacing: 4) {

            ForEach(playgroundVM.gameCards) { card in
              PlaygroundItem(
                card: card,
                cardsMode: playgroundVM.cardsMode,
                parentHeight: metrics.size.height,
                parentWidth: metrics.size.width
              )
            }

          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      } else {
        VStack {
          Text("Select cards mode and press 'Start'")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .font(.body.weight(.semibold))
          .foregroundColor(.orange)
        }
        .onTapGesture {
          playgroundVM.prepareGame()
        }
      }

    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(.horizontal)
  }
}
