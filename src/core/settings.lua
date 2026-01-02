local Config = require("core.config")
local json   = require("core.json")

local Settings = {}

Settings.file = "settings.json"

-- =========================
-- DEFAULTS (Config'ten gelir)
-- =========================
Settings.fullscreen = Config.fullscreen
Settings.vsync      = Config.vsync
Settings.volume     = {
    master = Config.volume.master,
    music  = Config.volume.music,
    sfx    = Config.volume.sfx
}

-- =========================
-- LOAD
-- =========================
function Settings.load()
    if love.filesystem.getInfo(Settings.file) then
        local data = love.filesystem.read(Settings.file)
        local decoded = json.decode(data)

        if decoded then
            if decoded.fullscreen ~= nil then
                Settings.fullscreen = decoded.fullscreen
            end

            if decoded.vsync ~= nil then
                Settings.vsync = decoded.vsync
            end

            if decoded.volume then
                Settings.volume = decoded.volume
            end
        end
    end

    Settings.apply()
end


-- =========================
-- SAVE
-- =========================
function Settings.save()
    local data = json.encode({
        fullscreen = Settings.fullscreen,
        vsync      = Settings.vsync,
        volume     = Settings.volume
    })

    love.filesystem.write(Settings.file, data)
end

-- =========================
-- APPLY
-- =========================
function Settings.apply()
    love.window.setMode(
        Config.windowWidth,
        Config.windowHeight,
        {
            fullscreen = Settings.fullscreen,
            vsync      = Settings.vsync,
            resizable  = true
        }
    )

    love.audio.setVolume(Settings.volume.master)
end

-- =========================
-- TOGGLES
-- =========================
function Settings.toggleFullscreen()
    Settings.fullscreen = not Settings.fullscreen
    Settings.apply()
end

function Settings.toggleVsync()
    Settings.vsync = not Settings.vsync
    Settings.apply()
end

-- =========================
-- VOLUME
-- =========================
function Settings.changeVolume(channel, delta)
    local v = Settings.volume[channel]
    if not v then return end

    Settings.volume[channel] = math.max(0, math.min(1, v + delta))
end

return Settings
