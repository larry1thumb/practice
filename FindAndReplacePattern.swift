func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
    let mappedPattern = mapToInt(word: pattern)
    let mappedWords = words.map { mapToInt(word: $0) }
    var matchingWords: [String] = []
    
    mappedWords.enumerated().forEach {
        if $1.elementsEqual(mappedPattern) {
            matchingWords.append(words[$0])
        }
    }
    return matchingWords
}

func mapToInt(word: String) -> [Int] {
    var patternDictionary: [Character: Int] = [:]
    var mapper = 0
    word.forEach {
        if let _ = patternDictionary[$0] {
            return
        } else {
            patternDictionary[$0] = mapper
            mapper += 1
        }
    }
    return word.compactMap { patternDictionary[$0] }
}

findAndReplacePattern(["abc","deq","mee","aqq","dkd","ccc"], "abb")
