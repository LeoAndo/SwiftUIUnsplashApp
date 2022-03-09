//
//  PresentableError.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Foundation
protocol PresentableError: Error {
    /// UIAlertController#title に相当
    var title: String? { get }
    /// UIAlertController#message に相当
    var message: String { get }
}
