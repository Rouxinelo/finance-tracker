import SwiftUI

struct FullPageLoader: View {
    enum Constants {
        static let circleSize: CGFloat = 100
    }
    @State var viewData: ViewData
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.backgroundColor)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(Color.sheetBackgroundColor,
                                style: StrokeStyle(lineWidth: 10,
                                                   lineCap: .round))
                        .frame(width: Constants.circleSize,
                               height: Constants.circleSize)
                    Circle()
                        .trim(from: 0, to: 0.75)
                        .stroke(Color.loaderGreen,
                                style: StrokeStyle(lineWidth: 10,
                                                   lineCap: .round))
                        .frame(width: Constants.circleSize,
                               height: Constants.circleSize)
                        .rotationEffect(.degrees(rotation))
                        .onAppear {
                            withAnimation(.linear(duration: 1)
                                .repeatForever(autoreverses: false)) {
                                rotation = 360
                            }
                        }
                }
                
                Text(viewData.title)
                    .font(.largeTitle)
                    .foregroundStyle(Color.fontWhite)
                
            }
        }
    }
}

extension FullPageLoader {
    struct ViewData {
        var title: String
    }
}
