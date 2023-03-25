---FISH CODE---
fish = {}



function fish:load()

    self.x = 0
    self.y = 0
    self.w = 32
    self.h = 32
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

    
    numeroAleatorioFish = math.random(0, 10)
    

    doces = {}
    docesNumber = 0
    maxDocesNumber = numeroAleatorioFish
    tempoSurgirDoces = 1

    salgados = {}
    salgadosNumber = 0
    maxSalgadosNumber = numeroAleatorioFish
    tempoSurgirSalgados = 1

    quentes = {}
    quentesNumber = 0
    maxQuentesNumber = numeroAleatorioFish
    tempoSurgirQuentes = 1

    frios = {}
    friosNumber = 0
    maxFriosNumber = numeroAleatorioFish
    tempoSurgirFrios = 1


end


function fish:update(dt)

    numeroAleatorioX = math.random(25, -32+gw)
    numeroAleatorioY = math.random(0, 200)

    numeroAleatorioFish = math.random(0, 10)
    

end


function fish:draw()

    

end



function fish:keypressed(key)

    

end

function fish:keyreleased(key)

    

end



function fish:mousepressed(x, y, button)



end

function fish:mousereleased(x, y, button)



end


---FISH TYPES---


function fish:doce(dt)

    novoDoce = {
        x = 0,
        y = 0,
        wh = 16,
        r = 0,
        posX = 0,
        posY = 0,
        sx = 1,
        sy = 1,
        dir = "",
        speed = 300,
        state = "",
        status = ""
    }


end


function fish:salgado(dt)

    novoSalgado = {
        x = 0,
        y = 0,
        wh = 16,
        r = 0,
        posX = 0,
        posY = 0,
        sx = 1,
        sy = 1,
        dir = "",
        speed = 300,
        state = "",
        status = ""
    }


end


function fish:quente(dt)


end


function fish:frio(dt)


end


---FISH TYPES---

