import SwiftUI

enum HeaderViewStyle {
    case withButton(buttonAction: () -> Void)
    case withoutButton
}

struct HeaderView: View {
    @State var viewData: ViewData

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text(viewData.title)
                    .foregroundStyle(Color.fontWhite)
                    .font(.title3)
                
                HStack {
                    VStack(spacing: 5) {
                        Text(viewData.subtitle)
                            .foregroundStyle(Color.fontSubtitle)
                            .font(.footnote)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
                        Text(viewData.value)
                            .foregroundStyle(Color.fontWhite)
                            .font(.title)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                    }
                    
                    if case .withButton(let action) = viewData.style {
                        Spacer()
                        HeaderViewButton(action: action)
                    }
                }
            }
            .padding()
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
