import SwiftUI

struct BookmarkView: View {
    
    @EnvironmentObject var vm: EntertainmentViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                if(vm.bookmarked.count < 1){
                    VStack(spacing: 10){
                        Text("No 🎥 or 📺 shows saved")
                            .font(.largeTitle)
                        Text("You haven't saved any TV Show or Movies to your bookmarks")
                    }
                    
                }
                else{
                    List{
                        ForEach(vm.bookmarked){ item in
                            BookmarkRow(item: item)
                                .swipeActions(allowsFullSwipe: true) {
                                    Button(role: .destructive){
                                        vm.toogleBookmark(item: item)
                                    }label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                        
                    }
                }
            }
            .navigationTitle("Bookmarks")
            
        }
        
    }
    
   
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
            .environmentObject(EntertainmentViewModel())
    }
}
