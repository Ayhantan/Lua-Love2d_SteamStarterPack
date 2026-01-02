local dkjson = require("core.dkjson")

local json = {}

function json.encode(tbl)
    return dkjson.encode(tbl)
end

function json.decode(str)
    return dkjson.decode(str)
end

return json
