//
//  PresentableError.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Foundation
protocol PresentableError: Error {
    var message: String { get }
}
