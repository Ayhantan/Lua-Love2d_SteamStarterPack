local Localization = {}

Localization.lang = "tr"
Localization.data = {}

function Localization.load(lang)
    Localization.lang = lang
    Localization.data = require("locale." .. lang)
end

function Localization.get(key)
    return Localization.data[key] or ("#" .. key)
end

return Localization
