--------------------------
-- NEW CUTSCENE PACKAGE
--------------------------

-- Frame
menu_NCP_scene = Scene.init()

-- Background
menu_NCP_background = Image.init()
menu_NCP_background:set_position(0, 0)
menu_NCP_background:set_image("assets/images/menus/NCP/background.png")
menu_NCP_scene:add_child(menu_NCP_background)

-- Title
menu_NCP_title = WrappedLabel.init()
menu_NCP_title:set_text({ {0, 0, 0}, "New Cutscene Package"})
menu_NCP_title:set_font("assets/fonts/renogare_regular.otf", 100)
menu_NCP_title:set_alignement("center")
menu_NCP_title:set_maxwidth(830)
menu_NCP_title:set_position(550, 200)
menu_NCP_scene:add_child(menu_NCP_title)

-- Configs
-- Rectangle
menu_NCP_pkg_blackrectangle = Rectangle.init()
menu_NCP_pkg_blackrectangle:set_color({0, 0, 0})
menu_NCP_pkg_blackrectangle:set_position(610, 500)
menu_NCP_pkg_blackrectangle:set_corner_radius(15, 15)
menu_NCP_pkg_blackrectangle:set_type("fill")
menu_NCP_pkg_blackrectangle:set_size(700, 370)
menu_NCP_scene:add_child(menu_NCP_pkg_blackrectangle)

-- Name Label
menu_NCP_pkg_name_label = Label.init()
menu_NCP_pkg_name_label:set_text( {{1, 1, 1}, "Name :"} )
menu_NCP_pkg_name_label:set_font("assets/fonts/renogare_regular.otf", 50)
menu_NCP_pkg_name_label:set_position(640, 530)
menu_NCP_scene:add_child(menu_NCP_pkg_name_label)

-- Project already exists (PAE) alert
menu_NCP_pkg_name_PAE_label = Label.init()
menu_NCP_pkg_name_PAE_label:set_text("")
menu_NCP_pkg_name_PAE_label:set_font("assets/fonts/renogare_regular.otf", 20)
menu_NCP_pkg_name_PAE_label:set_position(640, 660)
menu_NCP_scene:add_child(menu_NCP_pkg_name_PAE_label)


-- Name Input
menu_NCP_pkg_name_input = Textbox.init()
menu_NCP_pkg_name_input:set_color({1, 1, 1})
menu_NCP_pkg_name_input:set_font("assets/fonts/renogare_regular.otf", 40)
menu_NCP_pkg_name_input:set_position(640, 600)
menu_NCP_pkg_name_input:set_size(500, 50)
menu_NCP_pkg_name_input:set_corner_radius(5, 5)
menu_NCP_pkg_name_input.update = function()

    -- Checks if a projects already exists
    local file = io.open("projects/"..menu_NCP_pkg_name_input:get_text()..".celestepkg", "r")
    if file ~= nil then
        io.close(file)
        menu_NCP_pkg_name_PAE_label:set_text( {{1, 1, 1}, "A project with this name already exists.\nClicking ", {1, 0, 0}, "create", {1, 1, 1}, " will erase it!"} )
        return
    end
    menu_NCP_pkg_name_PAE_label:set_text("")

end
menu_NCP_scene:add_child(menu_NCP_pkg_name_input)


-- Create button
-- Image
menu_NCP_create_button_image = Image.init()
menu_NCP_create_button_image:set_image("assets/images/menus/NCP/create_button.png")
menu_NCP_create_button_image:set_position(0, 720)
menu_NCP_create_button_image:centerx()
menu_NCP_scene:add_child(menu_NCP_create_button_image)

-- Button/Detector
menu_NCP_create_button_button = Button.init()
menu_NCP_create_button_button:set_position(
    menu_NCP_create_button_image.x,
    menu_NCP_create_button_image.y
)
menu_NCP_create_button_button:set_size(
    menu_NCP_create_button_image.width,
    menu_NCP_create_button_image.height
)
menu_NCP_create_button_button:set_event(function()

    --Creates file or 
    local file = io.open("projects/"..menu_NCP_pkg_name_input:get_text()..".celestepkg", "w")
    io.close(file)

    -- Sets new menu active
    CCC_SceneManager:set_active("menu_PKG_master")

end)
menu_NCP_scene:add_child(menu_NCP_create_button_button)