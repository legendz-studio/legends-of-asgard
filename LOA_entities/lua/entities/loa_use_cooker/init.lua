AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/yan/cauldron.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

    self:SetIsCooking(false)

end

--[[ Truc pour cuisiner
le joueur mets un ingrédient dedans (hook: touch)
ça lance la cuisson (timer)
la fumée (pfx1_od) apparait
la couleur de l'ingrédient change en fin de cuisson
une fois le cooldown fini, la fumé disparait
le joueur doit faire E dessus pour manger la nourriture qu'il vient de cuisiner
cette nourriture ne peut pas être mise dans un sac
]]

local cooked_col = Color(200,150,50)
local IngredientList = {
    loa_beef = 0.5,
    loa_chicken = 0.3,
    loa_crab = 0.3,
    loa_monster_meat = 0.1,
    loa_potato = 0.2,
    loa_salmon = 0.4,
}

-- models/briarheart.mdl
-- models/daedraheart.mdl


function ENT:Use(ply,caller)
    if !self:GetIsCooking() and self:GetIngredient():IsValid() then
        for k,v in pairs(IngredientList) do
            if self:GetIngredient():GetClass() == k then
                ply:SetHealth(ply:Health() + ply:GetMaxHealth()*v)
                if ply:GetMaxHealth()<ply:Health() then
                    ply:SetHealth(ply:GetMaxHealth())
                end
                self:GetIngredient():Remove()
                self:SetIngredient()
                break
            end
        end
    else
        -- notification client side uniquement, sendlua network ?
        -- notification.AddLegacy("La marmite est vide.",NOTIFY_GENERIC,3)
        ply:ChatPrint("La marmite est vide!")
    end
end

function ENT:StartTouch(e)
    if self:GetIsCooking() or self:GetIngredient():IsValid() then return end
    for k,v in pairs(IngredientList) do
        if e:GetClass() == k then

            -- Place l'ingredient dans la marmite
            e:SetParent(self)
            e:SetLocalPos(Vector(0,0,14))

            if e:GetClass() == "loa_crab" or "loa_monster_meat" then
                e:SetModelScale(0.5)
            end

            self:SetIsCooking(true)

            -- Effet de fumée
            local fx = ents.Create("pfx1_0d")
            fx:SetParent(self)
            fx:SetLocalPos(Vector(-5,-5,0))
            fx:Spawn()

            -- Effet sonore
            self:EmitSound("npc/headcrab/headcrab_burning_loop2.wav")
            self:EmitSound("ambient/fire/fire_small_loop1.wav")

            timer.Simple(10,function()

                -- Effet visuel (fumée et couleur de l'ingrédient)
                if e:GetClass() == "loa_potato" then
                    e:SetModel("models/grilledpotatoes01.mdl")
                end
                e:SetColor(cooked_col)
                fx:Remove()
                self:StopSound("npc/headcrab/headcrab_burning_loop2.wav")
                self:StopSound("ambient/fire/fire_small_loop1.wav")

                self:SetIsCooking(false)
                self:SetIngredient(e)
            end)
        end
    end
end

function ENT:OnRemove()
    self:StopSound("npc/headcrab/headcrab_burning_loop2.wav")
    self:StopSound("ambient/fire/fire_small_loop1.wav")
end