if SERVER then
  AddCSLuaFile()  
  include ("leetshop/init.lua")
end

if CLIENT then
  include ("leetshop/cl_init.lua")
end

LS:Initialize()