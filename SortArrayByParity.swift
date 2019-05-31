import Foundation

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = A.count - 1
    var mutableA = A
    while leftIndex < rightIndex {
        if !mutableA[leftIndex].isMultiple(of: 2) && mutableA[rightIndex].isMultiple(of: 2) {
            let temp = mutableA[rightIndex]
            mutableA[rightIndex] = mutableA[leftIndex]
            mutableA[leftIndex] = temp
            leftIndex += 1
            rightIndex -= 1
        } else {
            if mutableA[leftIndex].isMultiple(of: 2) {
                leftIndex += 1
            }
            if !mutableA[rightIndex].isMultiple(of: 2) {
                rightIndex -= 1
            }
        }
    }
    return mutableA
}

sortArrayByParity([1,2,3,4,5])
sortArrayByParity([2,2,3,3,3])
sortArrayByParity([1,1,3,4,6])


