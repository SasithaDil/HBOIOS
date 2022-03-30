//
//  AdViewModel.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import Foundation
import Combine
import FirebaseFirestore

class AdViewModel: ObservableObject{
    
    @Published var ad: Ad
    @Published var modified = false
    
    private var cancellabels = Set<AnyCancellable>()
    init(ad: Ad = Ad(title: "", seller: "", image: "", price: 0, district: "")){
        self.ad = ad
        
        self.$ad
            .dropFirst()
            .sink{ [weak self] ad in
                self?.modified = true
            }
            .store(in: &self.cancellabels)
    }
    
    private var db = Firestore.firestore()
    
    private func addAdvertiestment(_ ad: Ad){
        do{
            let _ = try db.collection("Ads").addDocument(from: ad)
        }
        catch{
            print(error)
        }
    }
    private func updateAd(_ ad : Ad){
        if let documentId = ad.id{
            do{
                try db.collection("Ads").document(documentId).setData(from: ad)
            }
            catch{
                print(error)
            }
        }
        
    }
    private func updateOrAddAd(){
        if let _ = ad.id{
            self.updateAd(self.ad)
        }
        else{
            addAdvertiestment(ad)
        }
        
    }
    
    private func removeAd(){
        if let documentId = ad.id{
            db.collection("Ads").document(documentId).delete{ error in
                if let error = error{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    
    func handleDoneTapped(){
        self.updateOrAddAd()
    }
    func handleDeleteTapped(){
        self.removeAd()
    }
}
