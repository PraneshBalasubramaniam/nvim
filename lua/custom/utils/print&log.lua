---Gets the formatted str version of table.
---@param data any
---@param indent number|nil
---@return any
---@nodiscard
local function getTable(data, indent)
  indent = indent or 0
  if (type(data) ~= 'table') then return data end
  local str = ''
  for key, val in pairs(data) do
    str = ('%s%s%s =>'):format(str, string.rep("  ", indent), tostring(key))
    if (type(val) == 'table') then
      str = ('%s\n%s'):format(str, getTable(val, indent + 1))
    else
      str = ('%s %s\n'):format(str, tostring(val))
    end
  end
  return str
end

---Logs data to `log-nvim.txt` file
---@param ... any
local function logToFile(...)
  local file = io.open("log-nvim.txt", "a")
  if file then
    file:write('\n' .. '---------------------' .. "\n\n")
    for _, value in ipairs({ ... }) do
      file:write(getTable(value))
    end
    file:write('\n' .. '---------------------' .. "\n")
    file:close()
  else
    print("Error: Unable to open file for logging")
  end
end

--- Prints Data with table formatting
---@param ... any
local function printData(...)
  print('\n' .. getTable(...))
end


return { logToFile = logToFile, printData = printData }
