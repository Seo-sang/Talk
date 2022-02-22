//
//  ViewController.swift
//  Talk
//
//  Created by 서상현 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    //몇개를 놓을지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    //어떤 데이터 놓을지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "ChatList", for: indexPath) as! ChatList
        
        return cell
    }
    
    //클릭
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        //let controller = storyboard.instantiateViewController(withIdentifier: "ChatWindowController") as! ChatWindowController
        
        
        
    }
    
    
    //세그웨이 방법
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "ChatDetail" == id {
            if let controller = segue.destination as? ChatWindowController {
                print("hello");
//                if let news = newsData {
//                    //let indexPath = sender as! IndexPath
//                    if let indexPath = TableViewMain.indexPathForSelectedRow {
//                        let row = news[indexPath.row]
//
//                        if let r = row as? Dictionary<String,Any> {
//                            if let desc = r["description"] as? String {
//                                controller.desc = desc
//                            }
//                            if let imageUrl = r["urlToImage"] as? String {
//                                controller.imageUrl = imageUrl
//                            }
//                       }
//                    }
//                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }


}

