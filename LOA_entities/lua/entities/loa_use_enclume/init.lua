AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/blacksmith_anvil.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

    self:SetIsForging(false)

end

--[[ Truc pour Forgeron
le joueur appuie sur E pour ouvrir un menu
le menu affiche les items équipés, le joueur peut selectionner un item
l'item se place sur l'enclume
le forgeron répare l'item
une fois l'item réparer (timer):
- la durabilité de l'item est remise au max
- l'item disparait de l'enclume
]]

local ItemsList = {
    "loa_wep_sword",
}


function ENT:Use(ply,caller)

end

function ENT:StartTouch(e)

end