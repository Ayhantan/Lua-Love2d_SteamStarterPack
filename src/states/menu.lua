local menu = {}

local Input = require("core.input")

local index = 1
local options = {
    "Start Game",
    "Settings",
    "Quit"
}

function menu:enter()
    index = 1
end

function menu:update(dt)
    if Input.isPressed("move_down") then
        index = index % #options + 1
    elseif Input.isPressed("move_up") then
        index = (index - 2) % #options + 1
    end

    if Input.isPressed("confirm") then
        if options[index] == "Start Game" then
            Game.switch("game")

        elseif options[index] == "Settings" then
            Game.switch("settings")

        elseif options[index] == "Quit" then
            love.event.quit()
        end
    end
end

function menu:draw()
    love.graphics.print("MAIN MENU", 100, 80)

    for i, opt in ipairs(options) do
        local y = 120 + i * 30
        local prefix = (i == index) and "> " or "  "
        love.graphics.print(prefix .. opt, 100, y)
    end
end

return menu
