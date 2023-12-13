--------------------------
-- CLASS
--------------------------

-- Basically a frame, bundle of multiple UI elements
Scene = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function Scene.add_child(self, child_element)
    
    -- Add to self.children an element accessed by self.children[#self.children + 1] (+1 bc lua's has a bitch-ass indexing or smthg that start with 1 instd of 0)
    element_index = #self.children
    self.children[element_index + 1] = child_element

end


--------------------------
-- GENERAL METHODS
--------------------------
function Scene.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function Scene.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function Scene.draw(self, args)
    for child_key, child in ipairs(self.children) do
        child:draw(args)
    end
end


function Scene.resize(self, args)
    for child_key, child in ipairs(self.children) do
        child:resize(args)
    end
end


function Scene.update(self, dt, args)
    for child_key, child in ipairs(self.children) do
        child:update(dt, args)
    end
end


function Scene.textinput(self, t)
    for child_key, child in ipairs(self.children) do
        child:textinput(t)
    end
end


function Scene.keypressed(self, key)
    for child_key, child in ipairs(self.children) do
        child:keypressed(key)
    end
end


function Scene.mousepressed(self, x, y, button, istouch, presses, args)
    for child_key, child in ipairs(self.children) do
        child:mousepressed(x, y, button, istouch, presses, args)
    end
end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function Scene.init()
    local self = setmetatable({}, { __index = Scene })

    -- Scene attributes
    self.children = {}

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return Scene