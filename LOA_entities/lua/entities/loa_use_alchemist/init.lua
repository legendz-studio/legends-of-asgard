AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/yan/alchemytable.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

    self:SetIsBrewing(false)

end

--[[ Truc pour potion
le joueur mets un ingrédient dedans (hook: touch)
ça lance la préparation (timer)
une fois le cooldown fini, la potion apparait
]]

local IngredientList = {
    loa_pearl = "loa_pot_mana_regen",
    loa_monster_heart = "loa_pot_max_health",
    loa_taproot = "loa_pot_invisibility",
    loa_pearl_small = "loa_pot_max_mana",
    loa_tusk = "loa_pot_resistance_fire",
    loa_spider_egg = "loa_pot_speed",
}

-- models/bee_honey_comb.mdl
-- models/birdegg01.mdl
-- models/birdegg02.mdl
-- models/birdegg03.mdl
-- models/canis_root.mdl
-- models/jarrin_root.mdl
-- models/honey_nut_treat.mdl
-- models/ice_wraith_teeth.mdl
-- models/mammoth_tusk.mdl
-- models/mudcrabchitin.mdl
-- models/taproot.mdl

function ENT:StartTouch(e)
    if self:GetIsBrewing() then return end
    for k,v in pairs(IngredientList) do
        if e:GetClass() == k then

            -- Place l'ingredient sur la table d'alchimie
            e:SetParent(self)
            e:SetLocalPos(Vector(2,-2,31))

            -- Effet de magie
            local fx = ents.Create("pfx8_02")
            fx:SetParent(self)
            fx:SetLocalPos(Vector(2,-2,32)) 
            fx:Spawn()
            self:EmitSound("ambient/energy/whiteflash.wav")
            self:EmitSound("ambient/energy/force_field_loop1.wav")
            -- self:EmitSound("npc/scanner/scanner_scan"..math.random(1,5)..".wav")
            self:SetIsBrewing(true)

            timer.Simple(10,function()
                local potion = ents.Create(v)
                potion:SetPos(fx:GetPos() + Vector(0,0,20))
                -- potion:SetPos(self:GetPos() + self:GetUp() * (self:OBBMaxs().z) + 5)
                fx:Remove()
                e:Remove()
                self:StopSound("ambient/energy/force_field_loop1.wav")
                potion:Spawn()
                self:EmitSound("ambient/energy/spark"..math.random(1,6)..".wav")

                self:SetIsBrewing(false)
            end)
        end
    end
end

function ENT:OnRemove()
    self:StopSound("ambient/energy/force_field_loop1.wav")
end