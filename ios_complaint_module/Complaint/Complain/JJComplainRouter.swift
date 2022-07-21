//
//  JJComplainRouter.swift
//  JoyJet
//
//  Created by Jurayev Nodir on 31.01.2022.
//

import UIKit

enum JJComplainIdentifiers {
    case back
    case next
}

class JJComplainRouter: JJRouter {
    func route(to routeID: JJComplainIdentifiers, from context: UIViewController) {
        switch routeID {
        case .back:
            context.navigationController?.popViewController(animated: true)
            break
        case .next:
            let vc = UIStoryboard(name: "Complain", bundle: nil)
                .instantiateViewController(withIdentifier:  "JJComplainSuccess")
            context.navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
}
