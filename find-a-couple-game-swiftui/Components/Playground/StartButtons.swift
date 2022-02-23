import SwiftUI

struct StartButtons: View {
  @EnvironmentObject var playground: PlaygroundVM

  var body: some View {
    VStack {
      switch playground.gameMode {
      case .beginning:
        Button(action: {
          playground.prepareGame()
        }, label: { Text("Start") })

      case .prepared:
        Button(action: {
          playground.startGame()
        }, label: { Text("Ready?") })

      default:
        Button(action: {
          // TODO stop the game
        }, label: { Text("Stop") })
      }
    }
      .frame(maxWidth: .infinity, maxHeight: 50)
  }
}
