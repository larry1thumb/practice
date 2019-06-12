/// Given an array representing an elevation map, compute
/// how much water is able to be trapped.

func trap(_ height: [Int]) -> Int {
    var i = 0
    var j = height.count - 1
    var area = 0
    var wall = 0
    
    while i < j {
        let nextHeight: Int
        if height[i] <= height[j] {
            wall = wall < height[i] ? height[i] : wall
            i += 1
            nextHeight = height[i]
        } else {
            wall = wall < height[j] ? height[j] : wall
            j -= 1
            nextHeight = height[j]
        }
        if nextHeight < wall {
            area = area + wall - nextHeight
        }
    }
    return area
}

trap([0,1,0,2,1,0,1,3,2,1,2,1])
trap([0,1,0,2])
trap([2,1,0,1,3])
trap([3,2,1,2,1])
trap([10,0,0,0,5])
trap([10,0,0,0,20])
trap([10,0,5,0,10,0,0,5,10,9,8,7,6,5,4,3,2,1])
trap([10,9,8,7])
