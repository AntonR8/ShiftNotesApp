import SwiftUI

struct MenuIconView: View {
    @EnvironmentObject var notes: Notes
    var selectionNumber: Int
    var systemName: String
    var menuIconName: String
    var iconColor: Color
    var body: some View {
        Button(action: {
            withAnimation(.default) {
                notes.selection = selectionNumber
            }
        }, label: {
            VStack {
                Image(systemName: systemName)
                    .font(.largeTitle)
                    .padding(3)
                    Text(menuIconName)
                        .font(.footnote)
            }  .foregroundColor(iconColor)
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(Notes())
}
