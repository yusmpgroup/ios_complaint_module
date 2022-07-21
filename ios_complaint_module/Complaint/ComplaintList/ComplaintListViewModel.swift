//
//  ComplaintListViewModel.swift
//  JoyJet
//
//  Created by Jurayev Nodir on 31.01.2022.

import UIKit

class ComplaintListViewModel{
    private let network = Network.shared
    var reasons: [ComplaintReasonRO] = []
    var publication: PublicationRO?
    var comment: CommentRO?
    var userId: Int?
    
    func getComplaints(completion: @escaping ()->(), onError: @escaping (JJError)->()) {
        _ = network.request(target: JJPublications.complaintReasons,
                            success: { [weak self ](result, json) in
            if self?.userId != nil {
                self?.reasons = (result as? ComplaintReasonsResponse)?.user ?? []
            } else {
                self?.reasons = (result as? ComplaintReasonsResponse)?.publication ?? []
            }
            completion()
        }) { [weak self] error in
            onError(error)
        }
    }
}
