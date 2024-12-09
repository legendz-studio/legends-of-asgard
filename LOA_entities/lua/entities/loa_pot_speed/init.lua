AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/matze.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

--[[ Potion speed
augmente la vitesse pendant 10min]]

function ENT:Use(ply,c)
    local default_speed = ply:GetRunSpeed()
    -- le risque avec ça c'est que si le joueur prends plusieurs potions, la default_speed sera celle avec potion
    ply:SetRunSpeed(ply:GetRunSpeed() *1.1)
    timer.Simple(600, function()
        ply:SetRunSpeed(default_speed)
        ply:ChatPrint( "Les effets de la potion de vitesse ont pris fin." )
    end )
    self:Remove()
end