import SwiftUI

struct HomeEntertainRow: View {
    
    @EnvironmentObject var vm: EntertainmentViewModel
    let item: Entertainment
    
    var body: some View {
        VStack(alignment: .leading){
                HStack{
                    ZStack(alignment: .topTrailing){
                        Image(item.thumbnail)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        BookmarkButton(isBookmarked: item.isBookmarked)
                            .padding(8)
                            .onTapGesture {
                                vm.toogleBookmark(item: item)
                                
                            }
                    }
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Text(String(item.year))
                            EntertainmentIcon(picture: item.category)
                        }
                        
                        Text(item.title)
                            .fontWeight(.bold)
                       
                            ZStack{
                                Circle()
                                    .foregroundColor(ratingColor)
                                    .frame(width: 34, height: 34)
                                Text(item.rating)
                                    .font(.subheadline)
                            }
                      
                        
                        
                        
                           
                        
                    }
                }
           
            
        }
    }
    
    var ratingColor: Color{
        switch item.rating{
        case "PG":
               return .yellow
        case "E":
            return .green
        case "18+":
            return .red
            
            
        default:
                return.black
        }
    }
}

struct EntertainRowAlternative_Previews: PreviewProvider {
    static var previews: some View {
        HomeEntertainRow(item: .example)
            .environmentObject(EntertainmentViewModel())
    }
}
