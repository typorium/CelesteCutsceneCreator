--------------------------
-- CONSTANTS
--------------------------

KEY_LCTRL_ID = "lctrl"
KEY_V = "v"

INPUT_ACCEPTED_CHARACTERS = "[%a%d_ ]"


--------------------------
-- LOVE CALLBACKS
--------------------------

-- Loading
function love.load()
    
    -----------GLOBAL----------------- 
    global_informations = {}

    -- Window scaling informations
    base_width, base_height = 1920, 1080
    global_informations.current_scale_x = love.graphics.getWidth() / base_width
    global_informations.current_scale_y = love.graphics.getHeight() / base_height

    -- Keyboard config
    love.keyboard.setKeyRepeat(true)

    -----------Logic---------------------
    dofile("src/logic_loader.lua")

    -----------UI---------------------
    dofile("src/ui_loader.lua")

end


-- Quitting
function love.quit()
end


-- Resizing
function love.resize()
    
    -- Changing the scales for graphics / display
    global_informations.current_scale_x = love.graphics.getWidth() / base_width
    global_informations.current_scale_y = love.graphics.getHeight() / base_height

    -- Update informations
    CCC_SceneManager:resize(global_informations)

end 


-- Mouse button pressed
function love.mousepressed(x, y, button, istouch, presses)
    print("mouse click : ( x="..x..", y="..y..")")
    CCC_SceneManager:mousepressed(x, y, button, istouch, presses, global_informations)
end


-- Text input
function love.textinput(t)
    print("Text Input : "..t)
    CCC_SceneManager:textinput(t)
end


-- Inputs
function love.keypressed(key)
    print("Key pressed : "..key)
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
