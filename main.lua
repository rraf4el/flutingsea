---MAIN CODE---

lg = love.graphics

gw = lg.getWidth()
gh = lg.getHeight()



---REQUIRES---
---GERAL---

---maps---
---maps---
---objects---
---objects---
---player---
require("player")
---player---

---GERAL---


---LIBRARIES---
wf = require "libraries/windfield"
---LIBRARIES---
---REQUIRES---

world = wf.newWorld(0, 800)

function love.load()


    lg.setBackgroundColor(0.1, 0.7, 0.8)

    ground = world:newRectangleCollider(0, 750, 1000, 50)
    ground:setType('static')

    player:load()

end


function love.update(dt)

    gx, gy = ground:getPosition()

    world:update(dt)
    player:update(dt)

end


function love.draw()

    world:draw()
    player:draw()

end


function love.keypressed(key)
    player:keypressed(key)
end

function love.keyreleased(key)
    player:keyreleased(key)
end


function love.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)

end


