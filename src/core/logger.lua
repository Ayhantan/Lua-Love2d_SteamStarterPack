local Logger = {}

Logger.levels = {
    DEBUG = 1,
    INFO  = 2,
    WARN  = 3,
    ERROR = 4
}

Logger.currentLevel = Logger.levels.DEBUG
Logger.file = "game.log"

local function write(level, msg)
    local time = os.date("%H:%M:%S")
    local line = string.format("[%s] [%s] %s\n", time, level, msg)

    print(line)

    love.filesystem.append(Logger.file, line)
end

function Logger.debug(msg)
    if Logger.currentLevel <= Logger.levels.DEBUG then
        write("DEBUG", msg)
    end
end

function Logger.info(msg)
    if Logger.currentLevel <= Logger.levels.INFO then
        write("INFO", msg)
    end
end

function Logger.warn(msg)
    if Logger.currentLevel <= Logger.levels.WARN then
        write("WARN", msg)
    end
end

function Logger.error(msg)
    write("ERROR", msg)
end

return Logger
