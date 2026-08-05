import SwiftUI

struct HeaderView: View {
    enum Constants {
        static let plusButtonImage: String = "plus"
    }
    
    @State var viewData: ViewData
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                titleView
                
                HStack {
                    VStack(spacing: 5) {
                        subtitleView
                        amountView
                    }
                    if case .withButton(let action) = viewData.style {
                        Spacer()
                        headerViewButton(action: action)
                    }
                }
            }
            .padding()
        }
    }
}

private extension HeaderView {
    var titleView: some View {
        Text(viewData.title)
            .foregroundStyle(Color.fontWhite)
            .font(.title3)
    }
    
    var subtitleView: some View {
        Text(viewData.subtitle)
            .foregroundStyle(Color.fontSubtitle)
            .font(.footnote)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
    }
    
    var amountView: some View {
        Text(viewData.value)
            .foregroundStyle(Color.fontWhite)
            .font(.title)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
    }
    
    @ViewBuilder
    func headerViewButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: Constants.plusButtonImage)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: 28, height: 28)
                .background(Color.white.opacity(0.08))
                .clipShape(Circle())
        }
    }
}

extension HeaderView {
    struct ViewData {
        var style: HeaderViewStyle
        var title: String
        var subtitle: String
        var value: String
    }
}
