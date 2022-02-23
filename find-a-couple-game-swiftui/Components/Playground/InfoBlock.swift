import SwiftUI

struct InfoBlock: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM

  var body: some View {
    let selectedRegime = playgroundVM.cardsMode * 2

    GeometryReader { metrics in
      HStack {

        VStack {
          Text("Top Score")
          Text(String(playgroundVM.topScoreByMode))
        }
          .frame(maxWidth: metrics.size.width * 0.35, maxHeight: metrics.size.height)
          .background(.orange)
          .foregroundColor(.white)
          .cornerRadius(8)

        Text(String(format: "%.1f", playgroundVM.secondsTimer))
          .frame(maxWidth: metrics.size.width * 0.3, maxHeight: metrics.size.height)
          .background(.blue)
          .foregroundColor(.white)
          .cornerRadius(8)

        VStack {
          Text("Regime")
          Text("\(selectedRegime)")
        }
          .frame(maxWidth: metrics.size.width * 0.35, maxHeight: metrics.size.height)
          .background(.orange)
          .foregroundColor(.white)
          .cornerRadius(8)

      }
    }
      .frame(maxWidth: .infinity, maxHeight: 50)
      .padding(.bottom)
      .padding(.horizontal)
  }
}
