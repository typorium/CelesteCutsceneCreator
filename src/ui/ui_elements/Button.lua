--------------------------
-- CLASS
--------------------------
Button = {}


--------------------------
-- CLASS SPECIFIC METHODS
--------------------------
function Button.set_size(self, width, height)

    -- Setting up inital size
    if self.init_width == nil then
        self.init_width = width
    end
    if self.init_height == nil then
        self.init_height = height
    end

    -- Changing current size
    self.width = width
    self.height = height
end


function Button.set_position(self, x, y)

    -- Setting up inital position
    if self.init_x == nil then
        self.init_x = x
    end
    if self.init_y == nil then
        self.init_y = y
    end
    
    -- Changing current position
    self.x = x
    self.y = y
end


function Button.set_event(self, event)
    self.event = event
end


--------------------------
-- GENERAL METHODS
--------------------------
function Button.get_custom_attribute(self, key)
    return self.custom_attributes[key]
end


function Button.add_custom_attribute(self, key, value)
    self.custom_attributes[key] = value
end


function Button.draw(self)
end


function Button.textinput(self, t)
end


function Button.keypressed(self, key)
end


function Button.resize(self, args)
    -- Gets original position and size and multiply them by current scale
    self.x = self.init_x * args.current_scale_x
    self.width = self.init_width * args.current_scale_x

    self.y = self.init_y * args.current_scale_y
    self.height = self.init_height * args.current_scale_y
end


function Button.update(self, dt, args)
end


function Button.mousepressed(self, x, y, button, istouch, presses, args)

    -- If left click
    if button == 1 then

        -- If click on button
        if self.x <= x and x <= self.x + self.width then
            if self.y <= y and y <= self.y + self.height then

                -- Do button event
                self.event()
            end
        end
    end

end


--------------------------
-- RETURN CLASS OBJECT
--------------------------
function Button.init()
    local self = setmetatable({}, { __index = Button })

    -- Position
    self.x = nil
    self.y = nil
    self.init_x = nil
    self.init_y = nil

    -- Size
    self.width = nil
    self.height = nil
    self.init_width = nil
    self.init_height = nil

    -- Clicking
    self.event = function() end
    self.clicked = false

    -- Custom Attributes
    self.custom_attributes = {}

    return self
end


return Button