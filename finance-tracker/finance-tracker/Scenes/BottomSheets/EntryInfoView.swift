import SwiftUI

struct EntryInfoView: View {
    @State var viewData: EntryInfoView.ViewData

    var body: some View {
        VStack(spacing: 18) {
            VStack(spacing: 4) {
                Text(viewData.name)
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(Color.fontWhite)
                Text(viewData.entryType.displayName)
                    .font(.system(size: 13))
                    .foregroundStyle(Color.fontSubtitle)
            }

            Text(viewData.amount.formattedAmount())
                .font(.system(size: 32))
                .foregroundStyle(Color.fontWhite)

            VStack(spacing: 0) {
                detailRow(label: "Date", value: viewData.date)
                Rectangle()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 0.5)
                detailRow(label: "Recurring", value: viewData.isRecurring ? "Yes" : "No")
            }
            .padding(.horizontal, 14)
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            HStack(spacing: 10) {
                Button {
                    viewData.onEditAction(viewData.entryId)
                } label: {
                    Text("Edit")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.fontWhite)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.white.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Button {
                    viewData.onDeleteAction(viewData.entryId)
                } label: {
                    Text("Delete")
                        .font(.system(size: 14))
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.red.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .padding(22)
    }

    private func detailRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 13))
                .foregroundStyle(Color.fontSubtitle)
            Spacer()
            Text(value)
                .font(.system(size: 13))
                .foregroundStyle(Color.fontWhite)
        }
        .padding(.vertical, 11)
    }
}

extension EntryInfoView {
    struct ViewData {
        let entryId: String
        let name: String
        let entryType: EntryType
        let amount: Double
        let date: String
        let isRecurring: Bool
        let onEditAction: (String) -> Void
        let onDeleteAction: (String) -> Void
    }
}
