func numRookCaptures(_ board: [[Character]]) -> Int {
    for i in 0..<8 {
        for j in 0..<8 {
            if board[i][j] == "R" {
                return capture(board, rookX: i, rookY: j, dX: 1, dY: 0)
                    + capture(board, rookX: i, rookY: j, dX: -1, dY: 0)
                    + capture(board, rookX: i, rookY: j, dX: 0, dY: 1)
                    + capture(board, rookX: i, rookY: j, dX: 0, dY: -1)
            }
        }
    }
    return 0
}

func capture(_ board: [[Character]], rookX: Int, rookY: Int, dX: Int, dY: Int) -> Int {
    var x = rookX + dX
    var y = rookY + dY
    while x >= 0 && x < 8 && y >= 0 && y < 8 {
        if board[x][y] == "p" {
            return 1
        }
        if board[x][y] == "B" {
            return 0
        }
        x += dX
        y += dY
    }
    return 0
}

numRookCaptures([[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]])
numRookCaptures([[".",".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]])
