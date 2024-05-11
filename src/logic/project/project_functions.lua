-- Creates a project file based off given name
function project_create_file(name)
    success, message = love.filesystem.write("projects/"..name..".celestepkg", "")
end


-- Checks if project already exists
function project_exists(name)
    return love.filesystem.exists("projects/"..name..".celestepkg")
end