import SwiftUI

struct PlaygroundList: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM

  var countOfColumns: Int {
    get {
      playgroundVM.cardsMode == 2 ? 2 : 4
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
        LazyVGrid(columns: columns) {

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

    }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding(.horizontal)
  }
}
