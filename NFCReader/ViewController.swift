//
//  ViewController.swift
//  NFCReader
//
//  Created by JohnConnor on 2020/5/21.
//  Copyright © 2020 JohnConnor. All rights reserved.
//

import UIKit
import CoreNFC
import PDFKit
class ViewController: UIViewController {
    lazy var tebleView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 44, width: view.bounds.width, height: view.bounds.height - 44), style: UITableView.Style.plain)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tebleView)
//        String(<#T##value: BinaryInteger##BinaryInteger#>)
        let binary = String(01010010)
        let str = String(bytes: [0x56,87], encoding: .ascii)
        print(str)
        print(binary)
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "SystemCell")
        if cell == nil  {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SystemCell")
        }
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
        case 1:
            self.navigationController?.pushViewController(TestPDFVC(), animated: true)
        default:
            print("0")
        }
    }
}
