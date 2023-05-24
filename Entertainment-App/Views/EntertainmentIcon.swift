import SwiftUI

struct EntertainmentIcon: View {
    
    let picture: String
    
    var body: some View {
        HStack{
            if(picture == "TV Series"){
                Image(systemName: "tv.circle")
                    .font(.title3)
                    .foregroundColor(.primary)
                Text("TV Series")
            }
            if(picture ==  "Movie"){
                Image(systemName: "film.circle")
                    .font(.title3)
                    .foregroundColor(.primary)
                Text("Movie")
                   
            }
        }
        .foregroundColor(.secondary)
        .fontWeight(.semibold)
        .font(.caption)
    
        
        
        
    }
}

struct EntertainmentIcon_Previews: PreviewProvider {
    static var previews: some View {
        EntertainmentIcon(picture: "Movie")
    }
}
