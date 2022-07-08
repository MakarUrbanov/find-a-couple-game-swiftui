import SwiftUI

struct Playground: View {
  @StateObject var playgroundVM: PlaygroundVM = PlaygroundVM(cardsMode: .cards16)

  var body: some View {
    VStack {
      Spacer()

      InfoBlock()

      PlaygroundList()

      StartButtons()

      Spacer()
    }
    .environmentObject(playgroundVM)
  }
}
