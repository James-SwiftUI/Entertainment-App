
import SwiftUI

struct BookmarkRow: View {
    
    @EnvironmentObject var vm: EntertainmentViewModel
    let item: Entertainment
    
    var body: some View {
        HStack{
            Image(item.thumbnail)
                .cornerRadius(12)
            VStack(alignment: .leading){
                Text(item.title)
                    .fontWeight(.semibold)
                Spacer()
            
                HStack{
                    EntertainmentIcon(picture: item.category)
                            .foregroundColor(.accentColor)
                    if vm.isItTrending(tvOrFilm: item){
                        Image(systemName: "rosette")
                            .foregroundColor(.yellow)
                            .imageScale(.small)
                    }
                }
            }
            .padding(.vertical, 20)
        }
    }
}

struct BookmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkRow(item: .example)
            .environmentObject(EntertainmentViewModel())
    }
}
