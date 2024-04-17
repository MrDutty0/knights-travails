# Knight's Travails

## Introduction

Welcome to the Knight's Travails project! In this project, we'll be implementing a function called `knight_moves` that shows the shortest possible way for a knight in chess to move from one square to another on an 8x8 chessboard.

## Assignment

The task is to build a function `knight_moves` that outputs all squares the knight will stop on along the way from a given starting square to a destination square. The knight can move to any square on the standard 8x8 chessboard from any other square on the board, given enough turns. Its basic move is two steps forward and one step to the side or one step forward and two steps to the side. It can face any direction.

## Implementation

For this project, we've implemented the `knight_moves` function using the Breadth-First Search (BFS) algorithm. BFS is well-suited for finding the shortest path in unweighted graphs, which fits our problem of finding the shortest path for the knight on the chessboard.

We've structured the code to ensure that all moves are within the bounds of the chessboard and that the shortest path is determined efficiently.

Here's a brief overview of the main components of the implementation:

### `convert_xy_to_ij(point)`
This function converts the 2-dimensional coordinates of a square on the chessboard (x, y) to the equivalent indices (i, j) used in the implementation.

### `possible_move?(move_arr, i_curr, j_curr)`
Checks if a given move is possible based on the current position of the knight and the boundaries of the chessboard.

### `new_indices(curr, move)`
Calculates the new indices (i, j) after applying a given move to the current position of the knight.

### `convert_ij_to_xy(move_arr)`
Converts the indices (i, j) back to the 2-dimensional coordinates (x, y) for each square in the path.

### `knight_moves(start, goal)`
The main function that finds the shortest path from the starting square to the goal square using BFS.

## Testing

I've included some test cases to demonstrate the functionality of the `knight_moves` function:

```ruby
p knight_moves([0, 0], [1, 2]) # [[0,0],[1,2]]

p knight_moves([0, 0], [3, 3]) # [[0,0],[2,1],[3,3]]

p knight_moves([0, 0], [7, 7]) # [[0,0],[2,1],[4,2],[6,3],[7,5],[5,6],[7,7]]
