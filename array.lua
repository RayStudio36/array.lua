local Array = {}

Array.__index = Array

setmetatable(Array, {
    __call = function (class, ...)
       local instance = {}
       setmetatable(instance, Array)
       instance:new(...)
       return instance
   end
})


function Array:new(...)
    local args = {...}
    if #args > 0 then
        self.items = args
    else
        self.items = {}
    end
end


function Array:clone()
    local ret = Array()
    for i = 1, self:size() do
        ret:add(self.items[i])
    end
    return ret
end


function Array:is_empty()
    return #self.items == 0
end


function Array:size()
    return #self.items
end


function Array:get(index)
    assert(index > 0 and index <= #self.items, string.format('index out of range(%d/%d)', index, #self.items))
    return self.items[index]
end


function Array:add(item)
    table.insert(self.items, item)
end


function Array:insert(item, pos)
    table.insert(self.items, item, pos)
end


function Array:push(item)
    table.insert(self.items, item)
end


function Array:remove(item)
    local index = self:index_of(item)
    if index > 0 then
        table.remove(self.items, index)
    end
end


function Array:remove_at(idx)
    assert(idx >= 1 and idx <= #self.items, string.format('index out of range, (%d/%d).', idx, #self.items))

    table.remove(self.items, idx)
end


function Array:pop()
    assert(#self.items > 0, 'stack underflow.')

    local ret = self.items[#self.items]
    table.remove(self.items)
    return ret
end


function Array:index_of(item)
    for i = 1, #self.items do
        if self.items[i] == item then
            return i
        end
    end

    return -1
end


function Array:slice(start, finish)
    local ret = Array()
    finish = finish or #self.items
    assert(start > 0 and finish <= #self.items and finish >= start, string.format('start(%d/%d) or finish(%d/%d) is out of range.', start, #self.items, finish, #self.items))

    for i = start, finish do
        ret:add(self.items[i])
    end
    return ret
end


function Array:sliced(start, finish)
    finish = finish or #self.items
    assert(start > 0 and finish <= #self.items and finish >= start, string.format('start(%d/%d) or finish(%d/%d) is out of range.', start, #self.items, finish, #self.items))

    for i = #self.items, finish + 1, -1 do
        self.items[i] = nil
    end

    for i = 1, start - 1 do
        table.remove(self.items, 1)
    end
end


function Array:reverse()
    local ret = Array()
    if self:size() == 0 then
        return ret
    end

    for i = self:size(), 1, -1 do
        ret:add(self:get(i))
    end

    return ret
end


function Array:reversed()
    if self:size() == 0 then
        return
    end

    local new_items = {}
    local size = self:size()
    for i = 1, size / 2 do
        local temp = self.items[i]
        self.items[i] = self.items[size - i + 1]
        self.items[size - i + 1] = temp
    end
end


function Array:first()
    return self.items[1]
end


function Array:last()
    return self.items[#self.items]
end


function Array:map(callback)
    local ret = Array()
    for i = 1, self:size() do
        ret:add(callback(self.items[i], i))
    end
    return ret
end


function Array:mapped(callback)
    for i = 1, self:size() do
        self.items[i] = callback(self.items[i], i)
    end
end


function Array:filter(callback)
    local ret = Array()
    for i = 1, self:size() do
        if callback(self.items[i], i) then
            ret:add(self.items[i])
        end
    end
    return ret
end


function Array:filtered(callback)
    for i = self:size(), 1, -1 do
        if not callback(self.items[i], i) then
            self:remove_at(i)
        end
    end
end


function Array:reduce(callback)
    if self:size() < 2 then
        return nil
    end

    local ret = callback(self:get(1), self:get(2))
    for i = 3, self:size() do
        ret = callback(ret, self.items[i])
    end

    return ret
end


function Array:concat(other_arr)
    local ret = self:clone()
    for i = 1, other_arr:size() do
        ret:add(other_arr.items[i])
    end
    return ret
end


function Array:unique()
    local ret = Array()
    local s = {}
    for i = 1, self:size() do
        local item = self.items[i]
        if not s[item] then
            ret:add(item)
            s[item] = true
        end
    end
    return ret
end


function Array:uniqued()
    local s = {}
    for i = self:size(), 1, -1 do
        local item = self.items[i]
        if s[item] then
            self:remove_at(s[item])
        end

        s[item] = i
    end
end


return Array