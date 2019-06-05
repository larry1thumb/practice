/// Given a sorted list of integers,
/// return the squares of each element sorted.

func sortedSquares(_ A: [Int]) -> [Int] {
    var i = 0
    var j = 0
    var sortedSquares: [Int] = []
    
    A.forEach {
        if $0 < 0 {
            j += 1
        }
    }
    i = j - 1
    while i >= 0 || j < A.count {
        if i < 0 {
            sortedSquares.append(A[j] * A[j])
            j += 1
        } else if j >= A.count {
            sortedSquares.append(A[i] * A[i])
            i -= 1
        } else {
            if A[i] * A[i] < A[j] * A[j] {
                sortedSquares.append(A[i] * A[i])
                i -= 1
            } else {
                sortedSquares.append(A[j] * A[j])
                j += 1
            }
        }
    }
    return sortedSquares
}
