ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Table d'Alchimiste"
ENT.Category = "Legends of Asgard"

ENT.Spawnable = "true"

function ENT:SetupDataTables()


    self:NetworkVar("Bool",1,"IsBrewing")
    self:NetworkVar("Int", 1,"BrewingCooldown")
    self:NetworkVar("Entity",1,"Ingredient")

end