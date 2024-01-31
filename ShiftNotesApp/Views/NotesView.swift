import SwiftUI

struct NotesView: View {
    
    @EnvironmentObject var notes: Notes
    
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(notes.notes) {note in
                    NavigationLink {
                        NoteEditorView(textEditor: note.text, textField: note.title, note: note)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .bold()
                            Text(note.text)
                            HStack {
                                Text(note.date.formatted(
                                    date: .abbreviated,
                                    time: .omitted))
                                .font(.callout)
                                    Image(systemName: note.favorite ? "star.fill" : "star")
                                        .foregroundColor(.orange)                         }
                        }
                        .frame(maxHeight: 150)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button(note.favorite ? "Убрать из избранного" : "Добавить в избранное") {
                            notes.makeFavourite(note: note)
                        }
                        .tint(note.favorite ? .blue : .yellow)
                    }
                }
                .onDelete(perform: notes.deleteNote)
            }
            .navigationTitle("Все заметки")
        }

    }
}

#Preview {
    ContentView()
        .environmentObject(Notes())
}
