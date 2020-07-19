---
--- Array v0.1 by yangruihan
--- See https://github.com/RayStudio36/array.lua for usage documentation.
--- Licensed under MIT.
--- See https://opensource.org/licenses/MIT for details.
---



_ENV = require('test.lunity')('array test')


local Array = require('array')


function test:before()
end


function test:after()
end


function test:create_arr()
    local new_arr = Array()
    assertEqual(new_arr:size(), 0)
end


function test:create_arr2()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)
end


function test:tostring()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)
    assertEqual(tostring(new_arr), '[1: 1, 2: 2, 3: 3]')
end


function test:clone()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)

    local ret = new_arr:clone()
    assertEqual(ret:size(), 3)
    assertEqual(ret:get(1), 1)
    assertEqual(ret:get(2), 2)
    assertEqual(ret:get(3), 3)
end


function test:is_empty()
    local new_arr = Array()
    assertTrue(new_arr:is_empty())
end


function test:is_empty2()
    local new_arr = Array()
    new_arr:push(1)
    new_arr:pop()
    assertTrue(new_arr:is_empty())
end


function test:size()
    local new_arr = Array()
    assertEqual(new_arr:size(), 0)
    new_arr:push(1)
    assertEqual(new_arr:size(), 1)
    new_arr:push(2)
    assertEqual(new_arr:size(), 2)
    new_arr:remove_at(1)
    assertEqual(new_arr:size(), 1)
    new_arr:pop()
    assertEqual(new_arr:size(), 0)
end


function test:get()
    local new_arr = Array()
    new_arr:push(1)
    assertEqual(new_arr:get(1), 1)
    new_arr:add(2)
    assertEqual(new_arr:get(2), 2)
end


function test:get2()
    local new_arr = Array()
    new_arr:push(1)
    assertEqual(new_arr[1], 1)
    new_arr:add(2)
    assertEqual(new_arr[2], 2)
end


function test:set()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)

    new_arr:set(1, 4)
    new_arr:set(2, 5)
    new_arr:set(3, 6)
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 4)
    assertEqual(new_arr:get(2), 5)
    assertEqual(new_arr:get(3), 6)
end


function test:set2()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)

    new_arr[1] = 4
    new_arr[2] = 5
    new_arr[3] = 6
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 4)
    assertEqual(new_arr:get(2), 5)
    assertEqual(new_arr:get(3), 6)
end


function test:add()
    local new_arr = Array()
    new_arr:add(1)
    new_arr:add(2)
    new_arr:add(3)
    assertEqual(new_arr:size(), 3)

    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)
end


function test:insert()
    local new_arr = Array()
    new_arr:insert(1, 'hello')
    new_arr:insert(1, 'world')
    new_arr:insert(1, '!')
    assertEqual(new_arr:size(), 3)

    assertEqual(new_arr:get(3), 'hello')
    assertEqual(new_arr:get(2), 'world')
    assertEqual(new_arr:get(1), '!')
end


function test:push()
    local new_arr = Array()
    new_arr:push(1)
    new_arr:push(2)
    new_arr:push(3)
    assertEqual(new_arr:size(), 3)

    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)
end


function test:remove()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:remove(4)
    assertEqual(new_arr:size(), 3)

    new_arr:remove(2)
    assertEqual(new_arr:size(), 2)
    assertEqual(new_arr:get(2), 3)

    new_arr:remove(1)
    assertEqual(new_arr:size(), 1)
    assertEqual(new_arr:get(1), 3)
end


function test:remove_at()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:remove_at(2)
    assertEqual(new_arr:size(), 2)
    assertEqual(new_arr:get(2), 3)

    new_arr:remove_at(1)
    assertEqual(new_arr:size(), 1)
    assertEqual(new_arr:get(1), 3)
end


function test:pop()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:pop()
    assertEqual(new_arr:size(), 2)
    new_arr:pop()
    assertEqual(new_arr:size(), 1)
    new_arr:pop()
    assertEqual(new_arr:size(), 0)
end


function test:index_of()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    assertEqual(new_arr:index_of(1), 1)
    assertEqual(new_arr:index_of(2), 2)
    assertEqual(new_arr:index_of(3), 3)
end


function test:slice()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    local sliced_arr = new_arr:slice(2)
    assertEqual(sliced_arr:size(), 2)
    assertEqual(sliced_arr:get(1), 2)
    assertEqual(sliced_arr:get(2), 3)
end


function test:sliced()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:sliced(2)
    assertEqual(new_arr:size(), 2)
    assertEqual(new_arr:get(1), 2)
    assertEqual(new_arr:get(2), 3)
end


function test:reverse()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    local reversed_arr = new_arr:reverse()
    assertEqual(reversed_arr:size(), 3)
    assertEqual(reversed_arr:get(1), 3)
    assertEqual(reversed_arr:get(2), 2)
    assertEqual(reversed_arr:get(3), 1)
end


function test:reversed()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:reversed()
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 3)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 1)
end


function test:first()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    assertEqual(new_arr:first(), 1)
end


function test:last()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    assertEqual(new_arr:last(), 3)
end


function test:map()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    local mapped_arr = new_arr:map(function (item, index)
        return item + index
    end)
    assertEqual(mapped_arr:size(), 3)
    assertEqual(mapped_arr:get(1), 2)
    assertEqual(mapped_arr:get(2), 4)
    assertEqual(mapped_arr:get(3), 6)
end


function test:mapped()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:mapped(function (item, index)
        return item + index
    end)
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 2)
    assertEqual(new_arr:get(2), 4)
    assertEqual(new_arr:get(3), 6)
end


function test:filter()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    local filtered_arr = new_arr:filter(function (item, index)
        return index % 2 == 0
    end)
    assertEqual(filtered_arr:size(), 1)
    assertEqual(filtered_arr:get(1), 2)
end


function test:filtered()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    new_arr:filtered(function (item, index)
        return index % 2 == 0
    end)
    assertEqual(new_arr:size(), 1)
    assertEqual(new_arr:get(1), 2)
end


function test:reduce()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    local ret = new_arr:reduce(function (a, b)
        return a + b
    end)
    assertEqual(ret, 6)
end


function test:concat()
    local new_arr = Array(1, 2, 3)
    assertEqual(new_arr:size(), 3)

    local new_arr2 = Array(4, 5, 6)
    assertEqual(new_arr:size(), 3)

    local ret = new_arr:concat(new_arr2)
    assertEqual(ret:size(), 6)
    assertEqual(ret:get(1), 1)
    assertEqual(ret:get(2), 2)
    assertEqual(ret:get(3), 3)
    assertEqual(ret:get(4), 4)
    assertEqual(ret:get(5), 5)
    assertEqual(ret:get(6), 6)
end


function test:unique()
    local new_arr = Array(1, 2, 3, 2)
    assertEqual(new_arr:size(), 4)

    local ret = new_arr:unique()
    assertEqual(ret:size(), 3)
    assertEqual(ret:get(1), 1)
    assertEqual(ret:get(2), 2)
    assertEqual(ret:get(3), 3)
end


function test:uniqued()
    local new_arr = Array(1, 2, 3, 2, 3)
    assertEqual(new_arr:size(), 5)

    new_arr:uniqued()
    assertEqual(new_arr:size(), 3)
    assertEqual(new_arr:get(1), 1)
    assertEqual(new_arr:get(2), 2)
    assertEqual(new_arr:get(3), 3)
end


test()