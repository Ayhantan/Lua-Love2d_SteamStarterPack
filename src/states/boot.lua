local Settings = require("core.settings")
local Input    = require("core.input")
local Logger   = require("core.logger")
local L        = require("core.localization")

local boot = {}

function boot:enter()
    Logger.info("Boot started")

    Settings.load()
    Logger.info("Settings loaded")

    Input.bind("confirm", {"return", "space"})
    Input.bind("move_up", {"w", "up"})
    Input.bind("move_down", {"s", "down"})
    Input.bind("move_left", {"a", "left"})
    Input.bind("move_right", {"d", "right"})
    Input.bind("back", {"escape"})

    Logger.info("Input bindings ready")

    L.load("tr")
    Logger.info("Localization loaded: tr")

    Game.switch("menu")
end

function boot:update(dt) end
function boot:draw()
    love.graphics.print("Loading...", 100, 100)
end

return boot
