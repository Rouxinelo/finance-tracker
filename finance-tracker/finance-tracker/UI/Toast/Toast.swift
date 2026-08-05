import SwiftUI

enum ToastStyle {
    case add
    case delete
    case edit
    
    var imageName: String {
        switch self {
        case .add:
            "plus"
        case .delete:
            "trash"
        case .edit:
            "pencil"
        }
    }
    
    var actionTitle: String {
        switch self {
        case .add:
            "Entry added"
        case .delete:
            "Entry deleted"
        case .edit:
            "Entry updated"
        }
    }
    
    var circleColor: Color {
        switch self {
        case .add:
            Color(hex: "4ADE80").opacity(0.15)
        case .delete:
            Color(hex: "F87171").opacity(0.15)
        case .edit:
            Color(hex: "60A5FA").opacity(0.15)
        }
    }
    
    var iconColor: Color {
        switch self {
        case .add:
            Color(hex: "4ADE80")
        case .delete:
            Color(hex: "F87171")
        case .edit:
            Color(hex: "60A5FA")
        }
    }
}

struct Toast: View {
    enum Constants {
        static let closeButtonImage: String = "xmark"
    }
    
    @State var viewData: ViewData
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(viewData.style.circleColor)
                    .frame(width: 30, height: 30)
                
                Image(systemName: viewData.style.imageName)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(viewData.style.iconColor)
            }
            
            VStack(alignment: .leading, spacing: 1) {
                Text(viewData.expenseTitle)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.fontWhite)
                
                Text(viewData.expenseDescription)
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .foregroundStyle(Color.fontSubtitle)
            }
            
            Spacer()
            
            Button(action: {
                
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
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .background(Color.toastBackground)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.toastStroke)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black, radius: 12, y: 5)
        .padding(.horizontal, 10)
    }
}

extension Toast {
    struct ViewData {
        let style: ToastStyle
        let expenseTitle: String
        let expenseDescription: String
    }
}

#Preview {
    Toast(viewData: Toast.ViewData(style: .add,
                                   expenseTitle: "Example Title",
                                   expenseDescription: "Example Description"))
}
