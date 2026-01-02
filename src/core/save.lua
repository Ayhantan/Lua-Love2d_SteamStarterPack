local json = require("core.json")

local Save = {}

Save.file = "savegame.json"
Save.version = 1

Save.data = {
    version = Save.version
}

-- =========================
-- LOAD
-- =========================
function Save.load()
    if love.filesystem.getInfo(Save.file) then
        local content = love.filesystem.read(Save.file)
        local decoded = json.decode(content)

        if decoded and decoded.version == Save.version then
            Save.data = decoded
        else
            -- Version mismatch → yeni save
            Save.reset()
        end
    else
        Save.reset()
    end
end

-- =========================
-- SAVE
-- =========================
function Save.save()
    Save.data.version = Save.version
    local content = json.encode(Save.data)
    love.filesystem.write(Save.file, content)
end

-- =========================
-- GET / SET
-- =========================
function Save.get(key, default)
    if Save.data[key] == nil then
        return default
    end
    return Save.data[key]
end

function Save.set(key, value)
    Save.data[key] = value
end

-- =========================
-- RESET
-- =========================
function Save.reset()
    Save.data = {
        version = Save.version
    }
    Save.save()
end

return Save
