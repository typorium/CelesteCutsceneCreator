--------------------------
-- LOVE CALLBACKS
--------------------------

-- Loading
function love.load()
    
    -- Window configuration
    init_width, init_height = 1920, 1080
    current_width, current_height = init_width, init_height
    love.keyboard.setKeyRepeat(true)

    love.window.setMode(init_width, init_height, {resizable=true})
    love.window.setTitle("Celeste Cutscene Creator")

    -- Global informations to pass to all elements
    global_informations = {}
    global_informations.current_scale_x = current_width / init_width
    global_informations.current_scale_y = current_height / init_height

    -- UI Loader
    dofile("src/ui_loader.lua")

    -- DEBUG Testing
    love.window.setPosition(100, 300, 1)

end


-- Quitting
function love.quit()
end

-- Resizing
function love.resize()
    
    -- Changing the scales for graphics / display
    global_informations.current_scale_x = love.graphics.getWidth() / init_width
    global_informations.current_scale_y = love.graphics.getHeight() / init_height

    -- Update informations
    CCC_SceneManager:resize(global_informations)

end 


-- Mouse button pressed
function love.mousepressed(x, y, button, istouch, presses)
    CCC_SceneManager:mousepressed(x, y, button, istouch, presses, global_informations)
    
    print("mouse click : ( x="..x..", y="..y..")")
end


-- Text input
function love.textinput(t)
    CCC_SceneManager:textinput(t)
end

function love.keypressed(key)
    CCC_SceneManager:keypressed(key)
end

--------------------------
-- LOVE METHODS
--------------------------

-- Drawing
function love.draw()
    
    love.graphics.clear()

    -- Scaling
    love.graphics.push()
    love.graphics.scale(global_informations.current_scale_x, global_informations.current_scale_y)

    -- Actual Drawing
    CCC_SceneManager:draw(global_informations)

    -- Back to defined resolution
    love.graphics.pop()
end

-- Update
function love.update(dt)
    CCC_SceneManager:update(dt, global_informations)
end
