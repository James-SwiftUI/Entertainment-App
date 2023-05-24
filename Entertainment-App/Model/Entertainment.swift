import Foundation


struct Entertainment: Codable, Identifiable{
    var id: String
    var title: String
    var thumbnail: String
    var year: Int
    var category: String
    var rating: String
    var isBookmarked: Bool
    var isTrending: Bool
    
    static let example = Entertainment(id: "5fa955fd-4818-462b-82d7-811de67d254a", title: "Beyond Earth", thumbnail: "beyond-earth", year: 2019, category: "Movie", rating: "PG", isBookmarked: false, isTrending: true)
}
