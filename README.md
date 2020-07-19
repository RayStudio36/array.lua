# Array

v0.2

Array module for lua

## Installation

The array.lua file should be dropped into an existing project and required by it.

```lua
Array = require 'array'
```

## Example

```lua
arr = Array()

-- add
arr:add(1)
arr:push(true)
arr:insert('hello', 1)
arr:add({a=1})

-- get
ele = arr:get(1)
ele = arr[1]

-- set
arr:set(1, 'hello')
arr[1] = 'hello'

-- pop
ele2 = arr:pop()
```

## Usage
### Constructor

```lua
arr1 = Array()
arr2 = Array(1, 2, 3) -- 1 2 3
```

### clone

clone a array

```lua
arr = Array(1, 2, 3) -- 1 2 3
clone_arr = arr:clone() -- 1 2 3
```

### is_empty()

return true if an array is empty

```lua
arr = Array() -- 1 2 3
arr:is_empty() -- true
```

### size()

return count of items

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:size() -- 3
```

### get(index)

return item which position is the index

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:get(2) -- 2
arr[2] -- 2
```

### set(index, value)

set new value which position is the index

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:set(2, 4) -- 1 4 3
arr[2] = 4 -- 1 4 3
```

### add(item) or push(item)

add item to the end of array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:add(4) -- 1 2 3 4
arr:push(5) -- 1 2 3 4 5
```

### insert(item, pos)

insert item to the position

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:insert(0, 2) -- 1 0 2 3
```

### remove(item)

remove item from array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:remove(2) -- 1 3
```

### remove_at(index)

remove item from array which position is the index

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:remove_at(1) -- 2 3
```

### pop()

return the last item

```lua
arr = Array(1, 2, 3) -- 1 2 3
last_item = arr:pop() -- 3
```

### index_of(item)

return the index of the item

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:index_of(2) -- 2
```

### slice(start, finish)

return slice between start and finish

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr2 = arr:slice(2, 3) -- 2 3
```

### sliced(start, finish)

same as `slice(start, finish)`, but change self rather than return new array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:sliced(2, 3) -- 2 3
```

### reverse()

return reversed array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr2 = arr:reverse() -- 3 2 1
```

### reversed()

same as `reverse()`, but change self rather than return new array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:reversed() -- 3 2 1
```

### first()

return the first item in array

```lua
arr = Array(1, 2, 3) -- 1 2 3
item = arr:first() -- 1
```

### last()

return the last item in array

```lua
arr = Array(1, 2, 3) -- 1 2 3
item = arr:last() -- 3
```

### map(callback)

create a new array of values by mapping each value in array through a transformation function

`callback(item, index)`

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr2 = arr:map(function (item, index)
    return item + index
end) -- 2 4 6
```

### mapped(callback)

same as `map(callback)`, but change self rather than return new array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:mapped(function (item, index)
    return item + index
end) -- 2 4 6
```

### filter(callback)

create a new array containing all elements that pass truth test

`callback(item, index)`

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr2 = arr:map(function (item, index)
    return index % 2 == 0
end) -- 2
```

### filtered(callback)

same as `filter(callback)`, but change self rather than return new array

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr:filtered(function (item, index)
    return index % 2 == 0
end) -- 2
```

### reduce(callback)

applies a function against an accumulator and each value of the array to reduce it to a single value

```lua
arr = Array(1, 2, 3) -- 1 2 3
ret = arr:reduce(function (a, b)
    return a + b
end) -- 6
```

### concat(other_array)

return a new array joining all values from the two tables passed by parameter

```lua
arr = Array(1, 2, 3) -- 1 2 3
arr2 = Array(4, 5, 6) -- 4 5 6
arr3 = arr:concat(arr2) -- 1 2 3 4 5 6
```

### unique()

return a new array, removing duplicates values

```lua
arr = Array(1, 2, 3, 2, 3) -- 1 2 3 2 3
arr2 = arr:unique() -- 1 2 3
```

### uniqued()

same as `unique()`, but change self rather than return new array

```lua
arr = Array(1, 2, 3, 2, 3) -- 1 2 3 2 3
arr:uniqued() -- 1 2 3
```
