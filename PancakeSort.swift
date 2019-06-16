/// Sort an array only using pancake flips.
/// Return the k-values corresponding to a sequence of pancake flips
/// A pancake flip of k (k<= A.count) reverses the ordre of the first
/// k elements in A.

func pancakeSort(_ A: [Int]) -> [Int] {
    var flippedA = A
    var steps: [Int] = []
    A.sorted(by: >).enumerated().forEach { index, value in
        guard
            let indexOfNextValue = flippedA.firstIndex(of: value),
            index < A.count - 1 // Don't need to run last digit
            else { return }
        
        if indexOfNextValue == A.count - index - 1 {
            return // Already in right position
        } else if indexOfNextValue > 0 {
            // Flip digit to the front of array
            // If value == 0, then we can we immediately
            // flip the digit into the correct spot.
            flippedA = pancake(value: indexOfNextValue + 1, flippedA)
            steps.append(indexOfNextValue + 1)
        }
        // Flip digit to correct spot.
        flippedA = pancake(value: A.count - index, flippedA)
        steps.append(A.count - index)
    }
    return steps
}

func pancake(value: Int, _ A: [Int]) -> [Int] {
    var pancakedA = A
    pancakedA[0..<value].reverse()
    return pancakedA
}

pancakeSort([2,1,3])
pancakeSort([5,2,10,4])
