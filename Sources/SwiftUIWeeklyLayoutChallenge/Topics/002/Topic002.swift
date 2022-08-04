import Foundation
import SwiftUI

struct Topic002View: View {
    @Environment(\.locale) var locale

    var body: some View {
        NavigationView {
            List {
                ForEach(vitalData) { vital in
                    NavigationLink {
                        EmptyView() // Detail
                    } label: {
                        VStack(alignment: .leading, spacing: verticalSpacing) {
                            HStack {
                                Label(vital.title, systemImage: vital.iconSystemName)
                                    .foregroundColor(vital.color)
                                    .font(.subheadline.bold())
                                Spacer()
                                RelativeDateLabel(date: vital.date, locale: locale)
                            }
                            vital.value.label
                        }
                    }
                }
            }
            .navigationTitle("バイタルデータ")
        }
    }
}

private extension Topic002View {
    var verticalSpacing: CGFloat? {
        #if os(watchOS)
        nil
        #else
        18
        #endif
    }
}

struct RelativeDateLabel: View {
    var date: Date
    var locale: Locale

    var body: some View {
        Text(date.releativeString(locale: locale))
            .foregroundColor(.gray)
            .font(.footnote)
    }
}

private extension Vital.Value {
    var label: some View {
        formatted.map {
            ($0.isNumber || [".", ","].contains($0))
            ? Text(String($0))
                .font(.title.bold())
                .foregroundColor(.primary)
            : Text(String($0))
                .font(.callout.weight(.medium))
                .foregroundColor(.secondary)
        }.reduce(Text("")) { $0 + $1 }
    }

    var formatted: String {
        switch self {
        case let .number(value, style, customUnit):
            let formatter = NumberFormatter().apply {
                $0.numberStyle = style
            }
            return "\(formatter.string(for: value) ?? "")\(customUnit ?? "")"
        case let .dateComponents(dateComponents):
            let formatter = DateComponentsFormatter().apply {
                $0.unitsStyle = .brief
                $0.allowedUnits = [.hour, .minute]
            }
            return formatter.string(from: dateComponents) ?? ""
        case let .measurement(value, unit, formattedUnit):
            let measurement = Measurement(value: value, unit: formattedUnit ?? unit)
            return measurement.formatted()
        }
    }
}

extension Date {
    func releativeString(locale: Locale = .autoupdatingCurrent) -> String {
        formatted(.relative(presentation: .named).locale(locale))
    }
}

// MARK: -
struct Topic002View_Previews: PreviewProvider {
    static var previews: some View {
        Topic002View()
            .environment(\.locale, .init(identifier: "ja_JP"))
            .previewDevices([.iphone, .appleTV, .appleWatch],
                            colorSchemes: [.light])
    }
}
