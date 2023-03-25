---PLAYER CODE---
player = {}



function player:load()



    self.x = 0
    self.y = 0
    self.w = 16
    self.h = 16
    self.r = 0
    self.posX = gw/2
    self.posY = 700
    self.sx = 1
    self.sy = 1
    self.dir = ""
    self.speed = 300
    self.xvel = self.speed * math.cos(math.pi/4)
    self.yvel = self.speed * math.sin(math.pi/4)
    self.ox = self.w/2
    self.oy = self.h/2

    self.state = "idle"
    self.status = ""
    self.pulo = "desativado"

    lifePoints = 1
    maxLifePoints = 10
    timeHeal = 1

    espinafre = 5

    randomProcura = math.random(1, 100)
    procura = randomProcura
    tempoProcura = 1

    self.collider = world:newRectangleCollider(self.posX, self.posY, 16, 16)

end


function player:update(dt)

    randomProcura = math.random(1, 100)

    local px, py = self.collider:getPosition()
    self.posX = -8+px
    self.posY = -8+py

    if love.keyboard.isDown("a") or love.keyboard.isDown("d") then

        if self.status == "heal" or self.status == "healing" or self.status == "search" or self.status == "searching" then
            self.state = "idle"
        else
            self.state = "walking"
        end

        if love.keyboard.isDown("a") and self.state == "walking" then

            if self.pulo == "desativado" then
                self.collider:setLinearVelocity(-150, 0)
            end

            self.dir = "left"
        elseif love.keyboard.isDown("d") and self.state == "walking" then

            if self.pulo == "desativado" then
                self.collider:setLinearVelocity(150, 0)
            end

            self.dir = "right"
        end

    else

        self.state = "idle"

    end


    if self.pulo == "ativado" then

        if self.state == "walking" then
            if self.dir == "left" then
                self.collider:applyLinearImpulse(-25, -125)
            elseif self.dir == "right" then
                self.collider:applyLinearImpulse(25, -125)
            end
        elseif self.state == "idle" then
            self.collider:applyLinearImpulse(0, -125)
        end
        
        if py <= -40+gy then
            self.pulo = "voltando" 
        end

    elseif self.pulo == "voltando" then
        self.collider:applyLinearImpulse(0, 50)
        if py > -40+gy and py <= gy then
            self.pulo = "desativado"
        end
    else
        self.collider:applyLinearImpulse(0,0)
    end

    if lifePoints >= maxLifePoints then
        lifePoints = maxLifePoints
    end

    if espinafre <= 0 then
        espinafre = 0
    elseif espinafre >= 9 then
        espinafre = 9
    end


    if self.status == "heal" then
        
        timeHeal = timeHeal - 0.5 * dt

        if timeHeal <= 0 then
        self.status = "healing"
        timeHeal = 1
        end

        if self.status == "healing" then
            espinafre = espinafre - 1
            lifePoints = lifePoints + 3
            self.status = "idle"
        end

    elseif self.status == "search" then
        procura = randomProcura

        tempoProcura = tempoProcura - 0.5 * dt

        if tempoProcura <= 0 then
            self.status = "searching"
            tempoProcura = 1
        end

        if self.status == "searching" then

            if procura >= 1 and procura <= 25 then
                espinafre = espinafre + 1
                self.status = "idle"
            else
                self.status = "idle"
            end

        end

    end
    


end


function player:draw()

    lg.setColor(1, 0, 0)
    lg.rectangle("fill", self.posX, self.posY, self.w, self.h)

    lg.setColor(1, 1, 1)
    lg.print("state:"..self.state, 20, 25)
    lg.print("status:"..self.status, 20, 50)

    lg.print("lifePoints:"..lifePoints, 20, 75)
    lg.print(maxLifePoints, 100, 75)
    lg.print("lifePoints:"..lifePoints, 20, 75)
    lg.print("timeHeal:"..timeHeal, 20, 100)

    lg.print("espinafres:"..espinafre, 900, 50)
    lg.print("random:"..randomProcura, 900, 75)
    lg.print("procura:"..procura, 900, 100)
    if self.status == "search" then
    lg.print("time:"..tempoProcura, 900, 125)
    end
    
    lg.print("pulo:"..self.pulo, 20, 125)

    lg.print("dir:"..self.dir, 20, 150)

end


function player:keypressed(key)
    
    if key == "space" and self.pulo == "desativado" then
        self.pulo = "ativado"
    end

    if key == "e" and self.state == "idle" and espinafre >= 1 and lifePoints < maxLifePoints then
        self.status = "heal"
    end

    if key == "s" and self.state == "idle" then
        self.status = "search"
    end

end

function player:keyreleased(key)

    if key == "e" and self.status == "healing" then
        --self.state = "idle"
    end

    if key == "a" and self.state == "walking" then
        self.collider:setLinearVelocity(-75, 0)
    elseif key == "d" and self.state == "walking" then
        self.collider:setLinearVelocity(75, 0)
    end

end


function player:mousepressed(x, y, button)

end

function player:mousereleased(x, y, button)

end
