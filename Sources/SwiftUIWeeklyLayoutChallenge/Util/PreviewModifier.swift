import SwiftUI

struct PreviewModifier: ViewModifier {
    var devices = Device.allCases
    var colorSchemes = ColorScheme.allCases

    func body(content: Content) -> some View {
        ForEach(devices) { device in
            ForEach(colorSchemes, id: \.self) { colorScheme in
                content.previewDevice(device.previewDevice)
                    .preferredColorScheme(colorScheme)
                    .if(device == .mac) { $0.frame(minWidth: 320, minHeight: 240) }
            }
        }
    }
}

// MARK: -
extension PreviewModifier {
    enum Device: CaseIterable {
        case mac
        case iphone
        case appleTV
        case appleWatch
    }
}

extension PreviewModifier.Device {
    var previewDevice: PreviewDevice {
        switch self {
        case .mac: return "Mac"
        case .iphone: return "iPhone 13 mini"
        case .appleTV: return "Apple TV 4K (2nd generation)"
        case .appleWatch: return "Apple Watch Series 7 - 45mm"
        }
    }
}

extension PreviewModifier.Device: Identifiable {
    var id: String { previewDevice.rawValue }
}

// MARK: -
extension View {
    func previewDevices(_ devices: [PreviewModifier.Device] = PreviewModifier.Device.allCases,
                        colorSchemes: [ColorScheme] = ColorScheme.allCases) -> some View {
        modifier(PreviewModifier(devices: devices, colorSchemes: colorSchemes))
    }
}
