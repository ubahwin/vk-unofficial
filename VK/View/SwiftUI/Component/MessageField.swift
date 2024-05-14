import SwiftUI

struct MessageField: View {
    @Binding var message: String

    @State private var isEditing: Bool = false
    @FocusState private var focus: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(height: 36)
                .shadow(color: Color(hex: 0xd1d1d1), radius: 5)

            HStack(spacing: 0) {
                Button {

                } label: {
                    Image("add_circle_outline_24")
                        .renderingMode(.template)
                        .foregroundStyle(Color(hex: 0xAEB7C2))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 10)

                TextField("", text: $message)
                    .focused($focus)
                    .overlay {
                        HStack {
                            if message == "" {
                                Text("Напишите сообщение...")
                                    .foregroundStyle(Color(hex: 0xAEB7C2))
                            }

                            Spacer()

                            Button {

                            } label: {
                                Image("smile_outline_24")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color(hex: 0xAEB7C2))
                            }
                            .buttonStyle(PlainButtonStyle())

                            if message == "" {
                                Button {

                                } label: {
                                    Image("microphone_slash_outline_24")
                                        .renderingMode(.template)
                                        .foregroundStyle(Color(hex: 0xAEB7C2))
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.trailing, 10)
                            } else {
                                Button {

                                } label: {
                                    Image("send_24")
                                        .renderingMode(.template)
                                        .foregroundStyle(Color(hex: 0x4586e4))
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.trailing, 10)
                            }
                        }
                    }

                    #if os(macOS)
                    .focusable(false)
                    .textFieldStyle(PlainTextFieldStyle())
                    #endif
            }
            .onTapGesture {
                withAnimation {
                    focus = true
                }
            }
        }
    }

    private func removeText() {
        withAnimation {
            message = ""
            isEditing = false
            focus = false
        }
    }
}

#Preview {
    ZStack {
        Rectangle()
        MessageField(message: .constant("asd"))
            .frame(width: 400)
    }
}
