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