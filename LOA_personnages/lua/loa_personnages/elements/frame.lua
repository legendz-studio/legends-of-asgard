local PANEL = {}

local matcloseBtn = Material("icon16/heart.png")

LOA_ui:CreateFont("Header",20)

function PANEL:Init()
    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    self.header.Paint = function(pnl,w,h)
        draw.RoundedBoxEx(6,0,0,w,h,LOA_character_creator.Theme.primary,true,true,false,false)
    end

    self.header.closeBtn = self.header:Add("DButton")
    self.header.closeBtn:Dock(RIGHT)
    self.header.closeBtn.DoClick = function(pnl)
        self:Remove()
    end
    self.header.closeBtn.margin = 16
    self.header.closeBtn.Paint = function(pnl,w,h)
        local margin = pnl.margin
        surface.SetDrawColor(LOA_character_creator.Theme.closeBtn)
        surface.SetMaterial(matcloseBtn)
        surface.DrawTexturedRect(margin,margin,w-margin*2,h-margin*2)
    end

    self.header.title = self.header:Add("DLabel")
    self.header.title:Dock(LEFT)
    self.header.title:SetFont("LOA_UI.Header")
    self.header.title:SetColor(LOA_character_creator.Theme.text.h1)
    self.header.title:SetTextInset(16,0) 
end

function PANEL:SetTitle(text)
    self.header.title:SetText(text)
    self.header.title:SizeToContents()
end

function PANEL:PerformLayout(w,h)
    self.header:SetTall(LOA_character_creator.UISizes.navbar.height)
    self.header.closeBtn:SetWide(self.header:GetTall())
end

function PANEL:Paint(w,h)
    local aX,aY = self:LocalToScreen()

end

vgui.Register("LOA_character_creator.Frame",PANEL,"EditablePanel")