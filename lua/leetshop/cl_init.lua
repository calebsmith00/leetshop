include "shared.lua"

include "vgui/DLeetShopMenu.lua"
include "vgui/DLeetCategoryMenu.lua"

LS.ShopMenu = nil
LS.CategoryMenu = nil

function LS:ToggleMenu()
  if not LS.ShopMenu then
    LS.ShopMenu = vgui.Create("DLeetShopMenu")
    LS.ShopMenu:SetVisible(false)
  end

  if LS.ShopMenu:IsVisible() then
      LS.ShopMenu:Hide()
      gui.EnableScreenClicker(false)
  else
      LS.ShopMenu:Show()
      gui.EnableScreenClicker(true)
  end
end

function LS:ToggleCategory()
  if not LS.CategoryMenu then
    LS.CategoryMenu = vgui.Create("DLeetCategoryMenu", LS.ShopMenu)
    LS.CategoryMenu:SetVisible(false)
  end

  if LS.CategoryMenu:IsVisible() then
    LS.CategoryMenu:Hide()
  else
    LS.CategoryMenu:Show()
  end
end

net.Receive("LS_ToggleMenu", function(len)
  LS:ToggleMenu()
end )