-->>> LOA HUD
LOA_hud = LOA_hud or {}
LOA_hud.Dir = "loa_hud"

local function LOA_hud:IncludeClient(dir,path)
    local str = dir.. "/" .. path

    print("Including LOA_ui file", str)

    if CLIENT then
        include(str)
    end

    if SERVER then
        AddCSLuaFile(str)
    end
end

--> Include
LOA_hud:IncludeClient(LOA_hud.Dir,"main.lua")
LOA_hud:IncludeClient(LOA_hud.Dir,"entity_info.lua")
LOA_hud:IncludeClient(LOA_hud.Dir,"notifications/central.lua")
--> Networks
if SERVER then
    util.AddNetworkString("loa_sendNotif")
end