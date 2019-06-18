func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var mutableGrid = grid
    var maxSize = 0
    let xRange = 0..<grid.count
    let yRange = 0..<grid[0].count
    for x in xRange {
        for y in yRange {
            if grid[x][y] == 1 {
                let newSize = calculateAndRemoveIsland(i: x, j: y, grid: &mutableGrid)
                if newSize > maxSize { maxSize = newSize }
            }
        }
    }
    return maxSize
}

func calculateAndRemoveIsland(i: Int, j: Int, grid: inout [[Int]]) -> Int {
    var queue: [(Int, Int)] = []
    var size = 1
    grid[i][j] = 0
    queue.append((i, j))
    
    while !queue.isEmpty {
        let nextIndex = queue.removeFirst()
        let indices = adjacentLand(i: nextIndex.0, j: nextIndex.1, grid: grid)
        indices.forEach {
            grid[$0.0][$0.1] = 0
            size += 1
        }
        queue.append(contentsOf: indices)
        
    }
    return size
}

func adjacentLand(i: Int, j: Int, grid: [[Int]]) -> [(Int, Int)] {
    var adjacentSpaces: [(Int, Int)] = []
    
    if grid[safe: i + 1]?[safe: j] == 1 {
        adjacentSpaces.append((i + 1, j))
    }
    if grid[safe: i - 1]?[safe: j] == 1 {
        adjacentSpaces.append((i - 1, j))
    }
    if grid[safe: i]?[safe: j + 1] == 1 {
        adjacentSpaces.append((i, j + 1))
    }
    if grid[safe: i]?[safe: j - 1] == 1 {
        adjacentSpaces.append((i, j - 1))
    }
    return adjacentSpaces
}

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
