-- read from standard input

local lineCount = 0
for line in io.lines() do
    local num1 = line:match("(%d+)%s+(%d+)")
    lineCount = lineCount + 1
    print(line)
end
print("Lines:", lineCount)

-- create two tables
--
-- sort two tables separately
--
-- diff each row, creating a new table
--
-- add all rows of table 3
