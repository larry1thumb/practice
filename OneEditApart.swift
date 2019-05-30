/// Check if edit distance between two strings is one
/// An edit can be defined as the following:
///     - Adding a character
///     - Deleting a character
///     - Updating a character

func oneEditApart(stringA: String, stringB: String) -> Bool {
    
    let lengthA = stringA.count
    let lengthB = stringB.count
    
    if abs(lengthA - lengthB) > 1 { return false }
    
    var edits = 0
    var i = 0
    var j = 0
    
    while i < lengthA && j < lengthB {
        let indexA = stringA.index(stringA.startIndex, offsetBy: i)
        let indexB = stringB.index(stringB.startIndex, offsetBy: j)
        
        if stringA[indexA] == stringB[indexB] {
            i += 1
            j += 1
        } else {
            edits += 1
            if lengthA > lengthB {
                i += 1
            } else if lengthB > lengthA {
                j += 1
            } else {
                i += 1
                j += 1
            }
        }
    }
    
    if i < lengthA || j < lengthB {
        edits += 1
    }
    
    return edits == 1
}

assert(oneEditApart(stringA: "Alphabet", stringB: "lphabet") == true)
assert(oneEditApart(stringA: "Alphbbet", stringB: "Alphabet") == true)
assert(oneEditApart(stringA: "Alphabet", stringB: "Alphabe") == true)
assert(oneEditApart(stringA: "Alphabex", stringB: "Alphabet") == true)
assert(oneEditApart(stringA: "Alphabet", stringB: "Alphabet") == false)
assert(oneEditApart(stringA: "Alphabet", stringB: "Alphabet  ") == false)
assert(oneEditApart(stringA: "AAlphabett", stringB: "Alphabet") == false)






