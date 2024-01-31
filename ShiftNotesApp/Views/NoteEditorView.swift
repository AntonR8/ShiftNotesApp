import SwiftUI

struct NoteEditorView: View {
    @FocusState var titleEditing: Bool
    @EnvironmentObject var notes: Notes
    @State var textEditor: String = ""
    @State var textField: String = ""
    var note: Note
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.noteBackground],
                startPoint: .bottomTrailing,
                endPoint: .topLeading)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                            notes.resaveNote(note: note, newTitle: textField, newText: textEditor, favorite: note.favorite, id: note.id)
                        }, label: {
                                Text("Сохранить")
                                
                    })
                        .buttonStyle(.bordered)
                    Spacer()
                }

                TextField("\(textField)", text: $textField)
                    .focused($titleEditing)
                    .bold()
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(.horizontal, 5)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                            self.titleEditing = true
                        }
                    }
                
                TextEditor(text: $textEditor)
                    .foregroundColor(.black)
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth: .infinity)
                        
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    NoteEditorView(note: Note(text: "sdfsdfsdfsdfsdf"))
        .environmentObject(Notes())
}
