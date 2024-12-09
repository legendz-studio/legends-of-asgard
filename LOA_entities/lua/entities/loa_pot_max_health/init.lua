AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/blood_potion.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

--[[ Potion max health
augmente la santé maximal de 50hp pendant 30min]]

function ENT:Use(ply,c)
    local default_maxhealth = ply:GetMaxHealth()
    ply:SetHealth(ply:Health() + 50)
    ply:SetMaxHealth(ply:GetMaxHealth() + 50)
    timer.Simple(1800, function()
        ply:SetMaxHealth(default_maxhealth)
    end)
    self:Remove()
end