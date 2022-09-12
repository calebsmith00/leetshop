LS = {}
LS.Items = {}
LS.Categories = {}
LS.Currency = "¢"

function LS:Initialize()
  self:LoadItems()
end

function LS:LoadItems()
	local _, dirs = file.Find('leetshop/items/*', 'LUA')
	local emptyfunc = function() end

  for _, category in pairs(dirs) do
    local f, _ = file.Find("leetshop/items/" .. category .. "/__category.lua", "LUA")

    if #f <= 0 then return end

    CATEGORY = {}
    CATEGORY.Name = ''
    CATEGORY.Icon = ''
    CATEGORY.Order = 0

    if SERVER then AddCSLuaFile("leetshop/items/" .. category .. "/__category.lua") end
    include("leetshop/items/" .. category .. "/__category.lua")

    if not LS.Categories[category] then LS.Categories[category] = CATEGORY end

    local files, _ = file.Find("leetshop/items/" .. category .. "/*.lua", "LUA")

    for _, name in pairs(files) do
      if name ~= "__category.lua" then
        if SERVER then AddCSLuaFile("leetshop/items/" .. category .. "/" .. name) end

        ITEM = {}
        ITEM.__index = ITEM
        ITEM.ID = string.gsub(string.lower(name), ".lua", '')
        ITEM.Category = CATEGORY.Name
        ITEM.Price = 0

        include ("leetshop/items/" .. category .. "/" .. name)

        local item = ITEM

        LS.Items[ITEM.ID] = ITEM

        ITEM = nil
      end
    end

    CATEGORY = nil
  end
end

