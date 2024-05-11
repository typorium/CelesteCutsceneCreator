function love.conf(t)

    -------------------------------------
    -- BASE CONFIGURATION
    -------------------------------------

    t.identity = "CelesteCutsceneCreator"
    t.release = false
    t.version = "11.5"

    -------------------------------------
    -- WINDOWS
    -------------------------------------

    -- Windows position and size
    t.window.x = 0
    t.window.y = 100
    
    t.window.width = 1920
    t.window.height = 1080

    -- Title bar configuration
    t.window.title = "Celeste Cutscene Creator"

    -- Window configuration
    t.window.resizable = true
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
end