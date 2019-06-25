func sortArrayByParityII(_ A: [Int]) -> [Int] {
    var sortedArray = A
    var i = 0
    var j = 1
    while i < sortedArray.count && j < sortedArray.count {
        while i < sortedArray.count && sortedArray[i] % 2 == 0 {
            i += 2
        }
        while j < sortedArray.count && sortedArray[j] % 2 != 0 {
            j += 2
        }
        if i < sortedArray.count && j < sortedArray.count {
            sortedArray.swapAt(i, j)
        }
    }
    return sortedArray
}

func sortArrayByParityIII(_ A: [Int]) -> [Int] {
    var sortedArray: [Int] = Array.init(repeating: 0, count: A.count)
    var evens = 0
    var odds = 1
    A.forEach {
        if $0 % 2 == 0 {
            sortedArray[evens] = $0
            evens += 2
        } else {
            sortedArray[odds] = $0
            odds += 2
        }
    }
    return sortedArray
}

sortArrayByParityII([1,2,3,4,5,6,7,8])
sortArrayByParityIII([1,2,3,4,5,6,7,8])

