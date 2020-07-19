---
--- Array v0.2 by yangruihan
--- See https://github.com/RayStudio36/array.lua for usage documentation.
--- Licensed under MIT.
--- See https://opensource.org/licenses/MIT for details.
---

---@class Array
local Array = {}

Array.__index = function(t, key)
    if type(key) == "number" then
        return Array.get(t, key)
    else
        local v = rawget(t, key)
        if not v then
            v = rawget(getmetatable(t), key)
        end

        return v
    end
end

Array.__newindex = function(t, key, value)
    if type(key) == "number" then
        Array.set(t, key, value)
    else
        rawset(t, key, value)
    end
end

setmetatable(
    Array,
    {
        __call = function(class, ...)
            local instance = {}
            setmetatable(instance, Array)
            instance:new(...)
            return instance
        end
    }
)

function Array:new(...)
    local args = {...}
    if #args > 0 then
        self._items = args
    else
        self._items = {}
    end
end

function Array:__tostring()
    local seperator = ", "
    local size = self:size()
    local buffer = {"["}
    for i, v in ipairs(self._items) do
        if i == size then
            table.insert(buffer, string.format("%d: %s", i, tostring(v)))
        else
            table.insert(buffer, string.format("%d: %s%s", i, tostring(v), seperator))
        end
    end
    table.insert(buffer, "]")
    return table.concat(buffer)
end

function Array:clone()
    local ret = Array()
    for i = 1, self:size() do
        ret:add(self._items[i])
    end
    return ret
end

function Array:is_empty()
    return #self._items == 0
end

function Array:items()
    return self._items
end

function Array:size()
    return #self._items
end

function Array:set(index, value)
    assert(index > 0 and index <= #self._items, string.format("index out of range(%d/%d)", index, #self._items))
    self._items[index] = value
end

function Array:get(index)
    assert(index > 0 and index <= #self._items, string.format("index out of range(%d/%d)", index, #self._items))
    return self._items[index]
end

function Array:add(item)
    table.insert(self._items, item)
end

function Array:insert(pos, item)
    table.insert(self._items, pos, item)
end

function Array:push(item)
    table.insert(self._items, item)
end

function Array:remove(item)
    local index = self:index_of(item)
    if index > 0 then
        table.remove(self._items, index)
    end
end

function Array:remove_at(idx)
    assert(idx >= 1 and idx <= #self._items, string.format("index out of range, (%d/%d).", idx, #self._items))

    table.remove(self._items, idx)
end

function Array:pop()
    assert(#self._items > 0, "stack underflow.")

    local ret = self._items[#self._items]
    table.remove(self._items)
    return ret
end

function Array:index_of(item)
    for i = 1, #self._items do
        if self._items[i] == item then
            return i
        end
    end

    return -1
end

function Array:slice(start, finish)
    local ret = Array()
    finish = finish or #self._items
    start = start < 1 and 1 or start
    finish = finish > #self._items and #self._items or finish

    for i = start, finish do
        ret:add(self._items[i])
    end
    return ret
end

function Array:sliced(start, finish)
    finish = finish or #self._items
    assert(
        start > 0 and finish <= #self._items and finish >= start,
        string.format("start(%d/%d) or finish(%d/%d) is out of range.", start, #self._items, finish, #self._items)
    )

    for i = #self._items, finish + 1, -1 do
        self._items[i] = nil
    end

    for i = 1, start - 1 do
        table.remove(self._items, 1)
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
        local temp = self._items[i]
        self._items[i] = self._items[size - i + 1]
        self._items[size - i + 1] = temp
    end
end

function Array:first()
    return self._items[1]
end

function Array:last()
    return self._items[#self._items]
end

function Array:map(callback)
    local ret = Array()
    for i = 1, self:size() do
        ret:add(callback(self._items[i], i))
    end
    return ret
end

function Array:mapped(callback)
    for i = 1, self:size() do
        self._items[i] = callback(self._items[i], i)
    end
end

function Array:filter(callback)
    local ret = Array()
    for i = 1, self:size() do
        if callback(self._items[i], i) then
            ret:add(self._items[i])
        end
    end
    return ret
end

function Array:filtered(callback)
    for i = self:size(), 1, -1 do
        if not callback(self._items[i], i) then
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
        ret = callback(ret, self._items[i])
    end

    return ret
end

function Array:concat(other_arr)
    local ret = self:clone()
    for i = 1, other_arr:size() do
        ret:add(other_arr._items[i])
    end
    return ret
end

function Array:unique()
    local ret = Array()
    local s = {}
    for i = 1, self:size() do
        local item = self._items[i]
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
        local item = self._items[i]
        if s[item] then
            self:remove_at(s[item])
        end

        s[item] = i
    end
end

return Array
