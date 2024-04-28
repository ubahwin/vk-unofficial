import SwiftUI
import Combine

struct SearchBar: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var text: String

    @State private var isEditing: Bool = false
    @FocusState private var focus: Bool

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: 0xEBEDF0))
                    .frame(height: 36)

                HStack(spacing: 0) {
                    Image("search_gray")
                        .padding(.horizontal, 12)
                    TextField("", text: $text)
                        .focused($focus)
                        .overlay {
                            HStack {
                                if text == "" {
                                    Text("Поиск")
                                        .foregroundStyle(Color(hex: 0x818C99))
                                }
                                Spacer()
                                if text != "" {
                                    Button {
                                        withAnimation {
                                            text = ""
                                            isEditing = false
                                            focus = false
                                        }
                                    } label: {
                                        Image("xmark_gray")
                                            .padding(.trailing, 12)
                                    }
                                }
                            }
                        }
                }
                .onTapGesture {
                    withAnimation {
                        isEditing = true
                        focus = true
                    }
                }
            }

            if isEditing {
                Button {
                    withAnimation {
                        self.text = ""
                        isEditing = false
                        focus = false
                    }
                } label: {
                    Text("Отменить")
                        .foregroundStyle(colorScheme == .dark ? .white : .blue)
                        .padding(.leading, 10)
                }
            }
        }
    }
}

#Preview {
    SearchBar(text: .constant("Text"))
}

#Preview {
    SearchBar(text: .constant(""))
}
