Game     = require("core.game")
Config   = require("core.config")
Scale    = require("core.scale")
Input    = require("core.input")
Settings = require("core.settings")
Save     = require("core.save")

function love.load()
    -- Load persistent data
    Settings.load()
    Save.load()

    -- Window setup (after settings)
    love.window.setMode(
        Config.windowWidth,
        Config.windowHeight,
        {
            fullscreen = Settings.fullscreen,
            vsync      = Settings.vsync,
            resizable  = true
        }
    )

    -- Register states
    Game.register("menu", require("states.menu"))
    Game.register("game", require("states.game"))
    Game.register("settings", require("states.settings"))

    -- Initial scaling
    Scale.update()

    -- Start game
    Game.switch("menu")
end

function love.update(dt)
    Input.update()
    Game.update(dt)
    Input.endFrame()
end

function love.draw()
    -- Letterbox background
    love.graphics.clear(0, 0, 0)

    Scale.apply()
    Game.draw()
    Scale.reset()
end

function love.resize(w, h)
    Scale.update()
end

-- ALT+TAB / focus lost fix
function love.focus(focused)
    if not focused then
        Input.clear()
    end
end

-- Graceful exit (Steam-safe)
function love.quit()
    Settings.save()
    Save.save()
end
