--------------------------
-- MAIN MENU
--------------------------

-- Frame
menu_PKG_master_scene = Scene.init()

-- Background
menu_PKG_master_background = Image.init()
menu_PKG_master_background:set_image("assets/images/menus/PKG_master/background.png")
menu_PKG_master_background:set_position(0, 0)
menu_PKG_master_scene:add_child(menu_PKG_master_background)

-- Portraits
-- Create portrait button
-- Rectangle
margin = 20
menu_PKG_master_portrait_create_rectangle = Rectangle.init()
menu_PKG_master_portrait_create_rectangle:set_position(10, 20)
menu_PKG_master_portrait_create_rectangle:set_size(
    love.graphics.getWidth() / 3 - margin,
    200
)
menu_PKG_master_portrait_create_rectangle:set_color({0, 0, 0})
menu_PKG_master_portrait_create_rectangle:set_type("fill")
menu_PKG_master_portrait_create_rectangle:set_corner_radius(10, 10)
menu_PKG_master_scene:add_child(menu_PKG_master_portrait_create_rectangle)

-- Image
menu_PKG_master_portrait_create_image = Image.init()
menu_PKG_master_portrait_create_image:set_position(20, 30)
menu_PKG_master_portrait_create_image:set_image("assets/images/menus/PKG_master/create_portrait_image.png")
menu_PKG_master_portrait_create_image:set_corner_radius(10, 10)
menu_PKG_master_scene:add_child(menu_PKG_master_portrait_create_image)

-- Text
menu_PKG_master_portrait_create_label = Label.init()
menu_PKG_master_portrait_create_label:set_text("New portrait")
menu_PKG_master_portrait_create_label:set_font("assets/fonts/renogare_regular.otf", 50)
menu_PKG_master_portrait_create_label:set_position(240, 80)
menu_PKG_master_scene:add_child(menu_PKG_master_portrait_create_label)

-- Button detector
menu_PKG_master_portrait_create_button = Button.init()
menu_PKG_master_portrait_create_button:set_position(10, 20)
menu_PKG_master_portrait_create_button:set_size(
    menu_PKG_master_portrait_create_rectangle.width,
    menu_PKG_master_portrait_create_rectangle.height
)
menu_PKG_master_portrait_create_button.update = function()
    
    -- Checks if in bound
    local in_bound = false
    local mousex, mousey = love.mouse.getPosition()

    if menu_PKG_master_portrait_create_button.x <= mousex and mousex <= menu_PKG_master_portrait_create_button.x + menu_PKG_master_portrait_create_button.width then
        if menu_PKG_master_portrait_create_button.y <= mousey and mousey <= menu_PKG_master_portrait_create_button.y + menu_PKG_master_portrait_create_button.height then

            -- Update text
            menu_PKG_master_portrait_create_label:set_text({{0.6, 0.6, 0.6}, "New portrait"})
            in_bound = true

        end
    end

    -- If not inbound
    if not in_bound then
        menu_PKG_master_portrait_create_label:set_text({{1, 1, 1}, "New portrait"})
    end

end
menu_PKG_master_portrait_create_button:set_event(function() CCC_SceneManager:set_active("menu_PKG_portrait_creation") end)
menu_PKG_master_scene:add_child(menu_PKG_master_portrait_create_button)