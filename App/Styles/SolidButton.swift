import SwiftUI

struct SolidButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .foregroundColor(color(.white, whenPressed: configuration.isPressed))
        .padding()
        .background(color(.accentColor, whenPressed: configuration.isPressed))
        .cornerRadius(12)
    }

    private func color(_ color: Color, whenPressed pressed: Bool) -> Color {
        pressed ? color.opacity(0.75) : color
    }
}

struct SolidButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button title") {}
            .buttonStyle(SolidButton())
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
