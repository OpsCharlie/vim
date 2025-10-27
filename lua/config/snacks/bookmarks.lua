local M = {}

local bookmarks_file = vim.fn.stdpath("config") .. "/bookmarks.lua"

-- Load bookmarks from file
local function load_bookmarks()
  local ok, bookmarks = pcall(dofile, bookmarks_file)
  if not ok or type(bookmarks) ~= "table" then
    return {}
  end
  return bookmarks
end

-- Save bookmarks to file
local function save_bookmarks(bookmarks)
  local file = io.open(bookmarks_file, "w")
  if file then
    file:write("return {\n")
    for _, path in ipairs(bookmarks) do
      file:write(string.format('  "%s",\n', path:gsub('"', '\\"')))
    end
    file:write("}\n")
    file:close()
  end
end

-- Add current directory to bookmarks
function M.add_bookmark()
  local cwd = vim.fn.getcwd()
  local bookmarks = load_bookmarks()
  -- Check if already exists
  for _, b in ipairs(bookmarks) do
    if b == cwd then
      Snacks.notifier.notify("Directory already bookmarked", "warn")
      return
    end
  end
  table.insert(bookmarks, cwd)
  save_bookmarks(bookmarks)
  Snacks.notifier.notify("Bookmarked: " .. cwd, "info")
end

-- Remove bookmark
function M.remove_bookmark(path)
  local bookmarks = load_bookmarks()
  for i, b in ipairs(bookmarks) do
    if b == path then
      table.remove(bookmarks, i)
      save_bookmarks(bookmarks)
      Snacks.notifier.notify("Removed bookmark: " .. path, "info")
      return
    end
  end
  Snacks.notifier.notify("Bookmark not found", "warn")
end

-- Get bookmarks for picker
function M.get_items()
  local bookmarks = load_bookmarks()
  local items = {}
  for _, path in ipairs(bookmarks) do
    table.insert(items, {
      text = path,
      file = path,
      dir = true,
    })
  end
  return items
end

return M
