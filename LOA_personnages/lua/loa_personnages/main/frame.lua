local PANEL = {}
function PANEL:Init()
    self.navbar = self:Add("LOA_character_creater.Navbar")
end
vgui.Register("LOA_character_creater.Menu",PANEL,LOA_character_creator.Frame)

LOA_character_creator.Main.Frame = function()
    local frame = vgui.Create("LOA_character_creator.Menu")
    frame:SetSize(800,600)
    frame:Center()
    frame:MakePopup()
    frame:SetTitle("LOA Character Creation - Menu")
end

concommand.Add("loa_character_creator",LOA_character_creator.Main.Frame)