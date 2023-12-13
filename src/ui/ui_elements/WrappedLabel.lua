function tprint (tbl, indent)
    if not indent then indent = 0 end
    local toprint = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2 
    for k, v in pairs(tbl) do
      toprint = toprint .. string.rep(" ", indent)
      if (type(k) == "number") then
        toprint = toprint .. "[" .. k .. "] = "
      elseif (type(k) == "string") then
        toprint = toprint  .. k ..  "= "   
      end
      if (type(v) == "number") then
        toprint = toprint .. v .. ",\r\n"
      elseif (type(v) == "string") then
        toprint = toprint .. "\"" .. v .. "\",\r\n"
      elseif (type(v) == "table") then
        toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
      else
        toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
      end
    end
    toprint = toprint .. string.rep(" ", indent-2) .. "}"
    return toprint
  end

--------------------------
-- CLASS
--------------------------
WrappedLabel = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function WrappedLabel.set_text(self, given_text)
    self.text = given_text
end


function WrappedLabel.set_maxwidth(self, maxwidth)
    self.maxwidth = maxwidth
end


function WrappedLabel.set_position(self, x, y)
    self.x = x
    self.y = y
end


function WrappedLabel.set_font(self, font, font_size)
    self.font = love.graphics.newFont(font, font_size)
end


function WrappedLabel.set_alignement(self, align)
    self.align = align
end


--------------------------
-- GENERAL METHODS
--------------------------
function WrappedLabel.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function WrappedLabel.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function WrappedLabel.draw(self)
    love.graphics.printf(self.text, self.font, self.x, self.y, self.maxwidth, self.align)
end


function WrappedLabel.resize(self, args)
end


function WrappedLabel.update(self, dt, args)
end


function WrappedLabel.textinput(self, t)
end


function WrappedLabel.keypressed(self, key)
end


function WrappedLabel.mousepressed(self, x, y, button, istouch, presses, args)
end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function WrappedLabel.init()
    local self = setmetatable({}, { __index = WrappedLabel })

    -- Label specifics
    self.text = ""
    self.font = love.graphics.getFont()
    self.x = 0
    self.y = 0
    self.maxwidth = 200
    self.align = "left"

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return WrappedLabel