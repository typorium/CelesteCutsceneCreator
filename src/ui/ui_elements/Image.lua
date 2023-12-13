--------------------------
-- CLASS
--------------------------
Image = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function Image.set_image(self, image)
    self.image = love.graphics.newImage(image)
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end


function Image.set_position(self, x, y)
    self.x = x
    self.y = y
end


function Image.set_visibility(self, is_visible)
    self.visible = is_visible
end


function Image.centerx(self)
    self.set_position(
        self,
        1 / 2 * ( love.graphics.getWidth() - self.width ),
        self.y
    )
end


--------------------------
-- GENERAL METHODS
--------------------------
function Image.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function Image.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function Image.draw(self)
    if self.visible then
        love.graphics.draw(self.image, self.x, self.y)
    end
end


function Image.update(self, dt, args)
end


function Image.textinput(self, t)
end


function Image.keypressed(self, key)
end


function Image.resize(self, args)
end


function Image.mousepressed(self, x, y, button, istouch, presses, args)
end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function Image.init()
    local self = setmetatable({}, { __index = Image })

    -- Image specifics
    self.image = nil
    self.x = 0
    self.y = 0
    self.width = 0
    self.height = 0
    self.visible = true

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return Image