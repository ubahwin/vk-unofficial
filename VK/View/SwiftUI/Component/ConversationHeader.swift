import SwiftUI

struct ConversationHeader: View {
    let name: String
    let image: URL
    let noSound: Bool
    let peopleCount: Int

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.white)
                    .frame(height: 54)
                Rectangle()
                    .fill(Color(hex: 0xd7d8d9))
                    .frame(height: 1)
            }

            HStack {
                AsyncImage(url: image) { image in
                    ZStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 0.5)
                                    .foregroundColor(.black)
                                    .opacity(0.08)
                            }
                    }
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 36, height: 36)
                .padding(.leading)

                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(name)
                            .lineLimit(1)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.black)

                        if noSound {
                            Image("muted_gray")
                                .padding(.top, 2)
                        }
                    }

                    Text("\(peopleCount) участников")
                        .foregroundStyle(Color(hex: 0x99A2AD))
                        .lineLimit(1)
                }

                Spacer()

                Button {

                } label: {
                    Image("phone_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(Color(hex: 0xAEB7C2))
                }
                .buttonStyle(PlainButtonStyle())

                Button {

                } label: {
                    Image("search_24")
                        .renderingMode(.template)
                        .foregroundStyle(Color(hex: 0xAEB7C2))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 10)

                Button {

                } label: {
                    Image("more_horizontal_24")
                        .renderingMode(.template)
                        .foregroundStyle(Color(hex: 0xAEB7C2))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    ConversationHeader(
        name: "Hello",
        image: .stubImg,
        noSound: true,
        peopleCount: 5
    )
    .preferredColorScheme(.light)
}

#Preview {
    let appState = AppState()
    let chatsReducer: ChatsReducer = ._stub

    appState.lastPinnedChatIndex = 3
    appState.chats = [
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub,
        ._stub
    ]

    var chatsView = ChatsView()
        .environment(\.chatsReducer, chatsReducer)
        .environmentObject(appState)
        .preferredColorScheme(.light)
        .frame(width: 1000, height: 500)

    return chatsView
}
