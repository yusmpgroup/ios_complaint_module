//
//  JJComplainViewModel.swift
//  JoyJet
//
//  Created by Jurayev Nodir on 31.01.2022.

import UIKit

class JJComplainViewModel{
    private let network = Network.shared
 
    var publication: PublicationRO?
    var comment: CommentRO?
    var reason: ComplaintReasonRO?
    var userId: Int?
    
    func sendComplaint(_ commentString: String, completion: @escaping ()->(), onError: @escaping (JJError)->()) {
        if let userId = userId {
            let target = JJProfile.complaintUser(id: userId, message: commentString, type: reason?.id ?? "")
            _ = network.request(target: target,
                                success: { [weak self ](result, json) in
                completion()
            }) { [weak self] error in
                onError(error)
            }
        } else {
            let target: JJPublications
            if let comment = comment {
                target = JJPublications.commentComplain(comment.id, reason: reason?.id ?? "", comment: commentString)
            } else {
                target = JJPublications.publicationComplain(publication?.id ?? 0, reason: reason?.id ?? "", comment: commentString)
            }
            _ = network.request(target: target,
                                success: { [weak self ](result, json) in
                completion()
            }) { [weak self] error in
                onError(error)
            }
        }
    }
}
