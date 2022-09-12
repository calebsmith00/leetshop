include "shared.lua"
include "sv_manifest.lua"
include "sv_player_extension.lua"

util.AddNetworkString("LS_ToggleMenu")

hook.Add("PlayerButtonDown", "ToggleMenu", function(ply, key)
  if LS.Config.ShopKey and LS.Config.ShopKey ~= "" and key == LS.Config.ShopKey then
    ply:LS_ToggleMenu()
  end 
end )