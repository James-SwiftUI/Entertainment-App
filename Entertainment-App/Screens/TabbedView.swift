import SwiftUI

struct TabbedView: View {
    var body: some View {
        TabView{
            HomeView()
                .preferredColorScheme(.dark)
                .tabItem {
                    Label("Home", systemImage: "house")
            }
            EntertainmentView(category: .TV)
                .preferredColorScheme(.dark)
                .tabItem {
                    Label("TV", systemImage: "tv")
                }
            EntertainmentView(category: .FILM)
                .preferredColorScheme(.dark)
                .tabItem {
                    Label("Film", systemImage: "film")
                }
            BookmarkView()
                .preferredColorScheme(.dark)
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
        }
        .accentColor(.red)
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
