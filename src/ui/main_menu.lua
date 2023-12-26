--------------------------
-- MAIN MENU
--------------------------
-- Frame
menu_main_scene = Scene.init()


-- Background
menu_main_background = Image.init()
menu_main_background:set_image("assets/images/menus/main/background.png")
menu_main_background:set_position(0, 0)
menu_main_scene:add_child(menu_main_background)


-- App title
menu_main_title = Image.init()
menu_main_title:set_image("assets/images/menus/main/big_title.png")
menu_main_title:set_position(100, 0)
menu_main_scene:add_child(menu_main_title)


-- Buttons : Explanations
-- Rectangle
margin = 10
menu_main_buttons_explanations = Rectangle.init()
menu_main_buttons_explanations:set_position(750, 400)
menu_main_buttons_explanations:set_size(
    love.graphics.getWidth() - menu_main_buttons_explanations.x - margin,
    love.graphics.getHeight() - menu_main_buttons_explanations.y - margin
)
menu_main_buttons_explanations:set_color({0, 0, 0})
menu_main_buttons_explanations:set_type("fill")
menu_main_buttons_explanations:set_corner_radius(10, 10)
menu_main_scene:add_child(menu_main_buttons_explanations)

-- WrappedLabel
menu_main_buttons_explanations_text = WrappedLabel.init()
menu_main_buttons_explanations_text:set_position(
    menu_main_buttons_explanations.x + 20,
    menu_main_buttons_explanations.y + 20
)
menu_main_buttons_explanations_text:set_font("assets/fonts/renogare_regular.otf", 50)
menu_main_buttons_explanations_text:set_maxwidth(
    menu_main_buttons_explanations.width - 40
)
menu_main_buttons_explanations_text:set_text("")
menu_main_scene:add_child(menu_main_buttons_explanations_text)


-- Button : New cutscene package (NCP)
-- Image
menu_main_NCPbutton_image = Image.init()
menu_main_NCPbutton_image:set_image("assets/images/menus/main/create_new_package_button.png")
menu_main_NCPbutton_image:set_position(
    menu_main_title.x,
    400
)

menu_main_scene:add_child(menu_main_NCPbutton_image)

-- Button
menu_main_NCPbutton_button = Button.init()
menu_main_NCPbutton_button:set_position(
    menu_main_NCPbutton_image.x,
    menu_main_NCPbutton_image.y
)
menu_main_NCPbutton_button:set_size(
    menu_main_NCPbutton_image.width,
    menu_main_NCPbutton_image.height
)
menu_main_NCPbutton_button.update = function()

    -- Other variables
    local is_inbound = false
    local mousex, mousey = love.mouse.getPosition()

    -- Checks if mouse is inbound of image
    if menu_main_NCPbutton_button.x <= mousex and mousex <= menu_main_NCPbutton_button.x + menu_main_NCPbutton_button.width then
        if menu_main_NCPbutton_button.y <= mousey and mousey <= menu_main_NCPbutton_button.y + menu_main_NCPbutton_button.height then
            menu_main_buttons_explanations_text:set_text(
                {{1, 1, 1}, "Creates a cutscene package.\n\nTheorically, one package", {1, 0, 0}, " should ", {1, 1, 1}, "be enough for a whole map, or mod.\n\n(At least, that's the goal...)"}
            )
            is_inbound = true
        end
    end

    -- If not inbound
    if not is_inbound then
        menu_main_buttons_explanations_text:set_text("")
    end
end

menu_main_NCPbutton_button:set_event(function() CCC_SceneManager:set_active("menu_NCP") end)
menu_main_scene:add_child(menu_main_NCPbutton_button)