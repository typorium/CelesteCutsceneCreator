--------------------------
-- NECESSITIES
--------------------------

-- Checks if the project folder exists
if not love.filesystem.exists("projects") then
    love.filesystem.createDirectory("projects")
end


--------------------------
-- UTILITIES
--------------------------
dofile("src/logic/project/project_functions.lua")