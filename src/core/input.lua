local Input = {}

-- =========================
-- BINDINGS (STATİK)
-- =========================
Input.bindings = {
    move_left  = { keyboard = {"a", "left"},  gamepad = {"dpleft"} },
    move_right = { keyboard = {"d", "right"}, gamepad = {"dpright"} },
    move_up    = { keyboard = {"w", "up"},    gamepad = {"dpup"} },
    move_down  = { keyboard = {"s", "down"},  gamepad = {"dpdown"} },

    confirm    = { keyboard = {"return", "space"}, gamepad = {"a"} },
    cancel     = { keyboard = {"escape"}, gamepad = {"b"} },
    pause      = { keyboard = {"escape"}, gamepad = {"start"} },
    quit       = { keyboard = {"q"}, gamepad = {"b"} },
}

-- =========================
-- STATE
-- =========================
Input.gamepads = {}
Input.pressed  = {}

-- =========================
-- UPDATE
-- =========================
function Input.update()
    Input.gamepads = love.joystick.getJoysticks()
end

-- =========================
-- IS DOWN (HOLD)
-- =========================
function Input.isDown(action)
    local bind = Input.bindings[action]
    if not bind then return false end

    -- Keyboard
    if bind.keyboard then
        for _, key in ipairs(bind.keyboard) do
            if love.keyboard.isDown(key) then
                return true
            end
        end
    end

    -- Gamepad
    if bind.gamepad then
        for _, js in ipairs(Input.gamepads) do
            for _, btn in ipairs(bind.gamepad) do
                if js:isGamepadDown(btn) then
                    return true
                end
            end
        end
    end

    return false
end

-- =========================
-- IS PRESSED (SINGLE)
-- =========================
function Input.isPressed(action)
    if Input.isDown(action) and not Input.pressed[action] then
        Input.pressed[action] = true
        return true
    end
    return false
end

-- =========================
-- END FRAME (RELEASE CHECK)
-- =========================
function Input.endFrame()
    for action in pairs(Input.pressed) do
        if not Input.isDown(action) then
            Input.pressed[action] = nil
        end
    end
end

-- =========================
-- CLEAR (ALT+TAB / FOCUS LOST)
-- =========================
function Input.clear()
    Input.pressed = {}
end

return Input
