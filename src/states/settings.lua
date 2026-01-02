local Settings = require("core.settings")
local Input    = require("core.input")
local Game     = require("core.game")

local settings = {}

local index = 1

local options = {
    "Fullscreen",
    "VSync",
    "Master Volume",
    "Music Volume",
    "SFX Volume",
    "Back"
}

function settings:enter()
    index = 1
end

function settings:update(dt)
    if Input.isPressed("move_down") then
        index = index % #options + 1
    elseif Input.isPressed("move_up") then
        index = (index - 2) % #options + 1
    end

    -- CONFIRM
    if Input.isPressed("confirm") then
        local opt = options[index]

        if opt == "Fullscreen" then
            Settings.toggleFullscreen()

        elseif opt == "VSync" then
            Settings.toggleVsync()

        elseif opt == "Back" then
            Settings.save()
            Game.switch("game")
        end
    end

    -- LEFT / RIGHT (VOLUME)
    if Input.isPressed("move_left") then
        local opt = options[index]

        if opt == "Master Volume" then
            Settings.changeVolume("master", -0.1)
        elseif opt == "Music Volume" then
            Settings.changeVolume("music", -0.1)
        elseif opt == "SFX Volume" then
            Settings.changeVolume("sfx", -0.1)
        end
    end

    if Input.isPressed("move_right") then
        local opt = options[index]

        if opt == "Master Volume" then
            Settings.changeVolume("master", 0.1)
        elseif opt == "Music Volume" then
            Settings.changeVolume("music", 0.1)
        elseif opt == "SFX Volume" then
            Settings.changeVolume("sfx", 0.1)
        end
    end

    -- CANCEL (ESC / B)
    if Input.isPressed("cancel") then
        Settings.save()
        Game.switch("game")
    end
end

function settings:draw()
    love.graphics.print("SETTINGS", 100, 80)

    for i, opt in ipairs(options) do
        local y = 120 + i * 30
        local prefix = (i == index) and "> " or "  "

        if opt == "Fullscreen" then
            love.graphics.print(prefix .. opt .. ": " .. tostring(Settings.fullscreen), 100, y)

        elseif opt == "VSync" then
            love.graphics.print(prefix .. opt .. ": " .. tostring(Settings.vsync), 100, y)

        elseif opt == "Master Volume" then
            love.graphics.print(prefix .. opt .. ": " .. math.floor(Settings.volume.master * 100) .. "%", 100, y)

        elseif opt == "Music Volume" then
            love.graphics.print(prefix .. opt .. ": " .. math.floor(Settings.volume.music * 100) .. "%", 100, y)

        elseif opt == "SFX Volume" then
            love.graphics.print(prefix .. opt .. ": " .. math.floor(Settings.volume.sfx * 100) .. "%", 100, y)

        else
            love.graphics.print(prefix .. opt, 100, y)
        end
    end

    love.graphics.print("ESC / B - Back", 100, 320)
end

return settings
