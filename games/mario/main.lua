Class = require 'class'
push = require 'push'
require 'Util'
require 'Map'

-- actual window resolution
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- an object to contain our map
map = Map()

function love.load()

    -- makes upscaling look pixel-y instead of blurry
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- sets up virtual screen resolution for an authentic retro feel
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

 
function love.update(dt)
    map:update(dt)
end


function love.draw()
    -- begin virtual resolution drawing
    push:apply('start')

    love.graphics.translate(math.floor(-map.camX), math.floor(-map.camY))

    -- clear screen using Mario background blue
    love.graphics.clear(108/255, 140/255, 255/255, 255)

    -- renders our map objects onto the screen
    map:render()

    -- end virtual resolution
    push:apply('end')
end