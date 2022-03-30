//
//  AdDetailsView.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import SwiftUI
import SDWebImageSwiftUI

struct AdDetailsView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var editAdSheet = false
    
    var ad: Ad
    
    private func editButton(action: @escaping () -> Void) -> some View{
        Button(action: {action()}){
            Text("Edit")
        }
    }
    
    var body: some View {
        Form{
            Section(header: Text("Ad")){
                Text(ad.title)
                Text("\(ad.price) LKR")
            }
            Section(header: Text("Seller")){
                Text(ad.title)
            }
            Section(header: Text("Photo")) {
                AnimatedImage(url: URL(string: ad.image)!).resizable().frame(width: 300, height: 300)
            }
        }
        .navigationBarTitle(ad.title)
        .navigationBarItems( trailing: editButton {
            self.editAdSheet.toggle()
        })
        .onAppear(){
            print("AdDetailsView.onAppear() for \(self.ad.title)")
        }
        .onDisappear(){
            print("AdDetailsView.onDisappear()")
        }
        .sheet(isPresented: self.$editAdSheet){
            AdEditView(viewModel: AdViewModel(ad: ad), mode: .edit){ result in
            if case .success(let action) = result, action == .delete{
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        }
    }
}

struct BookDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    let ad = Ad(title: "testa", seller: "testinga", image: "photo1", price: 00, district: "Jafna")
    return
      NavigationView {
        AdDetailsView(ad: ad)
      }
  }
}
