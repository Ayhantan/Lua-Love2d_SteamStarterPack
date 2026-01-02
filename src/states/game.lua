local Save  = require("core.save")
local Input = require("core.input")
local Game  = require("core.game")

local game = {}

local counter = 0
local paused  = false

function game:enter()
    paused  = false
    counter = Save.get("counter", 0)
end

function game:update(dt)
    if Input.isPressed("pause") then
        paused = not paused
    end

    if paused then
        if Input.isPressed("confirm") then
            Game.switch("settings")
        end

        if Input.isPressed("quit") then
            Save.save()
            love.event.quit()
        end

        return
    end

    if Input.isPressed("confirm") then
        counter = counter + 1
        Save.set("counter", counter)
        Save.save()
    end
end

function game:draw()
    love.graphics.print("GAME RUNNING", 100, 100)
    love.graphics.print("Counter: " .. counter, 100, 130)

    if paused then
        love.graphics.rectangle("fill", 80, 80, 340, 180)
        love.graphics.setColor(1, 1, 1)

        love.graphics.print("PAUSED", 100, 100)
        love.graphics.print("ENTER  - Settings", 100, 130)
        love.graphics.print("ESC    - Resume", 100, 160)
        love.graphics.print("Q / B  - Save & Quit", 100, 190)
    end
end

return game
