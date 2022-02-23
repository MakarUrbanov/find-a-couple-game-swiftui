import SwiftUI

struct Playground: View {
  @StateObject var playgroundVM: PlaygroundVM = PlaygroundVM(cardsMode: .cards8)

  var body: some View {
    NavigationView {
      VStack {
        Spacer()

        PlaygroundList()

        StartButtons()

      }
        .navigationBarTitle("Playground", displayMode: .inline)
        .environmentObject(playgroundVM)
    }
  }
}
