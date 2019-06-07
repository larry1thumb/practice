func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var differenceDict: [Int: Int] = [:]
    for (index, num) in nums.enumerated() {
        if let matchingIndex = differenceDict[num], index != matchingIndex {
            return [matchingIndex, index]
        }
        differenceDict[target - num] = index
    }
    return []
}

func twoSumSorting(_ nums: [Int], _ target: Int) -> [Int] {
    var i = 0
    var j = nums.count - 1
    let sortedNums = nums.sorted()
    while i < j {
        if sortedNums[i] + sortedNums[j] > target {
            j -= 1
        } else if sortedNums[i] + sortedNums[j] < target {
            i += 1
        } else {
            guard
                let index = nums.firstIndex(of: sortedNums[i]),
                let index2 = nums.lastIndex(of: sortedNums[j])
                else { return [] }
            return [index, index2]
        }
    }
    return []
}

twoSum([2, 7, 11, 15], 9)
twoSum([3,3], 6)
twoSumSorting([2, 7, 11, 15], 9)
twoSumSorting([3,3], 6)
