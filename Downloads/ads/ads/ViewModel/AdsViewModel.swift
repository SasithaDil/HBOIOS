//
//  AdsViewModel.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import Foundation
import Combine
import FirebaseFirestore

class AdsViewModel: ObservableObject{
    @Published var ads = [Ad]()
    
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    deinit{
        unsubscribe()
    }
    
    func unsubscribe(){
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    func subscribe(){
        if listenerRegistration ==  nil {
            listenerRegistration = db.collection("Ads").addSnapshotListener{(querySnapshot, error) in
                guard let documents = querySnapshot?.documents else{
                    print("No documents")
                    return
                }
                self.ads = documents.compactMap{ querySnapshot in
                    try? querySnapshot.data(as: Ad.self)
                }
            }
        }
    }
    
    func removeAds(atOffsets indexSet: IndexSet){
        let ads = indexSet.lazy.map{ self.ads[$0]}
        ads.forEach{ ad in
            if let documentId = ad.id{
                db.collection("Ads").document(documentId).delete(){ error in
                    if let error = error{
                        print("Unable to remove document: \(error.localizedDescription)")
                    }
                    
                }
            }
        }
    }
    
    
}
