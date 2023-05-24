
import SwiftUI

struct EntertainmentView: View {
    
    @EnvironmentObject var vm: EntertainmentViewModel
    let category: Picture
    @State private var searchText = ""
    
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns){
                    ForEach(searchResults){ item in
                        EntertainmentRow(item: item)
                    }
                }
            }
            .padding(.horizontal, 4)
            .searchable(text: $searchText)
            .navigationTitle(category == .FILM ? "Films" : "TV Series")
        }
    }
    
    var searchResults: [Entertainment]{
        if searchText.isEmpty{
            return vm.filterEntertainment(category: category)
        }else{
            return vm.searchTVShowsAndFilms(name: searchText, category: category)
        }
        
    }
}

struct EntertainmentView_Previews: PreviewProvider {
    static var previews: some View {
        EntertainmentView(category: .TV)
            .environmentObject(EntertainmentViewModel())
    }
}
