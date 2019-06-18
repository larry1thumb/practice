func productExceptSelf(_ nums: [Int]) -> [Int] {
    var products = Array.init(repeating: 0, count: nums.count)
    products[0] = 1
    for i in 1..<nums.count {
        products[i] = products[i-1] * nums[i-1]
    }
    var multiplier = 1
    for i in 0..<nums.count {
        products[nums.count - 1 - i] *= multiplier
        multiplier *= nums[nums.count - 1 - i]
    }
    return products
}

productExceptSelf([1,2,3,4])
