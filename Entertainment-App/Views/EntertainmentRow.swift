import SwiftUI

struct EntertainmentRow: View {

    @EnvironmentObject var vm: EntertainmentViewModel
    let item: Entertainment
    
    
    var body: some View {
        VStack(alignment: .leading){
                VStack(alignment: .leading){
                    ZStack(alignment: .topTrailing){
                        Image(item.thumbnail)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        BookmarkButton(isBookmarked: item.isBookmarked)
                            .padding(8)
                            .onTapGesture {
                                vm.toogleBookmark(item: item)
                                
                            }
                    }
                }
           
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(String(item.year))
                    EntertainmentIcon(picture: item.category)
                }
                Text(item.title)
                    .fontWeight(.bold)
            }
        }
    }
}

struct EntertainmentRow_Previews: PreviewProvider {
    static var previews: some View {
        EntertainmentRow(item: .example)
            .environmentObject(EntertainmentViewModel())
    }
}
