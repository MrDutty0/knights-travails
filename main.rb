# frozen_string_literal: true

def convert_xy_to_ij(point)
  x, y = point

  i = 7 - y
  j = x

  [i, j]
end

def possible_move?(move_arr, i_curr, j_curr)
  i_curr.between?(0, 7) && j_curr.between?(0, 7) && (move_arr.select { |move| move == [i_curr, j_curr] }).empty?
end

def new_indices(curr, move)
  i_curr, j_curr = curr
  i_diff, j_diff = move

  new_i = i_curr + i_diff
  new_j = j_curr + j_diff

  [new_i, new_j]
end

def convert_ij_to_xy(move_arr)
  move_arr.map { |i, j| [7 - i, j] }
end

def knight_moves(start, goal)
  start = convert_xy_to_ij(start)
  goal = convert_xy_to_ij(goal)

  possible_moves = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]

  q = [[start]]
  until q.empty?
    move_arr = q.shift

    curr = move_arr.last
    return convert_ij_to_xy(move_arr) if curr == goal

    possible_moves.each do |move|
      new_i, new_j = new_indices(curr, move)

      next unless possible_move?(move_arr, new_i, new_j)

      q.push(move_arr.dup << [new_i, new_j])
    end
  end
end

# Testing:
p knight_moves([0, 0], [1, 2]) # [[0,0],[1,2]]

p knight_moves([0, 0], [3, 3]) # [[0,0],[2,1],[3,3]]

p knight_moves([0, 0], [7, 7]) # [[0,0],[2,1],[4,2],[6,3],[7,5],[5,6],[7,7]]
