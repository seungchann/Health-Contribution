//
//  HomeViewController.swift
//  HealthContribution
//
//  Created by 김승찬 on 2022/07/08.
//

import UIKit
import HealthKit

class HomeViewController: UIViewController {
    
    let healthStore = HKHealthStore()
    
    let objectTypes: Set<HKObjectType> = [
        HKObjectType.activitySummaryType()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        // Do any additional setup after loading the view.
    }

    func configure() {
        if HKHealthStore.isHealthDataAvailable() {
            self.requestAuthorization()
        } else {
            // HealthKit을 사용할 수 없을 경우
        }
    }
    
    func requestAuthorization() {
        self.healthStore.requestAuthorization(toShare: nil, read: objectTypes) { (success, error) in
            print("")
            print("===============================")
            print("[HomeViewController > requestAuthorization() : 활동 에너지 권한 요청 실시]")
            print("===============================")
            print("")
            if error != nil {
                print(error.debugDescription)
            } else {
                if success {
                    self.test()
                } else {
                    print("권한이 아직 없어요.")
                }
            }
        }
    }

    func test() {
        let calander = NSCalendar.current
        let endDate = Date()
        
        guard let startDate = calander.date(byAdding: .month, value: -1, to: endDate) else {
            fatalError("*** Unable to create the start date ***")
        }
        
        let units: Set<Calendar.Component> = [.day, .month, .year, .era]
        
        var startDateComponents = calander.dateComponents(units, from: startDate)
        startDateComponents.calendar = calander
        
        var endDateComponents = calander.dateComponents(units, from: endDate)
        endDateComponents.calendar = calander
        
        let summariesWithinRange = HKQuery.predicate(forActivitySummariesBetweenStart: startDateComponents, end: endDateComponents)
        
        let query = HKActivitySummaryQuery(predicate: summariesWithinRange) { (query, summariesOrNil, errorOrNil) -> Void in
            guard let summaries = summariesOrNil else {
                print("HERE")
                return
            }
            
            for summary in summaries {
                continue
            }
            
            DispatchQueue.main.async {
                print(summaries)
            }
        }
        
        healthStore.execute(query)
    }
}
