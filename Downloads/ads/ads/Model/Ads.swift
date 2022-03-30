//
//  Ads.swift
//  ads
//
//  Created by Sasitha Dilshan on 2022-03-29.
//

import Foundation
import FirebaseFirestoreSwift

struct Ads: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var seller: String
    var image: String
    var price: String
  
    
    enum CodingKeys: String, CodingKey{
        
    case title
    case seller
    case image
    case price
    }
}
