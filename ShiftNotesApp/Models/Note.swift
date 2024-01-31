/*
 Заметка:
 1. Заголовок
 2. Текст
 3. Избранное
 4. Дата создания
 */

import Foundation

struct Note: Codable, Identifiable {
    var id: String
    let title: String
    let text: String
    let favorite: Bool
    let date: Date
    
    
    init(title: String = "", text: String, favorite: Bool = false, id: String = UUID().uuidString) {
        self.text = text
        self.date = Date()
        self.favorite = favorite
        self.title = title
        self.id = id
    }
    
    func makeFavourite() -> Note {
        Note(title: title, text: text, favorite: !favorite, id: id)
    }
    
}
