//
//  ContentView.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AdsViewModel()
    @State var addAdsSheet = false
    
    private var addButton: some View {
        Button(action: {self.addAdsSheet.toggle()}) {
            Image(systemName: "plus")
        }
    }
    
    private func adRowView(ad: Ad) -> some View {
        NavigationLink(destination: AdDetailsView(ad: ad)) {
          VStack(alignment: .leading) {
              HStack {
                  AnimatedImage(url: URL(string: ad.image)!).resizable().frame(width: 65, height: 65).clipShape(Circle())
                   
                  VStack(alignment: .leading) {
                      Text(ad.title)
                          .fontWeight(.bold)
                      Text(ad.district)
                  }
              }
          }
        }
      }
       
      var body: some View {
        NavigationView {
          List {
            ForEach (viewModel.ads) { ad in
              adRowView(ad: ad)
            }
            .onDelete() { indexSet in
              viewModel.removeAds(atOffsets: indexSet)
            }
          }
          .navigationBarTitle("Ads")
          .navigationBarItems(trailing: addButton)
          .onAppear() {
            print("BooksListView appears. Subscribing to data updates.")
            self.viewModel.subscribe()
          
          }
          .sheet(isPresented: self.$addAdsSheet){
              AdEditView()
          }
        }
      }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
