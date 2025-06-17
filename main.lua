
local puzzle = require("minijeux.puzzle")



function love.load()
    width, height = love.graphics.getDimensions()
    success = love.window.setFullscreen( false )
    puzzle.testGrid()
end

function love.update(dt)

end

function love.draw()

    puzzle.printGrid()

end
function love.mousepressed(x, y, button, istouch, presses)
    -- click sur la page
    if button == 1 then
        -- Vérifier si le clic est dans la zone de la grille
        puzzle.click(x,y)
    end
   
end
function love.keypressed(key)
    -- click sur la page
    
end