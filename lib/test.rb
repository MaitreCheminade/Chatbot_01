def create_maze(x, y)
  directions = [[x, y - 2], [x, y + 2], [x - 2, y], [x + 2, y]].shuffle

  directions.each do |new_x, new_y|
    if new_y.between?(1, @height * 2) && new_x.between?(1, @width * 2) && @maze[new_y][new_x] == "#"
      @maze[y + (new_y - y) / 2][x + (new_x - x) / 2] = " "
      @maze[new_y][new_x] = " "
      create_maze(new_x, new_y)
    end
  end

maze = Array.new(x) { Array.new(y, 0) }

visited = [[0, 0]]

while visited.length < x * y
current = visited.last
directions.each do |direction|
  next_x = current[0] + direction[0]
  next_y = current[1] + direction[1]

  if next_x.between?(0, x - 1) && next_y.between?(0, y - 1) && maze[next_x][next_y] == 0
    maze[current[0]][current[1]] = 1
    maze[next
> > §§ 1020
  directions.each do |direction|
    if valid_move?(direction[0], direction[1])
      @maze[y][x] = 0
      @maze[direction[1]][direction[0]] = 0
      generate_maze(direction[0], direction[1])
    end
  end
end

def valid_move?(x, y)
  x.between?(0, @maze[0].length - 1) && y.between?(0, @maze.length - 1) && @maze[y][x] == 1
end

def display_
       if (new_x >= 0 && new_x < grid.length) && (new_y >= 0 && new_y < grid[0].length)
         if grid[new_x][new_y] == 1
           queue << [new_x, new_y]
           grid[new_x][new_y] = 0
         end
       end
     end
   end

  return false
 end

# p river_sizes([
#   [1, 0, 0, 1, 0],
#   [1, 0, 1, 0, 0],
#   [0,
> > @maze[new_y][new_x] = " "
    @maze[new_y + (new_y - y) / 2][new_x + (new_x - x) / 2] = " "
    generate_maze(new_x, new_y)
  end
end
end

def display_maze
@maze.each do |row|
  puts row.join
end
end

def start_maze
generate_maze(1, 1)
display_maze
end

start_maze
      @maze[new_y][new_x] = " "
      generate_maze(new_x, new_y)
    end
  end
end

end

maze = Maze.new(20, 20)
maze.generate_maze(1, 1)
maze.print_maze
> > §§ 1020
      @maze[y + (new_y - y) / 2][x + (new_x - x) / 2] = " "
      @maze[new_y][new_x] = " "

      # Recursively call the method again
      generate_maze(new_x, new_y)
    end
  end
end

def display_maze
  @maze.each do |row|
    puts row.join
  end
end
end

maze = Maze.new
maze.generate_maze(0, 0)
maze.display_
 end
  end
end

def print_maze
  @maze.each do |row|
    puts row.join
  end
end
end

maze = Maze.new(20, 20)
maze.create_maze(0, 0)
maze.print_maze
end
end

create_maze(1,1)

# Print the maze
maze.each { |row| puts row.join }
 end
end
end

# This is a nested loop. The outer loop is the first 'each' loop, which iterates over the array 'numbers'. The inner loop is the second 'each' loop, which iterates over the array 'numbers'. The inner loop is nested inside the outer loop.