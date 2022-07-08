//
//  HomeInterfaceController.swift
//  HealthContribution WatchKit Extension
//
//  Created by 김승찬 on 2022/07/08.
//

import WatchKit
import Foundation

class HomeInterfaceController: WKInterfaceController {
    
    @IBOutlet var tileTable: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        tileTable.setNumberOfRows(5, withRowType: "cell")
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
