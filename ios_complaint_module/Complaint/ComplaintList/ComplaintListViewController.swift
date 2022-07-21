//
//  ComplaintListViewController.swift
//  JoyJet
//
//  Created by Jurayev Nodir on 31.01.2022.
//

import UIKit

class ComplaintListViewController: BaseViewController {
    let router = ComplaintListRouter()
    let viewModel = ComplaintListViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hud.show(in: view)
        viewModel.getComplaints { [weak self] in
            self?.tableView.reloadData()
            self?.hud.dismiss(animated: true)
        } onError: { [weak self] error in
            self?.showError(error: error)
            self?.hud.dismiss(animated: true)
        }
    }
    
    override func localizedAll() {
        titleLabel.text = "Complaint.report".localized
    }
    
    // MARK: - actions
    @IBAction func onBack(_ sender: Any) {
        router.route(to: .back, from: self)
    }
}

extension ComplaintListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JJComplaintReasonCell") as! JJComplaintReasonCell
        cell.reasonLabel.text = viewModel.reasons[indexPath.row].name.localized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.route(to: .reason(viewModel.reasons[indexPath.row],
                                 publication: viewModel.publication,
                                 comment: viewModel.comment,
                                 userId: viewModel.userId), from: self)
    }
}

