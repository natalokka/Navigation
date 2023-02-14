//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Наталия Куракова on 11.02.2023.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    var table: UITableView = {
        var table = UITableView(frame: .zero)
        table.backgroundColor = UIColor.red
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        table.sectionHeaderTopPadding = 0
        addSubview(table)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        addConstraintForPost()
        super.updateConstraints()
    }
    
    private func addConstraintForPost() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

