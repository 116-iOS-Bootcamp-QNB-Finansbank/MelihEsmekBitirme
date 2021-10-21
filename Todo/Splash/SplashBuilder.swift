//
//  SplashBuilder.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 21.10.2021.
//

import Foundation
import UIKit

class SplashBuilder {
    static func build() -> SplashScreenViewController {
        let storyboard = UIStoryboard(name: "TodoList", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "SplashScreenViewController") as! SplashScreenViewController

        return view
    }
}
