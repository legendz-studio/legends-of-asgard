ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Chaudron de Cuisine"
ENT.Category = "Legends of Asgard"

ENT.Spawnable = "true"

function ENT:SetupDataTables()


    self:NetworkVar("Bool",1,"IsCooking")
    self:NetworkVar("Int", 1,"CookingCooldown")
    self:NetworkVar("Entity",1,"Ingredient")

end