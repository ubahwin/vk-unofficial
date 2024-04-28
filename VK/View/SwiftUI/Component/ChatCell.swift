import SwiftUI

struct ChatCell: View {
    let chat: Chat

    @State private var typing = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)
            HStack {
                AsyncImage(url: chat.imgURL) { image in
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

                        if chat.online {
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 15)
                                Circle()
                                    .fill(Color(hex: 0x4BB34B))
                                    .frame(width: 10)
                            }
                            .padding(.leading, 40.5)
                            .padding(.top, 40.5)
                        }
                    }

                } placeholder: {
                    ProgressView()
                }
                .frame(width: 56, height: 56)

                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(chat.name)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.black)

                        if chat.noSound {
                            Image("muted_gray")
                                .padding(.top, 2)
                        }
                    }
                    .padding(.bottom, 5)

                    if typing {
                        HStack {
                            Text("Иван В. печатает")
                                .foregroundStyle(Color(hex: 0x2688EB))
                            Image("typing")
                        }
                    } else {
                        HStack(spacing: 0) {
                            Text("\(chat.lastMessage.from.short): ")
                                .foregroundStyle(Color(hex: 0x99A2AD))
                            Text(chat.lastMessage.text)
                                .foregroundStyle(Color(hex: 0x6D7885))
                            Text(chat.lastMessage.attachment?.title ?? "")
                            Text("\(chat.lastMessage.date.short)")
                                .foregroundStyle(Color(hex: 0x99A2AD))
                                .font(.system(size: 13, weight: .regular))
                        }
                        .lineLimit(1)
                        .font(.system(size: 15, weight: .regular))
                    }
                }
                .padding(.leading, 4)

                Spacer()

                if let unreadCount = chat.unreadCount {
                    CountPin(
                        pin: .medium,
                        unreadCount: unreadCount,
                        color: chat.noSound ? Color(hex: 0xAEB7C2) : Color(hex: 0x3F8AE0)
                    )
                } else if chat.pinned {
                    Image("pin_20")
                        .renderingMode(.template)
                        .foregroundStyle(Color(hex: 0xAEB7C2))
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 72)
    }
}

#Preview {
    ChatCell(chat: .stub)
}

#Preview {
    ChatCell(chat: Chat(
        name: "test",
        imgURL: .stubImg,
        lastMessage: LastMessage(
            text: "text",
            from: Profile(
                id: 1,
                firstName: "Ivan",
                lastName: "Vdovin",
                imgURL: .stubImg,
                online: true
            ),
            date: Date(),
            attachment: .wall
        ),
        noSound: true,
        online: true,
        pinned: true
    ))
}
