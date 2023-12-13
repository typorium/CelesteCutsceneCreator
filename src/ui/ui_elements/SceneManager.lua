--------------------------
-- CLASS
--------------------------

-- Basically a menu/current active menu etc. Bundle of multiple UI elements
SceneManager = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function SceneManager.set_active(self, scene)
    self.active = self.scenes[scene]
end


function SceneManager.add_scene(self, scene, name)
    self.scenes[name] = scene
end


--------------------------
-- GENERAL METHODS
--------------------------
function SceneManager.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function SceneManager.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function SceneManager.draw(self, args)
    self.active:draw(args)
end


function SceneManager.resize(self, args)
    for index, scene in pairs(self.scenes) do
        scene:resize(args)
    end
end


function SceneManager.update(self, dt, args)
    self.active:update(dt, args)
end


function SceneManager.textinput(self, t)
    self.active:textinput(t)
end


function SceneManager.keypressed(self, key)
    self.active:keypressed(key)
end


function SceneManager.mousepressed(self, x, y, button, istouch, presses, args)
    self.active:mousepressed(x, y, button, istouch, presses, args)
end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function SceneManager.init()
    local self = setmetatable({}, { __index = SceneManager })

    -- Scene attributes
    self.active = nil
    self.scenes = {}

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return SceneManager