import SwiftUI

struct Playground: View {
  @StateObject var playground: PlaygroundModel = PlaygroundModel(cardsMode: .cards8)

  var body: some View {
    NavigationView {
      VStack {
        Spacer()

        PlaygroundList()

        StartButtons()

      }
        .navigationBarTitle("Playground", displayMode: .inline)
        .environmentObject(playground)
    }
  }
}
