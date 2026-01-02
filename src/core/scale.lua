local Config = require("core.config")

local Scale = {}

Scale.sx = 1
Scale.sy = 1
Scale.ox = 0
Scale.oy = 0

function Scale.update()
    local sw, sh = love.graphics.getDimensions()
    local iw, ih = Config.internalWidth, Config.internalHeight

    local scale = math.min(sw / iw, sh / ih)

    Scale.sx = scale
    Scale.sy = scale

    Scale.ox = (sw - iw * scale) / 2
    Scale.oy = (sh - ih * scale) / 2
end

function Scale.apply()
    love.graphics.push()
    love.graphics.translate(Scale.ox, Scale.oy)
    love.graphics.scale(Scale.sx, Scale.sy)
end

function Scale.reset()
    love.graphics.pop()
end

function Scale.toggleFullscreen()
    Config.fullscreen = not Config.fullscreen

    love.window.setFullscreen(Config.fullscreen)
    Scale.update()
end



return Scale
