import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notes: Notes
    var body: some View {
        ZStack {
            if notes.selection == 1{
                NotesView()
            }
            else if notes.selection == 3{
                FavouriteView()
            }
            VStack {
                Spacer()
                MenuView(textEditor: "Текст вашей новой заметки", textField: "")
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Notes())
}
