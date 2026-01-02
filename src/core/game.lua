local Game = {}

Game.states = {}
Game.current = nil

function Game.register(name, state)
    Game.states[name] = state
end

function Game.switch(name, ...)
    if Game.current and Game.current.exit then
        Game.current:exit()
    end

    Game.current = Game.states[name]

    if Game.current and Game.current.enter then
        Game.current:enter(...)
    end
end

function Game.update(dt)
    if Game.current and Game.current.update then
        Game.current:update(dt)
    end
end

function Game.draw()
    if Game.current and Game.current.draw then
        Game.current:draw()
    end
end

return Game
