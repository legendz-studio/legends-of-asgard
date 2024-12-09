ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Enclume"
ENT.Category = "Legends of Asgard"

ENT.Spawnable = "true"

function ENT:SetupDataTables()


    self:NetworkVar("Bool",1,"IsForging")
    self:NetworkVar("Int", 1,"ForgingCooldown")
    self:NetworkVar("Entity",1,"Item")

end