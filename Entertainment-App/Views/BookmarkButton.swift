import SwiftUI

struct BookmarkButton: View {
    
    let isBookmarked: Bool
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.secondary.opacity(0.6))
                .frame(width: 24, height: 24)
            
            if isBookmarked{
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.white)
                    .font(.caption)
                
            }else{
                Image(systemName: "bookmark")
                    .foregroundColor(.white)
                    .font(.caption)
            }
            
            
        }
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton(isBookmarked: true)
    }
}
