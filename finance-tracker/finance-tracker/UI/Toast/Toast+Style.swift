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
