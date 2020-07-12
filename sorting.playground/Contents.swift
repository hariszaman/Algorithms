import Foundation

let numbers = [1 ,2, 4, 5 ,6, 15, 19]

func binarySearch(array: [Int], key: Int) -> Bool {
   let minIndex = 0
    let maxIndex = array.count - 1
    let midValue = array[maxIndex/2]
    if key == midValue {
        return true
    }
    
    else if key < array[minIndex] || key > array[maxIndex] {
        return false
    }

    else if key > midValue {
        // choose the right half
        let rightArray = Array(array[maxIndex/2+1...maxIndex])
        return binarySearch(array: rightArray, key: key)
    } else {
        // choose the left half
        let leftArray = Array(array[minIndex...maxIndex/2 - 1])
        return binarySearch(array: leftArray, key: key)
    }
    return false
}
let res = binarySearch(array: numbers, key: 20)
print(res)

let numbersToSort = [4,2,1,45,3,21]

func mergeSort(array:[Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let minIndex = 0
    let midIndex = array.count / 2
    
    let leftArray = Array(array[minIndex..<midIndex])
    let rightArray = Array(array[midIndex..<array.count])
    print("left array: \(leftArray)")
    print("right array: \(rightArray)")
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var left = left
    var right = right
    print("left in merge: \(left)")
    print("right in merge: \(right)")
    var mergedArray: [Int] = []
    while left.count > 0 && right.count > 0 {
        if left.first! > right.first! {
            
            mergedArray.append(right.removeFirst())
            
        }
        else if left.first! < right.first! {
              
            mergedArray.append(left.removeFirst())
           
        }
    }
    print("merged array: \(mergedArray + left + right)")
    return mergedArray + left + right
}

mergeSort(array: numbersToSort)
