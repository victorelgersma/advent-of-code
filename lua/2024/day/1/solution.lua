-- usage: cat input | lua solution.lua


-- read from standard input
-- populate two tables

table1= {}
table2= {}

for line in io.lines() do
    local left = string.sub(line, 1, 5)
    local right = string.sub(line, 8, 13)
    table.insert(table1, tonumber(left))
    table.insert(table2, tonumber(right))
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

-- sum diffs

local sum = 0
for i = 1, #diffs do
    sum = sum + diffs[i]
end

print("answer to part 1")
print(sum)


-- PART 2 -- 

local score = 0 

for k,v in ipairs(table1) do
    local count = 0 
    for i,j in ipairs(table2) do 
        if v == j then 
            count = count + 1
        end
    end
    print('found', count, 'elements')
    score = score + count * v
end

print("answer to part 2")
print(score)
