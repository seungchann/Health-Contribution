//
//  HomeInterfaceController.swift
//  HealthContribution WatchKit Extension
//
//  Created by 김승찬 on 2022/07/06.
//

import WatchKit
import Foundation

class HomeInterfaceController: WKInterfaceController {
    
    @IBOutlet var tileTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        tileTable.setNumberOfRows(7, withRowType: "cell")
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
