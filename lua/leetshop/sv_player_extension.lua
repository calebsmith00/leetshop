local ply = FindMetaTable("Player")

function ply:LS_ToggleMenu()
  net.Start("LS_ToggleMenu")
  net.Send(self)
end