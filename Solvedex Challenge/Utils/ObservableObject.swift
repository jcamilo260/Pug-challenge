//
//  ObservableObject.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
final class ObservableObject<T>{
    
    var value: T{
        didSet{
            self.listener?(value)
        }
    }
    
    init(_ value: T){
        self.value = value
    }
    
    private var listener: ((T)->Void)?
    
    func binder(_ listener: @escaping (T)->Void)->Void{
        listener(value)
        self.listener = listener
    }
    
}
