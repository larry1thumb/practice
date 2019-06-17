/// Given an array of integers with values between 1 and array.count,
/// elements appear either once or twice.
/// Find duplicates.

func findDuplicates(_ nums: [Int]) -> [Int] {
    var mutableNums = nums
    var duplicates: [Int] = []
    for num in mutableNums {
        if mutableNums[num-1] < 0 {
            duplicates.append(num)
        }
        mutableNums[num-1] *= -1
    }
    return duplicates
}

findDuplicates([4,3,2,7,8,2,3,1])
