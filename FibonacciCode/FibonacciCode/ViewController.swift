//
//  ViewController.swift
//  FibonacciCode
//
//  Created by Flatiron School on 12/7/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fiboTableView: UITableView!
    var fiboArray :[UIntMax] = [0, 1]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fiboTableView.delegate = self
        self.fiboTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.addNextFiboNumber(array: [0, 1])
    }
        // Do any additional setup after loading the view, typically from a nib.
        //print(calculateFiboNumber(nth: 10))

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // f(n) = f(n-1) + f(n-2) 
    
    func addNextFiboNumber(array: [UIntMax]){
        var counter = 0
        while counter < 90 {
        let fiboNumber = calculateFiboNumber()
        print(fiboNumber)
        self.fiboArray.append(fiboNumber)
        self.fiboTableView.reloadData()
        counter+=1
        }
    }
    
    func calculateFiboNumber() -> UIntMax {
            return self.fiboArray[self.fiboArray.count-1] + self.fiboArray[self.fiboArray.count-2]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of Rows array count \(self.fiboArray.count)")
        return self.fiboArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        cell.textLabel?.text = "\(self.fiboArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.fiboArray.count-1 {
            
        }
    }
}

