//
//  AdEditView.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import SwiftUI

enum Mode{
    case new
    case edit
}

enum Action {
    case delete
    case done
    case cancel
}

struct AdEditView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    
    @ObservedObject var viewModel = AdViewModel()
    
    var mode: Mode = .new
    var completionHandler: ((Result<Action,Error>) -> Void)?
    
    var cancelButton: some View{
        Button(action: {self.handleCancelTapped()}){
            Text("Cancel")
        }
    }
    
    var saveButton: some View{
        Button(action: {self.handleDoneTapped()}){
            Text(mode == .new ? "Done" : "Save")
        }
        .disabled(!viewModel.modified)
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Advertiestment")){
                    TextField("Title", text: $viewModel.ad.title)
                    TextField("Price", value: $viewModel.ad.price, formatter: NumberFormatter())
                }
                Section(header: Text("Seller")){
                    TextField("Seller", text: $viewModel.ad.seller)
                }
                Section(header: Text("Seller")){
                    TextField("Photo", text: $viewModel.ad.image)
                }
                Section(header: Text("District")){
                    TextField("district", text: $viewModel.ad.district)
                }
                
                if mode == .edit{
                    Section{
                        Button("Delete advertiestment"){self.presentActionSheet.toggle()}
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle(mode == .new ? "New advertiestment" : viewModel.ad.title)
            .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
            .navigationBarItems(leading: cancelButton, trailing: saveButton
            )
            .actionSheet(isPresented: $presentActionSheet){
                ActionSheet(title: Text("Are you sure.?"),
                            buttons: [
                                .destructive(Text("Delete"),
                                             action:{self.handleDeleteTapped()}),
                                .cancel()
                            ])
            }
        }
    }
    func handleCancelTapped(){
        self.dismiss() 
    }
    func handleDoneTapped(){
        self.viewModel.handleDoneTapped()
        self.dismiss()
    }
    func handleDeleteTapped(){
        viewModel.handleDeleteTapped()
        self.dismiss()
        self.completionHandler?(.success(.delete))
    }
    func dismiss(){
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AdEditView_Previews: PreviewProvider {
    static var previews: some View {
        AdEditView()
    }
}
