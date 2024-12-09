AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/dwarven_oil.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

--[[ Potion Invisibilité
Rends invisible pendant 2 min]] 

function ENT:Use(ply,c)
    ply:SetRenderMode(RENDERMODE_TRANSCOLOR)
    ply:SetColor(Color(255,255,255,0))
    timer.Simple(120,function()
        ply:SetRenderMode(RENDERMODE_NORMAL)
        ply:SetColor(Color(255,255,255,255))
        ply:ChatPrint( "Les effets de la potion d'invisibilité ont pris fin." )
    end)
    self:Remove()
end