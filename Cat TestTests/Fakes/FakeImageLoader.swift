//
//  FakeImageLoader.swift
//  Cat TestTests
//
//  Created by Yermis Giovanny Beltrán Cuervo on 13/03/21.
//

import Foundation
import UIKit
@testable import Cat_Test

class FakeImageLoader: ImageLoaderProtocol {
    func loadImage(url: URL, completion: @escaping (UIImage) -> Void) {
        completion(UIImage())
    }
}
