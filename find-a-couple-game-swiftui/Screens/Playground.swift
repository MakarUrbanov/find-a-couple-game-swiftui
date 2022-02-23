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

        Spacer()
      }
        .navigationBarTitle("Playground", displayMode: .inline)
        .environmentObject(playgroundVM)
    }
  }
}
