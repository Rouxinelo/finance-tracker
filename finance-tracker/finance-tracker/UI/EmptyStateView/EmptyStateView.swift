import SwiftUI

struct EmptyStateView: View {
    let viewData: ViewData
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            viewData.image
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.fontSubtitle)
            
            Text(viewData.title)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.fontWhite)
            
            Text(viewData.description)
                .multilineTextAlignment(.center)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.fontSubtitle)
        }
        .padding()
    }
}

extension EmptyStateView {
    struct ViewData {
        var image: Image
        var title: String
        var description: String
    }
}
