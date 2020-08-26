//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 15.08.2020.
//

import Foundation

public class Bootstrap<T>{
    
    private var instanceList: [T]

    /**
    A constructor of Bootstrap class which takes a sample an array of instances and a seed number, then creates a
    bootstrap sample using this seed as random number.

    - Parameters:
        - instanceList : Original sample
        - seed : Random number to create boostrap sample
    */
    init(instanceList: [T], seed: Int){
        let N : Int = instanceList.count
        self.instanceList = []
        for _ in 0..<N{
            self.instanceList.append(instanceList[Int.random(in: 0..<N - 1)])
        }
    }

    /**
    getSample returns the produced bootstrap sample.

    - Returns: Produced bootstrap sample
    */
    func getSample() -> [T]{
        return self.instanceList
    }

}
