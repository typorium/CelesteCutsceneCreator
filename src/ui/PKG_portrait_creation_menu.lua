--------------------------
-- MAIN MENU
--------------------------

-- Frame
menu_PKG_portrait_creation_scene = Scene.init()

-- Background
menu_PKG_portrait_creation_background = Image.init()
menu_PKG_portrait_creation_background:set_position(0, 0)
menu_PKG_portrait_creation_background:set_image("assets/images/menus/PKG_portrait_creation/background.png")
menu_PKG_portrait_creation_scene:add_child(menu_PKG_portrait_creation_background)

-- Path for portrait
-- Rectangle
margin = 30
menu_PKG_portrait_creation_imagepath_rectangle = Rectangle.init()
menu_PKG_portrait_creation_imagepath_rectangle:set_position(margin, margin)
menu_PKG_portrait_creation_imagepath_rectangle:set_type("fill")
menu_PKG_portrait_creation_imagepath_rectangle:set_corner_radius(10, 10)
menu_PKG_portrait_creation_imagepath_rectangle:set_size(
    love.graphics.getWidth() - 2 * margin,
    150
)
menu_PKG_portrait_creation_scene:add_child(menu_PKG_portrait_creation_imagepath_rectangle)

-- Label
menu_PKG_portrait_creation_imagepath_label = Label.init()
menu_PKG_portrait_creation_imagepath_label:set_text("Path to images :")
menu_PKG_portrait_creation_imagepath_label:set_font("assets/fonts/renogare_regular.otf", 30)
menu_PKG_portrait_creation_imagepath_label:set_position(margin + 20, margin + 10)
menu_PKG_portrait_creation_scene:add_child(menu_PKG_portrait_creation_imagepath_label)

-- Textbox
offset_y = 60
margin_x = 20
margin_y = 40
menu_PKG_portrait_creation_imagepath_textbox = Textbox.init()
menu_PKG_portrait_creation_imagepath_textbox:set_position(
    margin + margin_x,
    offset_y + margin
)
menu_PKG_portrait_creation_imagepath_textbox:set_color({1, 1, 1})
menu_PKG_portrait_creation_imagepath_textbox:set_font("assets/fonts/renogare_regular.otf", 50)
menu_PKG_portrait_creation_imagepath_textbox:set_corner_radius(10, 10)
menu_PKG_portrait_creation_imagepath_textbox:set_size(
    menu_PKG_portrait_creation_imagepath_rectangle.width - 2 * margin_x,
    menu_PKG_portrait_creation_imagepath_rectangle.height - 2 * margin_y
)
menu_PKG_portrait_creation_scene:add_child(menu_PKG_portrait_creation_imagepath_textbox)