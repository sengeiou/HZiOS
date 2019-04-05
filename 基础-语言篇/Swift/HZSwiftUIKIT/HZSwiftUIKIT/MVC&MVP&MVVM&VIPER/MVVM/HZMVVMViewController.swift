//
//  HZMVVMViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2019/3/13.
//  Copyright © 2019年 HZ. All rights reserved.
//

import UIKit

struct Person {
    var firstName:String?
    var lastName:String?
}

protocol GreetingViewModelProtocol {
    var greeting:String?{get}
    var greetingDidChange:((GreetingViewModelProtocol)->())?{get set}
    init(person:Person)
    func showGreeting()
}


class GreetingViewModel: NSObject,GreetingViewModelProtocol {
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    var person:Person
    required init(person: Person) {
        self.person = person
    }
    
    var greeting:String? {
        willSet(value){
            greetingDidChange?(self)
        }
    }
    
    
    @objc public func showGreeting(){
        self.greeting = "hello" + person.firstName!  + person.lastName!
    }
}

class HZMVVMViewController: UIViewController {
    var greetingLabel:UILabel?
    var greetingButton:UIButton?
    var greetingViewModel:GreetingViewModelProtocol!{
        didSet{
            self.greetingViewModel.greetingDidChange = {
                [unowned self] greetingViewModel in
                self.greetingLabel?.text = greetingViewModel.greeting
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.greetingButton?.addTarget(self.greetingViewModel, action: #selector(GreetingViewModel.showGreeting), for: UIControlEvents.touchUpInside)
        
        let model = Person(firstName: "David", lastName: "Blaine")
        let viewModel = GreetingViewModel(person: model)
        greetingViewModel = viewModel
    }
    
    
}
