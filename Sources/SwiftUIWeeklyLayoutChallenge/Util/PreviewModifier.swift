import SwiftUI

struct PreviewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ForEach(devices, id: \.rawValue) { device in
            if device.rawValue == "Mac" {
                content.previewDevice(device)
                    .frame(width: 320, height: 240, alignment: .center)
            } else {
                content.previewDevice(device)
            }
        }
    }
}

private extension PreviewModifier {
    var devices: [PreviewDevice] {
        [
            "Mac",
            "iPhone 13 mini",
            "Apple TV 4K (2nd generation)",
            "Apple Watch Series 7 - 45mm"
        ]
    }
}
