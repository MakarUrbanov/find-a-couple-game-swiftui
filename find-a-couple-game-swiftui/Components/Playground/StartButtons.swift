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
          .foregroundColor(.white)
          .padding()
          .padding(.horizontal, 40)
          .background(.blue)
          .cornerRadius(8)
        })

      case .prepared:
        Button(action: {
          playgroundVM.startGame()
        }, label: {
          Text("Ready?")
          .foregroundColor(.white)
          .padding()
          .padding(.horizontal, 40)
          .background(.blue)
          .cornerRadius(8)
        })

      default:
        Button(action: {
          playgroundVM.restartGame()
        }, label: {
          Text("Restart")
          .foregroundColor(.white)
          .padding()
          .padding(.horizontal, 40)
          .background(.blue)
          .cornerRadius(8)
        })
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 80)
  }
}
