import SwiftUI

struct StartButtons: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM

  var body: some View {
    VStack {
      switch playgroundVM.gameMode {
      case .beginning:
        Button(action: {
          playgroundVM.prepareGame()
        }, label: { Text("Start") })

      case .prepared:
        Button(action: {
          playgroundVM.startGame()
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
