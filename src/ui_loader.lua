--------------------------
-- UI ELEMENTS
--------------------------

-- Shapes
Rectangle = require("src.ui.ui_elements.Rectangle")

-- Labels
Label = require("src.ui.ui_elements.Label")
WrappedLabel = require("src.ui.ui_elements.WrappedLabel")

-- User Inputs
Textbox = require("src.ui.ui_elements.Textbox")

-- Images
Image = require("src.ui.ui_elements.Image")

-- Detectors
Button = require("src.ui.ui_elements.Button")

-- Frame related
Scene = require("src.ui.ui_elements.Scene")
SceneManager = require("src.ui.ui_elements.SceneManager")


--------------------------
-- UI
--------------------------
dofile("src/ui/main_menu.lua")
dofile("src/ui/new_cutscene_package_menu.lua")
dofile("src/ui/PKG_master_menu.lua")
dofile("src/ui/PKG_portrait_creation_menu.lua")


--------------------------
-- SCENE MANAGER
--------------------------
CCC_SceneManager = SceneManager.init()

CCC_SceneManager:add_scene(menu_NCP_scene, "menu_NCP")
CCC_SceneManager:add_scene(menu_main_scene, "menu_main")
CCC_SceneManager:add_scene(menu_PKG_master_scene, "menu_PKG_master")
CCC_SceneManager:add_scene(menu_PKG_portrait_creation_scene, "menu_PKG_portrait_creation")

CCC_SceneManager:set_active("menu_main")