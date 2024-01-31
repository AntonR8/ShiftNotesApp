/*
 Заметки:
 1. [Заметки]
 
 - добавить заметку
 - изменить заметку
 - удалить заметку
 - добавить в избранное
 - удалить из избранного
*/

import Foundation


class Notes: ObservableObject {
    
    let firstNoteText = """
                        Лишь тот земную жизнь осилит,
                        Кто будет поражен навылет
                        Непостижимостью ее.
                        В пустом пространстве ветер дик…
                        Попробуй жить, в стабильность веря:
                        Что ни мгновение – потеря.
                        Что ни мгновение – тайник.
                        
                        Лариса Миллер.
                        """
    
    let firstNoteTitle = "Стихи"
    
    @Published var notes: [Note] {
        didSet {
            saveNotes()
        }
    }
    
    @Published var selection = 1
    
    init() {
        self.notes = [Note(title: firstNoteTitle, text: firstNoteText)]
        
        guard
            let data = UserDefaults.standard.data(forKey: "myNotesApp"),
            let decodedNotes = try? JSONDecoder().decode([Note].self, from: data)
        else { return }
        self.notes = decodedNotes
    }
    
    func saveNotes() {
        let encodedNotes = try? JSONEncoder().encode(notes)
        UserDefaults.standard.setValue(encodedNotes, forKey: "myNotesApp")
    }
    
    func addNewNote(title: String, text: String) {
        let newNote = Note(title: title, text: text)
        self.notes.append(newNote)
    }
    
    func deleteNote(indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
    
    func makeFavourite(note: Note) {
        if let index = notes.firstIndex(where: {$0.id == note.id}) {
            notes[index] = note.makeFavourite()
        }
    }
    
    func resaveNote(note: Note, newTitle: String, newText: String, favorite: Bool, id: String ) {
        if let index = notes.firstIndex(where: {$0.id == note.id}) {
            notes[index] = Note(title: newTitle, text: newText, favorite: favorite, id: id)
        }
    }
}
