-- usage: cat input | lua solution.lua



-- read from standard input
-- populate two tables

table1= {}
table2= {}

for line in io.lines() do
    local word1 = string.sub(line, 1, 5)
    local word2 = string.sub(line, 8, 13)
    table.insert(table1, tonumber(word1))
    table.insert(table2, tonumber(word2))
end

-- sort two tables separately

table.sort(table1)
table.sort(table2)

-- diff each row, creating a new table

local diffs = {}

local maxLength = math.max(#table1, #table2)


for i=1, maxLength do
    table.insert(diffs, math.abs(-table1[i]+table2[i]))
end

print(table.concat(diffs, '\n'))

-- sum diffs

local sum = 0
for i = 1, #diffs do
    sum = sum + diffs[i]
end

print('\n', 'total sum: ', sum)
