import SwiftUI

struct Playground: View {
  @StateObject var playground: PlaygroundModel = PlaygroundModel(cardsMode: .cards4)

  var body: some View {

    NavigationView {
      VStack {
        VStack {
          PlaygroundList()
        }

        Button(action: {
          playground.prepareGame()
        }, label: { Text("Start") })

          .navigationTitle("Playground")
          .navigationBarTitleDisplayMode(.inline)

      }
    }
  }
}
