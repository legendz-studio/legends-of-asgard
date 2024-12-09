--> Hide Default Hud
local DefaultHUD_Hide = {
    ["CHudHealth"] = true,
}
hook.Add("HUDShouldDraw","LOA_HideHud",function(k)
    if (DefaultHUD_Hide[k]) then
        return false
    end
end)

local function Main_HUD()
    local cl = cl or LocalPlayer()
    local natScrW,natScrH = 1920,1080
    local multX,multY = ScrW()/natScrW,ScrH()/natScrH

    --> HP
    local value = cl:Health()/cl:GetMaxHealth()
    local text = cl:Health().." / "..cl:GetMaxHealth()
    LOA_ui:DrawBar(LOA_ui.Theme.hud.hp.bar,value,multX,multY)
    LOA_ui:DrawIcon(LOA_ui.Theme.hud.hp.icon,multX,multY)
    LOA_ui:DrawText(text,LOA_ui.Theme.hud.hp.text,multX,multY)

    --> Money
    local money = cl:getDarkRPVar("money") or 0
    local value = money/100000
    local text = DarkRP.formatMoney(money)
    LOA_ui:DrawBar(LOA_ui.Theme.hud.money.bar,value,multX,multY)
    LOA_ui:DrawIcon(LOA_ui.Theme.hud.money.icon,multX,multY)
    LOA_ui:DrawText(text,LOA_ui.Theme.hud.money.text,multX,multY)

    --> XP
    local value = GlorifiedLeveling.GetPlayerXP()/GlorifiedLeveling.GetPlayerMaxXP()
    local text = GlorifiedLeveling.GetPlayerXP().." / "..GlorifiedLeveling.GetPlayerMaxXP()
    LOA_ui:DrawBar(LOA_ui.Theme.hud.xp.bar,value,multX,multY)
    LOA_ui:DrawIcon(LOA_ui.Theme.hud.xp.icon,multX,multY)
    LOA_ui:DrawText(text,LOA_ui.Theme.hud.xp.text,multX,multY)
end
hook.Add("HUDPaint","LOA_hud",function()
    Main_HUD()
end)