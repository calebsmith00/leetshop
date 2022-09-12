if SERVER then
  AddCSLuaFile("shared.lua")
  AddCSLuaFile("cl_init.lua")
  include ("init.lua")
  include ("shared.lua")
end

if CLIENT then
  include ("shared.lua")
  include ("cl_init.lua")
end