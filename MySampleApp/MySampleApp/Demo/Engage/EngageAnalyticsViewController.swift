//
//  EngageAnalyticsViewController.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.13
//

import UIKit
import Foundation
import AWSPinpoint
class EngageAnalyticsViewController: UIViewController {
  
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        @IBAction func clickedCustomEvent(_ sender: AnyObject) {
            guard let pinpointAnalyticsClient = AWSMobileClient.sharedInstance.pinpoint?.analyticsClient else {return}
            let event = pinpointAnalyticsClient.createEvent(withEventType: "DemoCustomEvent")
            event.addAttribute("DemoAttributeValue1", forKey: "DemoAttribute1")
            event.addAttribute("DemoAttributeValue2", forKey: "DemoAttribute2")
            event.addMetric(NSNumber(value: Int(arc4random() % 65535)), forKey: "DemoMetric")
            pinpointAnalyticsClient.record(event)
            pinpointAnalyticsClient.submitEvents()
            
            let alert = UIAlertController(title: NSLocalizedString("EVENT SUBMITTED", comment: "Title bar for alert dialog about an event."),
                                          message:EngageAnalyticsViewController.prettyPrintEvent(event),
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Button on alert dialog."), style: .default, handler: nil))
            self.present(alert, animated: true, completion:nil)
        }

        @IBAction func clickedMonetizationEvent(_ sender: AnyObject) {
            guard let pinpointAnalyticsClient = AWSMobileClient.sharedInstance.pinpoint?.analyticsClient else {return}
            let event = pinpointAnalyticsClient.createVirtualMonetizationEvent(withProductId: "DEMO_PRODUCT_ID", withItemPrice: 1.00, withQuantity: 1, withCurrency: "en_US")
            pinpointAnalyticsClient.record(event)
            pinpointAnalyticsClient.submitEvents()
            let alert = UIAlertController(title: NSLocalizedString("EVENT SUBMITTED", comment: "Title bar for alert dialog about an event."),
                                          message:EngageAnalyticsViewController.prettyPrintEvent(event),
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Button on alert dialog."), style: .default, handler: nil))
            self.present(alert, animated: true, completion:nil)
        }

        // MARK: - Utility Methods
        
        class func prettyPrintEvent(_ event: AWSPinpointEvent) -> String {
            return "EVENT TYPE : \(event.eventType)\nATTRIBUTES : \(event.allAttributes())\nMETRICS : \(event.allMetrics())"
        }
}
