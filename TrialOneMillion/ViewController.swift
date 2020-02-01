//
//  ViewController.swift
//  TrialOneMillion
//
//  Created by Timm, Adria M on 1/30/20.
//  Copyright © 2020 Timm, Adria M. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    var data: [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
                    let path: String = "/Users/fq5170kj/Desktop/xcodeApps/TrialOneMillion/TrialOneMillion/textFile.txt"
                    let file = try String(contentsOfFile: path)
                    let text: [String] = file.components(separatedBy: "\n")
                    
                    for line in text {
                            print(line)
                            if line != "" {
                                
                            let sections: [String] = line.components(separatedBy: " ")
                            
                                let itemOne: String = sections[0]
                                let itemTwo: String = sections[1]
                                let itemThree: String = sections[2]
                                let itemFour: String = sections[3]
                                let itemFive: String = sections[4]
                                
                                data.append(["isbn" : itemOne, "title" : itemTwo, "author" : itemThree, "quantity" : itemFour, "price" : itemFive])
                            
                            //data = [[itemOne : itemTwo]]
                        }
                    }
                } catch let error {
                    Swift.print("Fatal Error: \(error.localizedDescription)")
            }
        
//       data = [
//                [
//                    "Name" : "Andrew",
//                    "Number"  : "1"
//                ],
//                [
//                    "Name" : "Gabriel",
//                    "Number"  : "2"
//                ],
//                [
//                    "Name" : "Olga",
//                    "Number"  : "3"
//            ]
//        ]
//
        //self.tableView.reloadData()
       
        
    }
    
    
    func writeToFile(i: String, t: String, a: String, q: String, p: String) {
        let monkeyLine = "\(i) \(t) \(a) \(q) \(p)"

               if let fileUpdater = try? FileHandle(forWritingAtPath: "/Users/fq5170kj/Desktop/xcodeApps/TrialOneMillion/TrialOneMillion/textFile.txt") {

                    // function which when called will cause all updates to start from end of the file
                    fileUpdater.seekToEndOfFile()

                   // which lets the caller move editing to any position within the file by supplying an offset
                  fileUpdater.write(monkeyLine.data(using: .utf8)!)

                   //Once we convert our new content to data and write it, we close the file and that’s it!
                  fileUpdater.closeFile()
               }
    }
    
    
    @IBAction func rereadFile(_ sender: Any) {
        data = []
        do {
                          let path: String = "/Users/fq5170kj/Desktop/xcodeApps/TrialOneMillion/TrialOneMillion/textFile.txt"
                          let file = try String(contentsOfFile: path)
                          let text: [String] = file.components(separatedBy: "\n")
                          
                          for line in text {
                                  print(line)
                                  if line != "" {
                                      
                                  let sections: [String] = line.components(separatedBy: " ")
                                  
                                      let itemOne: String = sections[0]
                                      let itemTwo: String = sections[1]
                                      let itemThree: String = sections[2]
                                      let itemFour: String = sections[3]
                                      let itemFive: String = sections[4]
                                      
                                      data.append(["isbn" : itemOne, "title" : itemTwo, "author" : itemThree, "quantity" : itemFour, "price" : itemFive])
                                  
                                  //data = [[itemOne : itemTwo]]
                              }
                          }
                      } catch let error {
                          Swift.print("Fatal Error: \(error.localizedDescription)")
                  }
        
        tableView.reloadData()
    }
    
   

  
    
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    


}


extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    
  func numberOfRows(in tableView: NSTableView) -> Int {
    print(data.count)
    return (data.count)

  }
   

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let person = data[row]

    guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as?  NSTableCellView else { return nil }
    cell.textField!.stringValue = person[tableColumn!.identifier.rawValue]!
    
    return cell
  }
}
