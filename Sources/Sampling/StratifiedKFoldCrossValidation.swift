//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 15.08.2020.
//

import Foundation

public class StratifiedKFoldCrossValidation<T>: CrossValidation<T>{
    
    private var instanceLists: [[T]]
    private var N: [Int]

    /**
    A constructor of StratifiedKFoldCrossValidation class which takes as set of class samples as an array of array of
    instances, a K (K in K-fold cross-validation) and a seed number, then shuffles each class sample using the
    seed number.

    - Parameters:
        - instanceLists : Original class samples. Each element of the this array is a sample only from one class.
        - K : K in K-fold cross-validation
        - seed : Random number to create K-fold sample(s)
    */
    init(instanceLists: [[T]], K: Int, seed: Int){
        self.instanceLists = instanceLists
        self.N = []
        for i in 0..<instanceLists.count{
            self.N.append(instanceLists[i].count)
        }
        super.init()
        self.K = K
    }

    /**
    getTrainFold returns the k'th train fold in K-fold stratified cross-validation.

    - Parameter k : index for the k'th train fold of the K-fold stratified cross-validation

    - Returns: Produced training sample
    */
    func getTrainFold(k: Int) -> [T]{
        var trainFold : [T] = []
        for i in 0..<self.N.count{
            for j in 0..<k * self.N[i] / self.K{
                trainFold.append(self.instanceLists[i][j])
            }
            for j in (k + 1) * self.N[i] / self.K..<self.N[i]{
                trainFold.append(self.instanceLists[i][j])
            }
        }
        return trainFold
    }

    /**
    getTestFold returns the k'th test fold in K-fold stratified cross-validation.

    - Parameter k : index for the k'th test fold of the K-fold stratified cross-validation

    - Returns: Produced testing sample
    */
    func getTestFold(k: Int) -> [T]{
        var testFold : [T] = []
        for i in 0..<self.N.count{
            for j in k * self.N[i] / self.K..<(k + 1) * self.N[i] / self.K{
                testFold.append(self.instanceLists[i][j])
            }
        }
        return testFold
    }
}
