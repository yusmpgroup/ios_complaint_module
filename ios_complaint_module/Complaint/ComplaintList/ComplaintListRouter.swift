//
//  ComplaintListRouter.swift
//  JoyJet
//
//  Created by Jurayev Nodir on 31.01.2022.
//

import UIKit

enum ComplaintListIdentifiers {
    case back
    case reason(_ reason: ComplaintReasonRO, publication: PublicationRO?, comment: CommentRO?, userId: Int?)
}

class ComplaintListRouter: JJRouter {
    func route(to routeID: ComplaintListIdentifiers, from context: UIViewController) {
        switch routeID {
        case .back:
            context.navigationController?.popViewController(animated: true)
            break
        case .reason(let reason, let publication, let comment, let userId):
            if let vc = UIStoryboard(name: "Complain", bundle: nil).instantiateInitialViewController() as? JJComplainViewController {
                vc.viewModel.publication = publication
                vc.viewModel.comment = comment
                vc.viewModel.reason = reason
                vc.viewModel.userId = userId
                context.navigationController?.pushViewController(vc, animated: true)
            }
            break
        }
    }
}
