//
//  InternetConnectionError.swift
//  Movies Reviews
//
//  Created by Ahmad Kadour on 15/02/2022.
//

import Foundation
import SwiftUI

enum ConnectionError: Error {
    case NoInternet
    case ServerIssue
    case RequestTimedOut
}
