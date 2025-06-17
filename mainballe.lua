posX = 100
posY = 100
vx = 1
vy = 1 
pvx = 1
pvy = 1

local puzzle = require("minijeux.puzzle")

function overCircle(x, y, r)
    return (posX - x)^2 + (posY - y)^2 < r^2
end

function changeCircleColor()
    if overCircle(love.mouse.getX(), love.mouse.getY(), 30) then
        love.graphics.setColor(1, 0, 0) 
    else
        love.graphics.setColor(0, 1, 0) 
    end
end

function pauseCircle()
    if vx == 0 and vy == 0 then
        
    else
        pvx = vx
        pvy = vy
        vx = 0
        vy = 0
    end
end


function clickOverCircle()
    if love.mouse.isDown(1) then
        if overCircle(love.mouse.getX(), love.mouse.getY(), 30) then
            pauseCircle()
        end
    else
        if vx == 0 and vy == 0 then
            vx = pvx
            vy = pvy
        end
    end
end



function love.load()
    width, height = love.graphics.getDimensions()
    success = love.window.setFullscreen( false )
    puzzle.testGrid()
    

end

function love.focus(focused)

end

function love.update(dt)
    width, height = love.graphics.getDimensions()
    posX = posX+vx
    if posX + 30 > width then
        vx = -1
    elseif posX - 30 < 0 then
        vx = 1
    end
    posY = posY + vy
    if posY + 30 > height then
        vy = -1
    elseif posY - 30 < 0 then
        vy = 1
    end

    changeCircleColor()
    clickOverCircle()
end

function love.draw()
    
    
    --recup de la pos de la fenetre sur lecran
    px, py = love.window.getPosition()

    love.graphics.circle("fill",posX,posY,30)

    --puzzle.testGrid()
    --puzzle.printGrid()

end