import SwiftUI

struct PlaygroundList: View {
  @EnvironmentObject var playground: PlaygroundVM

  var countOfColumns: Int {
    get {
      playground.cardsMode == 2 ? 2 : 4
    }
  }
  var columns: [GridItem] {
    get {
      Array(repeating: GridItem(.flexible()), count: countOfColumns)
    }
  }

  var body: some View {
    GeometryReader { metrics in

      if playground.gameMode != .beginning {
        LazyVGrid(columns: columns) {

          ForEach(playground.gameCards) { card in
            PlaygroundItem(
              card: card,
              cardsMode: playground.cardsMode,
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
