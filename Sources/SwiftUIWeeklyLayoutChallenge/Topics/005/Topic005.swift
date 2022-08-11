import SwiftUI

struct Topic005View: View {
    var body: some View {
        ScrollView {
            VStack {
                GroupBox {
                    ForEach(Topic005Content.defaultContents) {
                        Topic005ContentView(content: $0)
                    }
                } label: {
                    VStack {
                        Text("#SwiftUIレイアウト一本勝負")
                            .raibowGradient()
                            .font(.title2.weight(.heavy))
                        Text("主なテーマ")
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }.padding()
        }
    }
}

private struct Topic005ContentView: View {
    var content: Topic005Content

    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text(String(format: "%03d", content.id))
                    .font(.title3.bold())
                ForEach(content.contents, content: \.view)
            }
        }
    }
}

struct Topic005Content: Identifiable {
    var id: Int
    var contents: [Content]
}

extension Topic005Content {
    struct Content: Identifiable, ExpressibleByStringLiteral {
        var id = UUID()
        var value: String

        init(stringLiteral value: String) {
            self.value = value
        }
    }
}

extension Topic005Content.Content {
    var view: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("・")
            Text(value)
        }
        .font(.title3)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension Topic005Content {
    static var defaultContents: [Topic005Content] {
        [
            .init(id: 1, contents: [
                "StacksとlayoutPriority(_:)を使ってみる"
            ]),
            .init(id: 2, contents: [
                "NavigationLinkを使ってみる",
                "Listを使ってみる",
            ]),
            .init(id: 3, contents: [
                "Formを使ってみる",
                "PickerとpickerStyle(_:)を使ってみる",
                "fixedSize(horizontal:vertical:)を使ってみる",
            ]),
            .init(id: 4, contents: [
                "PrimitiveButtonStyleを使ってみる",
            ]),
        ]
    }
}

// MARK: -
struct RainbowGradient: ViewModifier {
    var gradient: LinearGradient = .init(colors: [.purple, .red, .orange, .yellow, .green, .blue, .purple],
                                         startPoint: .leading,
                                         endPoint: .trailing)

    func body(content: Content) -> some View {
        content.foregroundStyle(gradient)
    }
}

extension View {
    func raibowGradient() -> some View {
        modifier(RainbowGradient())
    }
}

// MARK: -
struct Topic005View_Previews: PreviewProvider {
    static var previews: some View {
        Topic005View()
            .previewDevices([.mac, .iphone])
    }
}
