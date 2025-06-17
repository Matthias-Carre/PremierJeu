local puzzle = {}
local image = love.graphics.newImage("images/tetecarre.jpg")

puzzle.grid = {}
puzzle.emptyCell = {x = 2, y = 1}


puzzle.gridWidth = 4
puzzle.gridHeight = 4
puzzle.cellSize = 100

function puzzle.click(x, y)
  local pieceX = math.floor((x - 1) / puzzle.cellSize) + 1
  local pieceY = math.floor((y - 1) / puzzle.cellSize) + 1
  if pieceX < 1 or pieceX > puzzle.gridWidth or pieceY < 1 or pieceY > puzzle.gridHeight then
    return
  end
  if pieceX == puzzle.emptyCell.x and pieceY == puzzle.emptyCell.y then
    return
  end
  print("click sur la peice (" .. pieceX .. ", " .. pieceY .. ")")
  puzzle.movePiece(pieceX, pieceY)
  print(puzzle.emptyCell.x .. ", " .. puzzle.emptyCell.y)


end

function puzzle.movePiece(pieceX, pieceY)
  -- adj a la case vide
  if (math.abs(pieceX - puzzle.emptyCell.x) == 1 and pieceY == puzzle.emptyCell.y) or
     (math.abs(pieceY - puzzle.emptyCell.y) == 1 and pieceX == puzzle.emptyCell.x) then
    puzzle.grid[puzzle.emptyCell.y][puzzle.emptyCell.x] = puzzle.grid[pieceY][pieceX]
    puzzle.emptyCell.x = pieceX
    puzzle.emptyCell.y = pieceY
  end
end

function puzzle.testGrid()
  local image = love.graphics.newImage("images/tetecarre.jpg")
  local rows = 4
  local cols = 4

  for i = 1, rows do
    local ligne = {}
    for j = 1, cols do
      local piece = love.graphics.newQuad((j - 1) * 100, (i - 1) * 100, 100, 100, 400, 400)
      ligne[j] = piece
      --love.graphics.draw(image, piece, (j - 1) * 100 + j*2, (i - 1) * 100 + i*2)
    end
    puzzle.grid[i] = ligne
  end
  
end 

function puzzle.printGrid()
  for i, row in ipairs(puzzle.grid) do
    for j, piece in ipairs(row) do
      if i == puzzle.emptyCell.y and j == puzzle.emptyCell.x then
      else
        love.graphics.draw(image, piece, (j - 1) * 100 + j*2, (i - 1) * 100 + i*2)
      end
      
    end
  end
end

function puzzle.loadImage()
  local image = love.graphics.newImage("images/tetecarre.jpg")
  --on affiche l'image
  --love.graphics.draw(image, 0, 0)

  local partie = love.graphics.newQuad(0, 0, 100, 100, image:getDimensions())
  love.graphics.draw(image, partie, 0, 0)
  print("Image loaded successfully")
  return image
end


function puzzle.createGrid(rows, cols)
  for i = 1, rows do
    puzzle.grid[i] = {}
    for j = 1, cols do
      puzzle.grid[i][j] = {x = (j - 1) * 100, y = (i - 1) * 100, occupied = false}
    end
  end
end

function puzzle.drawGrid()
  for i, row in ipairs(puzzle.grid) do
    for j, cell in ipairs(row) do
      if not cell.occupied then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", cell.x, cell.y, 100, 100)
      end
    end
  end
end

return puzzle