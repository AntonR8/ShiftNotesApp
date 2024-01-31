import SwiftUI

struct MenuView: View {
    @FocusState var titleEditing: Bool
    @State var textEditor: String
    @State var textField: String
    @EnvironmentObject var notes: Notes
    var body: some View {
        VStack{
            if (notes.selection != 2) {
                HStack(alignment: .bottom) {
                    MenuIconView(selectionNumber: 1,
                                 systemName: "list.bullet.clipboard",
                                 menuIconName: "Заметки", iconColor: (notes.selection == 1) ? .orange : .white)
                    
                    Spacer()
                    MenuIconView(selectionNumber: 2,
                                 systemName: "plus.circle.fill",
                                 menuIconName: "Добавить", iconColor: (notes.selection == 2) ? .orange : .white)
                    Spacer()
                    MenuIconView(selectionNumber: 3,
                                 systemName: "star",
                                 menuIconName: "Избранное", iconColor: (notes.selection == 3) ? .orange : .white)
                } //END HStack
                .padding(30)
            }
            if (notes.selection == 2) {
                HStack {
                    Button(action: {
                        withAnimation(.default) {
                            notes.selection = 1
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Отменить")
                        }
                }).padding()
            
                    Spacer()
                    Button(action: {
                        notes.addNewNote(title: textField, text: textEditor )
                        textEditor = "Текст вашей новой заметки"
                        textField = "Заголовок"
                        withAnimation(.default) {
                            notes.selection = 1
                        }
                    }, label: {
                            Text("Сохранить")
                }).padding()
                }
                
                TextField("Заголовок", text: $textField)
                    .focused($titleEditing)
                    .bold()
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 5)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.titleEditing = true
                        }
                    }
                TextEditor(text: $textEditor)
                    .foregroundColor(.white)
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth: .infinity)
            
               
                Spacer()
            }
                
            
    }

        .frame(
            maxWidth: .infinity,
            maxHeight: (notes.selection != 2) ? UIScreen.main.bounds.size.width/4 : UIScreen.main.bounds.size.height-100 )
        .background(LinearGradient(
            colors: [.blue, .red],
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .cornerRadius((notes.selection != 2) ? UIScreen.main.bounds.size.width/8.6 : 20)
        .padding(10)
    }
}
 
#Preview {
    ContentView()
        .environmentObject(Notes())
}
