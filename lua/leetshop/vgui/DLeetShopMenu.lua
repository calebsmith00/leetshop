local PANEL = {}

function PANEL:Init()
  self:SetSize( math.Clamp( 800, 0, ScrW() ), math.Clamp( 600, 0, ScrH() ) )
  self:SetPos((ScrW() / 2) - (self:GetWide() / 2), (ScrH() / 2) - (self:GetTall() / 2))

  local closeButton = vgui.Create("DButton", self)
  closeButton:SetText('X')
	closeButton.Paint = function() end
	closeButton:SetColor(Color(255, 255, 255))
	closeButton:SetSize(32, 32)
	closeButton:SetPos(self:GetWide() - 40, 8)
	closeButton.DoClick = function()
		LS:ToggleMenu()
	end

  local buttonContainer = vgui.Create("DPanel", self)
	buttonContainer:SetTall(30)
	buttonContainer:Dock(TOP)
	buttonContainer:DockMargin(0, 48, 0, 0)

	local button = vgui.Create("DButton", buttonContainer)
	button:SetSize(surface.GetTextSize("Weapons") - 5, 32)
	button:SetIcon("icon16/wand.png")
	button:SetText("Weapons")
	button.DoClick = function()
		LS:ToggleCategory()
	end	
end

function PANEL:Paint(w, h)
	Derma_DrawBackgroundBlur(self)
	
	surface.SetDrawColor(40, 40, 40, 255)
	surface.DrawRect(0, 0, w, h)

	surface.SetDrawColor(60, 80, 104, 255)
	surface.DrawRect(0, 0, w, 48)

	if LS.Config.CommunityName then
		draw.SimpleText("LeetShop", 'DermaDefault', 16, 8, Color(255,255,255))
	else
		draw.SimpleText("LeetShop", "DermaDefault", 16, 8, Color(255,255,255))
  end
	
end

vgui.Register('DLeetShopMenu', PANEL)