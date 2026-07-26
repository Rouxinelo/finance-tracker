import SwiftUI

enum HeaderViewStyle {
    case withButton(buttonAction: () -> Void)
    case withoutButton
}

struct HeaderView: View {
    @State var style: HeaderViewStyle
    @State var title: String
    @State var subtitle: String
    @State var value: String

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text(title)
                    .foregroundStyle(Color.fontWhite)
                    .font(.title3)
                
                HStack {
                    VStack(spacing: 5) {
                        Text(subtitle)
                            .foregroundStyle(Color.fontSubtitle)
                            .font(.footnote)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
                        Text(value)
                            .foregroundStyle(Color.fontWhite)
                            .font(.title)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                    }
                    
                    if case .withButton(let action) = style {
                        Spacer()
                        HeaderViewButton(action: action)
                    }
                }
            }
            .padding()
        }
    }
}


struct HeaderViewButton: View {
    @State var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: 28, height: 28)
                .background(Color.white.opacity(0.08))
                .clipShape(Circle())
        }
    }
}
