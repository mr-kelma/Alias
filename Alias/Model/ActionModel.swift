//
//  ActionModel.swift
//  Alias
//
//  Created by Марк Михайлов on 29.07.2022.
//
    
import Foundation


struct Action {
    let arrayOfAction: [String]
    
    init(actions: [String]) {
       self.arrayOfAction = arrayOfAction
    }

    static let actions = Action(actions: ["Изобрази грусть😞", "Изобрази гнев😠", "Изобрази плач😭", "Изобрази, что ты заболел", "Изобрази игру на барабанах", "Изобрази капитана корабля", "Изобрази обезъяну", "Изображи гаишника", "Изобрази игру на гитаре", "Изобрази начальника"])

    }
     

    


