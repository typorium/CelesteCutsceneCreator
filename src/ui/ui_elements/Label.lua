--------------------------
-- CLASS
--------------------------
Label = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function Label.set_text(self, text)
    self.text:set(text)
end


function Label.set_position(self, x, y)
    self.x = x
    self.y = y
end


function Label.set_font(self, font, font_size)
    self.text:setFont(love.graphics.newFont(font, font_size))
end


function Label.centerx(self)
    self.set_position(
        self,
        1 / 2 * ( love.graphics.getWidth() - self.text:getWidth() ),
        self.y
    )
end


--------------------------
-- GENERAL METHODS
--------------------------
function Label.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function Label.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function Label.draw(self)
    love.graphics.draw(self.text, self.x, self.y)
end


function Label.resize(self, args)
end


function Label.update(self, dt, args)
end


function Label.textinput(self, t)
end


function Label.keypressed(self, key)
end


function Label.mousepressed(self, x, y, button, istouch, presses, args)
end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function Label.init()
    local self = setmetatable({}, { __index = Label })

    -- Label specifics
    self.text = love.graphics.newText(love.graphics.getFont(), {{1, 1, 1}, ""})
    self.x = 0
    self.y = 0

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return Label