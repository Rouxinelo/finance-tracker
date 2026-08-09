import SwiftUI

struct Toast: View {
    enum Constants {
        static let closeButtonImage: String = "xmark"
    }
    
    @Binding var isVisible: Bool
    @State private var yOffset: CGFloat
    @State var viewData: ViewData
    
    init(isVisible: Binding<Bool>, viewData: ViewData, startOffset: CGFloat = -200) {
        self._isVisible = isVisible
        self.viewData = viewData
        self._yOffset = State(initialValue: startOffset)
    }
    
    var body: some View {
        
        VStack {
            HStack(spacing: 10) {
                toastIcon
                toastText
                Spacer(minLength: 0)
                closeButton
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .background(Color.toastBackground)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.toastStroke)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black, radius: 12, y: 5)
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
            .offset(y: yOffset)
            .onAppear {
                withAnimation {
                    yOffset = 0
                }
            }
            Spacer()
        }
    }
}

private extension Toast {
    var toastIcon: some View {
        ZStack {
            Circle()
                .fill(viewData.style.circleColor)
                .frame(width: 30, height: 30)
            
            Image(systemName: viewData.style.imageName)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(viewData.style.iconColor)
        }
    }
    
    var toastText: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(viewData.expenseTitle)
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundStyle(Color.fontWhite)
            
            Text(viewData.expenseDescription)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundStyle(Color.fontSubtitle)
        }
    }
    
    var closeButton: some View {
        Button(action: {
            close()
        }) {
            ZStack {
                Circle()
                    .fill(Color.toastCloseButtonBackground)
                    .frame(width: 25, height: 25)
                
                Image(systemName: Constants.closeButtonImage)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color.fontWhite)
            }
        }
    }
    
    func close() {
        withAnimation {
            yOffset = -200
        } completion: {
            isVisible = false
        }
    }
}

extension Toast {
    struct ViewData {
        let style: ToastStyle
        let expenseTitle: String
        let expenseDescription: String
    }
}
