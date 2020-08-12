//
//  ViewController.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Divya Basappa on 7/31/20.

import UIKit

protocol TableViewCellDelegate: class {
    func reloadCells()
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    fileprivate let viewModel = ProfileViewModel()
    let dataSource = DataSource()
    let loggedOutStateDataSource = LoadingStateDataSource()

    var isLoading = false {
        didSet {
            setDataSource()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = false
        setupTableView()
        viewModel.delegate = self
        viewModel.setUpDataSource()
        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.tableView?.beginUpdates()
            self?.tableView?.reloadSections([section], with: .fade)
            self?.tableView?.endUpdates()
        }
        dataSource.sections = viewModel.sections
        loggedOutStateDataSource.sections = viewModel.loggedOutSections
        setDataSource()
        tableView?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            self.isLoading = true
        }
    }
    
    func setDataSource() {
        if isLoading {
            tableView?.dataSource = dataSource
        } else {
            tableView?.dataSource = loggedOutStateDataSource
        }
        tableView?.reloadData()
    }
    
    func setupTableView() {
        tableView?.estimatedRowHeight = 150
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedSectionHeaderHeight = 70
        tableView?.separatorStyle = .none
        
        tableView?.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.identifier)
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView?.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.identifier)
        tableView?.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.identifier)
        tableView?.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.identifier)
        tableView?.register(HeaderView.nib, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView?.register(LoadingStateTableViewCell.nib, forCellReuseIdentifier: LoadingStateTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView {
            let item = dataSource.sections[section]
            
            headerView.item = item
            headerView.section = section
            headerView.delegate = self
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: HeaderViewDelegate {
    func toggleSection(header: HeaderView, section: Int) {
        
        let currentDataSource = (isLoading ? dataSource : loggedOutStateDataSource) as? DataSourceProtocol
        guard var item = currentDataSource?.sections[section] else { return }
        if item.isCollapsible {

            // Toggle collapse
            let collapsed = !item.isCollapsed
            item.isCollapsed = collapsed
            header.setCollapsed(collapsed: collapsed)

            // Adjust the number of the rows inside the section
            viewModel.reloadSections?(section)
        }
    }
}

protocol DataSourceProtocol {
    var sections: [TableViewSectionProtocol] { get set }
}

class LoadingStateDataSource: NSObject, UITableViewDataSource, DataSourceProtocol {
    var sections: [TableViewSectionProtocol] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = sections[section]
        if item.isCollapsed {
            return 0
        } else {
            return item.rowCount
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        return model.cellForTableView(tableView: tableView, atIndexPath: indexPath) 
    }
}

class DataSource: NSObject, UITableViewDataSource, DataSourceProtocol  {
    var sections: [TableViewSectionProtocol] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = sections[section]
        guard item.isCollapsible else {
            return item.rowCount
        }
        
        if item.isCollapsed {
            return 0
        } else {
            return item.rowCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row] as? TableViewCellModelProtocol
        return model?.cellForTableView(tableView: tableView, atIndexPath: indexPath) ?? UITableViewCell()
    }

}

extension ViewController: TableViewCellDelegate {

    func reloadCells() {
        tableView?.beginUpdates()
        tableView?.endUpdates()
    }

}
