import SwiftUI

struct InfoBlock: View {
  @EnvironmentObject var playgroundVM: PlaygroundVM
  @State var selectedCardsMode: Int = 4
  let cardsModeList: [Int] = CardsModeList.allCases.map {
    $0.rawValue
  }

  var body: some View {
    GeometryReader { metrics in

      HStack {

        VStack {
          Text("Top Score \(selectedCardsMode * 2)")
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
          Menu {
            Picker(selection: $selectedCardsMode) {
              ForEach(cardsModeList, id: \.self) {
                Text("\($0 * 2) cards")
              }
            } label: {
            }
          } label: {
            Text("\(selectedCardsMode * 2) cards")
            .foregroundColor(.white)
            .frame(maxWidth: metrics.size.width * 0.3, maxHeight: metrics.size.height)
          }
          .onChange(of: selectedCardsMode, perform: { cardsMode in
            let cardsModeInt = CardsModeList(rawValue: cardsMode)
            playgroundVM.changeCardsMode(cardsMode: cardsModeInt ?? .cards8)
          })
          .disabled(playgroundVM.gameMode != GameMode.beginning)
        }
        .frame(maxWidth: metrics.size.width * 0.35, maxHeight: metrics.size.height)
        .background(.orange)
        .foregroundColor(.white)
        .cornerRadius(8)

      }
    }
    .onAppear {
      selectedCardsMode = playgroundVM.cardsMode
    }
    .frame(maxWidth: .infinity, maxHeight: 60)
    .padding(.bottom)
    .padding(.horizontal)
  }
}
