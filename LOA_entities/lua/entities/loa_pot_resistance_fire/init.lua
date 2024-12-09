AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/milkjug01.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

--[[ Potion de Resistance au feu
Rends insensible au feu pendant 5 min]]

function ENT:Use(ply,c)
    hook.Add("EntityTakeDamage","LOA_Fire_Resistance", function(target,dmginfo)
        if target == ply and dmginfo:IsDamageType(DMG_BURN) then
            return true
        end
    end)
    timer.Simple(300, function()
        hook.Remove("EntityTakeDamage","LOA_Fire_Resistance")
        ply:ChatPrint("Les effets de la potion de Résistance au Feu ont pris fin.")
    end)
    ply:EmitSound("ambient/voices/cough" .. math.random(1, 4) .. ".wav")
    self:Remove()
end