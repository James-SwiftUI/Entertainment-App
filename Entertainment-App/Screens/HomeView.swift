
import SwiftUI



struct HomeView: View {
    

    @EnvironmentObject var vm: EntertainmentViewModel
    
    var body: some View {
        NavigationStack{
                VStack(alignment: .leading){
                    Section{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(vm.filterTrending){ trending in
                                    EntertainmentRow(item: trending)
                                    
                                }
                            }
                        }
                    }header: {
                        Text("Trending")
                            .font(.system(size: 20, design: .monospaced))
                    }
                    
                    
                    List{
                        ForEach(vm.sortedPictures){ picture in
                            HomeEntertainRow(item: picture)
                                
                        }
                        
                        
                        
                    }
                    .listRowBackground(Color("backgroundColor"))
                    .listStyle(.plain)
                }
          
            .navigationTitle("Entertainment App")
            
        }
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(EntertainmentViewModel())
    }
}
