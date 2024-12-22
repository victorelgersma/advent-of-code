
-- see if the file exists
function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

-- get all lines from a file 
--
--
--
print(file_exists('./input'))

local lines = io.lines('./input')
print(lines)
