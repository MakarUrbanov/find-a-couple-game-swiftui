import SwiftUI

struct StartButtons: View {
  @EnvironmentObject var playground: PlaygroundModel

  var body: some View {
    VStack {
      if playground.isStarted {
        Button(action: {
          playground.startGame()
        }, label: { Text("Ready?") })
      } else {
        Button(action: {
          playground.prepareGame()
        }, label: { Text("Start") })
      }
    }
      .frame(height: 100)
  }
}
