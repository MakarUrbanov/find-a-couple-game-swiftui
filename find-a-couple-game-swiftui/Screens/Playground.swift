import SwiftUI

struct Playground: View {
  @StateObject var playgroundVM: PlaygroundVM = PlaygroundVM(cardsMode: .cards16)

  var body: some View {
    NavigationView {
      VStack {
        Spacer()

        InfoBlock()

        PlaygroundList()

        StartButtons()

      }
        .navigationBarTitle("Playground", displayMode: .inline)
        .environmentObject(playgroundVM)
    }
  }
}
