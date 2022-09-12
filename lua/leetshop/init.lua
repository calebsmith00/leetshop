include "shared.lua"
include "sv_manifest.lua"

hook.Add("Initialize", "Test", function()
  PrintTable(LS)
end )