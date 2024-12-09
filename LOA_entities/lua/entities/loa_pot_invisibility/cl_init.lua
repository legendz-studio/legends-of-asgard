include("shared.lua")

function ENT:Draw() 
    self:DrawModel()
    LOA_hud:EntityInfo(self)
end