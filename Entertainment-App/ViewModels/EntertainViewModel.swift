import Foundation

final class EntertainmentViewModel: ObservableObject{
    @Published var pictures: [Entertainment] = []
    @Published var error = false
    
    @Published var bookmarked: [Entertainment] = []
    
    init(){
        
        do{
            pictures =  try StaticJSONMapper.decode(file: "data", type: [Entertainment].self)
        }catch{
            self.error = true
        }
    }
    
    func isItTrending(tvOrFilm: Entertainment)-> Bool{
        return pictures.contains { _ in tvOrFilm.isTrending == true}
    }
    
    var filterTrending: [Entertainment]{
        return pictures.filter { $0.isTrending == true}
    }
    
    var sortedPictures: [Entertainment]{
        pictures.sorted{
            $0.title < $1.title
        }
    }
    
    func filterEntertainment(category: Picture)-> [Entertainment]{
        return pictures.filter { $0.category == category.rawValue }
    }
    
    func searchTVShowsAndFilms(name: String, category: Picture)-> [Entertainment]{
        
        return filterEntertainment(category: category).filter{ $0.title.localizedCaseInsensitiveContains(name) }
    }
    
    func toogleBookmark(item: Entertainment){
        if let itemid = pictures.firstIndex(where: { $0.id == item.id}){
            pictures[itemid].isBookmarked.toggle()
            
            if(pictures[itemid].isBookmarked){
                bookmarked.append(item)
            }else{
                if let index = bookmarked.firstIndex(where: {$0.id == item.id}){
                    bookmarked.remove(at: index)
                }
                
            }
        }
    }
    
    
    
  
}
