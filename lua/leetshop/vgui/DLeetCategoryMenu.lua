local PANEL = {}

function PANEL:Init()
  self:SetSize(self:GetParent():GetSize())
  self:SetPos(0, 48 + 30)

  local buttonContainer = vgui.Create("DPanel", self)
	buttonContainer:SetTall(30)
	buttonContainer:Dock(TOP)
	buttonContainer:DockMargin(0, 10, 0, 0)

  local button = vgui.Create("DButton", buttonContainer)
  local item = LS.Items["crowbar"]
	button:SetSize(surface.GetTextSize(item.Name) * 3, 32)
	button:SetText(item.Name)
	button.DoClick = function()
		print("clicky")
	end	

end

function PANEL:Paint(w, h)	
  surface.SetDrawColor(40, 40, 40, 255)
	surface.DrawRect(0, 0, w, h)
end

vgui.Register('DLeetCategoryMenu', PANEL, "DPanel")