import SwiftUI

struct StartButtons: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM

  var body: some View {
    VStack {
      Spacer()

      switch playgroundVM.gameMode {
      case .beginning:
        Button(action: {
          playgroundVM.prepareGame()
        }, label: {
          Text("Start")
          .frame(maxWidth: .infinity, maxHeight: 50)
          .foregroundColor(.white)
          .background(.blue)
          .cornerRadius(8)
        })

      case .prepared:
        Button(action: {
          playgroundVM.startGame()
        }, label: {
          Text("Ready?")
          .frame(maxWidth: .infinity, maxHeight: 50)
          .foregroundColor(.white)
          .background(.blue)
          .cornerRadius(8)
        })

      default:
        Button(action: {
          playgroundVM.restartGame()
        }, label: {
          Text("Restart")
          .frame(maxWidth: .infinity, maxHeight: 50)
          .foregroundColor(.white)
          .background(.blue)
          .cornerRadius(8)
        })
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 80)
    .padding(.horizontal)
  }
}
