/// Group elements into pairs wich makes the sum
/// of the minimum of the pairs to be as large as possible.
/// Return the sum.

func arrayPairSum(_ nums: [Int]) -> Int {
    return nums.sorted().enumerated().reduce(0, { x, y in
        y.offset % 2 == 0 ? x + y.element : x
    })
}

arrayPairSum([1,2,3,4,5,6])
arrayPairSum([6,5,4,3,2,1])
