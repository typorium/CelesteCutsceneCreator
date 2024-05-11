--------------------------
-- CLASS
--------------------------
Textbox = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function Textbox.set_text(self, text)
    self.text_data = text
    print(self.text_data)
    self.text:set(self.text_data)
end


function Textbox.set_size(self, w, h)

    -- Width
    self.detect_width = w
    self.width = w
    if w < 20 then
        self.width = 20
        self.detect_width = 20
    end
    self.detect_init_width = self.detect_width

    -- Height
    self.height = h
    self.detect_height = h
    if h < 10 then
        self.height = h
        self.detect_height = 10
    end
    self.detect_init_height = self.detect_height
end


function Textbox.set_position(self, x, y)
    -- X
    self.x = x
    self.detect_x = x
    self.detect_init_x = x

    -- Y
    self.y = y
    self.detect_y = y
    self.detect_init_y = y
end


function Textbox.set_font(self, font, font_size)
    self.text:setFont(love.graphics.newFont(font, font_size))
end


function Textbox.set_color(self, color)
    self.text_color = color
end


function Textbox.set_corner_radius(self, rx, ry)
    self.rx, self.ry = rx, ry
end


function Textbox.get_text(self)
    return self.text_data
end


function Textbox.set_textinput_event(self, event)
    self.textinput_event = event
end


function Textbox.set_textdelete_event(self, event)
    self.textdelete_event = event
end


--------------------------
-- GENERAL METHODS
--------------------------
function Textbox.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function Textbox.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function Textbox.draw(self)

    love.graphics.setScissor(self.detect_x, self.detect_y, self.detect_width, self.detect_height)

    -- Rectangle
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.rx, self.ry)

    -- Text rendering
    offset = self.width - self.text:getWidth() - 5
    if offset > 0 then
        offset = 0
    end
    love.graphics.setColor(self.text_color)
    love.graphics.draw(self.text, self.x + offset, self.y)

    -- Highlightbar
    if self.has_focus then
        if self.highlightbar_shown then

            x_bar = self.x + self.text:getWidth() + offset

            love.graphics.setColor({1, 1, 1})
            love.graphics.line(
                x_bar,
                self.y + 2,

                x_bar,
                self.y + self.height - 2
            )
        end
    end


    -- Reset
    love.graphics.setScissor( )
    love.graphics.setColor({1, 1, 1})
end


function Textbox.resize(self, args)
    -- Gets original position and size and multiply them by current scale
    self.detect_x = self.detect_init_x * args.current_scale_x
    self.detect_width = self.detect_init_width * args.current_scale_x

    self.detect_y = self.detect_init_y * args.current_scale_y
    self.detect_height = self.detect_init_height * args.current_scale_y
end


function Textbox.update(self, dt, args)
    -- Checks if the highlightbar should be shown or not
    self.highlightbar_shown_frame = self.highlightbar_shown_frame + 1
    if self.highlightbar_shown_frame == self.highlightbar_shown_framemax then
        self.highlightbar_shown_frame = 0
        self.highlightbar_shown = not self.highlightbar_shown
    end
end


function Textbox.textinput(self, t)

    -- Add to text
    if not string.match( t, INPUT_ACCEPTED_CHARACTERS ) then
        return
    end
    self:set_text(self.text_data..t)
    self.textinput_event(self)
end


function Textbox.keypressed(self, key)

    -- Checks if CTRL is down (shortcut purposes)
    if self.has_focus then

        -- CTRL+V : Paste
        if love.keyboard.isDown(KEY_LCTRL_ID) and key == KEY_V then
            return
        end
    end

    -- If has focus and backpress
    if self.has_focus and key == "backspace" then

        -- If text data empty, return
        if #self.text_data == 0 then
            return
        end

        -- Else, remove last character
        self.text_data = self.text_data:sub(1, -2)
        self:set_text(self.text_data)
        self.textdelete_event(self)
    end

end


function Textbox.mousepressed(self, x, y, button, istouch, presses, args)

    -- If left click
    if button == 1 then

        -- If click on textbox, focus, else, don't
        self.has_focus = false
        if self.detect_x <= x and x <= self.detect_x + self.detect_width then
            if self.detect_y <= y and y <= self.detect_y + self.detect_height then
                self.highlightbar_shown = true
                self.highlightbar_shown_frame = 0
                self.has_focus = true
            end
        end
    end

end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function Textbox.init()
    local self = setmetatable({}, { __index = Textbox })

    -- Others
    self.has_focus = false
    self.highlightbar_shown_framemax = 30
    self.highlightbar_shown_frame = 0
    self.highlightbar_shown = true

    -- Position
    self.detect_init_x = 0
    self.detect_init_y = 0
    self.detect_x = 0
    self.detect_y = 0

    self.x = 0
    self.y = 0
    
    -- Size
    self.detect_init_width = 80
    self.detect_init_height = 20
    self.detect_width = 80
    self.detect_height = 20

    self.width = 30
    self.height = 30
    
    -- Rectangle corners
    self.rx = 0
    self.ry = 0

    -- Text
    self.color = {0.2, 0.2, 0.2}

    self.text_color = {0, 0, 0}
    self.text_data = ""
    self.text = love.graphics.newText(love.graphics.getFont(), {self.text_color, self.text_data})

    -- Events
    self.textinput_event = function(self) end
    self.textdelete_event = function(self) end
    
    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return Textbox