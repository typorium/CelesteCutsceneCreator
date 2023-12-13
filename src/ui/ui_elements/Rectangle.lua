--------------------------
-- CLASS
--------------------------
Rectangle = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function Rectangle.set_size(self, width, height)
    self.width = width
    self.height = height
end


function Rectangle.set_position(self, x, y)
    self.x = x
    self.y = y
end


function Rectangle.set_color(self, color)
    self.color = color
end


function Rectangle.set_type(self, type)
    self.type = type
end


function Rectangle.set_corner_radius(self, rx, ry)
    self.rx, self.ry = rx, ry
end


--------------------------
-- GENERAL METHODS
--------------------------
function Rectangle.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function Rectangle.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function Rectangle.draw(self)
    love.graphics.setColor(self.color)
    love.graphics.rectangle(self.type, self.x, self.y, self.width, self.height, self.rx, self.ry)
    love.graphics.setColor({1, 1, 1})
end


function Rectangle.resize(self, args)
end


function Rectangle.textinput(self, t)
end


function Rectangle.keypressed(self, key)
end


function Rectangle.update(self, dt, args)
end


function Rectangle.mousepressed(self, x, y, button, istouch, presses, args)
end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function Rectangle.init()
    local self = setmetatable({}, { __index = Rectangle })

    -- Position
    self.x = 0
    self.y = 0

    -- Size
    self.width = 0
    self.height = 0

    -- Others
    self.color = {0, 0, 0}
    self.type = "line"
    self.rx = 0
    self.ry = 0

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return Rectangle