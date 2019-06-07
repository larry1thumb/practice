/// Order array in such a way that following the rules, the cards are drawn in increasing order
/// 1) Take the top card of the deck, reveal it, and take it out of the deck.
/// 2) If there are still cards in the deck, put the next top card of the deck at the bottom of the deck.
/// 3) If there are still unrevealed cards, go back to step 1.  Otherwise, stop.

func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
    let deckSize = deck.count
    let sortedDeck = deck.sorted()
    var orderedDeck: [Int] = Array.init(repeating: -1, count: deckSize)
    var nextIndex = 0
    sortedDeck.forEach {
        orderedDeck[nextIndex] = $0
        nextIndex = findNextIndex(currentIndex: nextIndex, array: orderedDeck)
    }
    return orderedDeck
}

func findNextIndex(currentIndex: Int, array: [Int]) -> Int {
    guard array.contains(-1) else { return -1 }
    var emptyCount = 0
    var nextIndex = currentIndex % array.count
    while emptyCount < 2 {
        nextIndex = (nextIndex + 1) % array.count
        if array[nextIndex] == -1 {
            emptyCount += 1
        }
    }
    return nextIndex
}

deckRevealedIncreasing([0,1,2,3,4])
deckRevealedIncreasing([17,13,11,2,3,5,7])
