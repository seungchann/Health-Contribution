//
//  ViewController.swift
//  HealthContribution
//
//  Created by 김승찬 on 2022/07/08.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    
    static let healthStore = HKHealthStore()
    static let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!, HKObjectType.quantityType(forIdentifier: .stepCount)!, HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, HKSampleType.quantityType(forIdentifier: .activeEnergyBurned)!])
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

