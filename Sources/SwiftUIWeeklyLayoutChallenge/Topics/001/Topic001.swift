import Foundation
import SwiftUI


struct Topic001View: View {
    var content: String = "Hello, world!"

    var body: some View {
        VStack {
            HStack {
                Text(content)
                    .layoutPriority(1)
                Spacer()
                Text(content)
                    .layoutPriority(0.5)
            }
            Spacer()
            Text(content)
            Spacer()
            HStack {
                Text(content)
                    .layoutPriority(0.5)
                Spacer()
                Text(content)
                    .layoutPriority(1)
            }
        }.padding()
    }
}

struct Topic001View_Previews: PreviewProvider {
    static var previews: some View {
        Topic001View()
            .modifier(PreviewModifier())
    }
}
