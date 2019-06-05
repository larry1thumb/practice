/// Flip and Reverse Matrix

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var flippedImage: [[Int]] = A
    A.enumerated().forEach { index, array in
        flippedImage[index] = array.reversed()
    }
    flippedImage = flippedImage.map { array in
        array.map {
            return $0 == 0 ? 1 : 0
        }
    }
    return flippedImage
}

flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])
