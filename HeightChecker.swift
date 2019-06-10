func heightChecker(_ heights: [Int]) -> Int {
    var countDictionary: [Int: Int] = [:]
    var numberOfMisplaced = 0
    heights.forEach {
        countDictionary[$0] = (countDictionary[$0] ?? 0) + 1
    }
    for index in 0..<101 {
        countDictionary[index] = (countDictionary[index] ?? 0) + (countDictionary[index - 1] ?? 0)
    }
    for (index, height) in heights.enumerated() {
        guard
            let bottomLimit = countDictionary[heights[index] - 1],
            let upperLimit = countDictionary[height]
            else { return 0 }
        if index >= upperLimit || index < bottomLimit {
            numberOfMisplaced += 1
        }
    }
    return numberOfMisplaced
}

func heightCheckerWithSort(_ heights: [Int]) -> Int {
    let sortedHeights = heights.sorted()
    var numberOfMisplaced = 0
    zip(sortedHeights, heights).forEach {
        if $0 != $1 { numberOfMisplaced += 1 }
    }
    return numberOfMisplaced
}

heightChecker([1,1,4,2,1,3])
heightChecker([2,1,2,1,1,2,2,1])
heightCheckerWithSort([1,1,4,2,1,3])
heightCheckerWithSort([2,1,2,1,1,2,2,1])
