import Foundation

public func solution(_ N : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let binary = String(N, radix: 2)
    if binary.count <= 1 {
        return 0
    }
  
    var currentZeros=0
    var flagForCounting = false
    var maxGap = 0
    for (index, c) in binary.enumerated() {
        if c == "1" && !flagForCounting {
            flagForCounting = true
            continue
        }
        
        if flagForCounting && c == "0" {
            currentZeros += 1
        }
        
        if flagForCounting && c == "1" {
            if currentZeros > maxGap {
                maxGap = currentZeros
            }
            flagForCounting = false
            currentZeros = 0
            
        }
    }
    return maxGap
}
