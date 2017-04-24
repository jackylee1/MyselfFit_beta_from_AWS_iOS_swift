//
//  CloudLogicAPI.swift
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

import Foundation
import AWSAPIGateway

// Represents the configuration for a single Cloud Logic API endpoint in Amazon API Gateway.
class CloudLogicAPI {
    
    // Cloud Logic API display name
    var displayName: String
    
    // Cloud Logic API description
    var apiDescription: String?
    
    // List of paths configured for the Cloud Logic API
    var paths: [String]
    
    // The api endpoint for configured Cloud Logic API
    var endPoint: String
    
    // The api invocation client from the API Gateway generated SDK 
    var apiClient: AWSAPIGatewayClient?
 
    /**
     Initializer for the CloudLogicAPI object
     
     - parameter displayName:    Cloud Logic API display name
     - parameter apiDescription: Cloud Logic API description
     - parameter paths:          List of paths configured for the Cloud Logic API
     - parameter endPoint:       The api endpoint for configured Cloud Logic API
     
     - returns: CloudLogicAPI object
     */
    init(displayName: String, apiDescription: String?, paths: [String], endPoint: String, apiClient: AWSAPIGatewayClient) {
        self.displayName = displayName
        self.apiDescription = apiDescription
        self.paths = paths
        self.endPoint = endPoint
        self.apiClient = apiClient
    }
}
