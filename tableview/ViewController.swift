//
//  ViewController.swift
//  tableview
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var textfiled: UITextField!
    @IBOutlet weak var chose: UILabel!
    @IBOutlet weak var tableview: UITableView!
    var stuArry = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArry.append("liguiyang")
        stuArry.append("ligu")
        stuArry.append("liguig")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell") as!
        studentTableViewCell
        let stu = stuArry[indexPath.row]
        cell.name.text = stu
        cell.name.sizeToFit()
        return cell
    }
    @IBAction func addclicked(_ sender: Any) {
        if let name = textfiled.text{
            stuArry.append(name)
            tableview.reloadData()
        }
        textfiled.resignFirstResponder()
    }
    @IBAction func editclicked(_ sender: Any) {
        if let row = tableview.indexPathForSelectedRow?.row{
            if let name = textfiled.text{
            stuArry[row] = name
            tableview.reloadData()
            }
        }
    }
    
    @IBAction func deleteclicked(_ sender: Any) {
        tableview.isEditing = !tableview.isEditing
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chose.text = "you choose \(stuArry[indexPath.row])"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            stuArry.remove(at: indexPath.row)
//            tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = stuArry.remove(at: sourceIndexPath.row)
        stuArry.insert(source, at: destinationIndexPath.row)
    }
}

