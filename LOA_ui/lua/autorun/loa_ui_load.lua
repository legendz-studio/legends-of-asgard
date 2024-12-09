-->>> BASE LOA UI INCLUDER
LOA_ui = LOA_ui or {}
LOA_ui.Dir = "loa_ui"

function LOA_ui:IncludeClient(dir,path)
    local str = dir.. "/" .. path

    print("Including LOA_ui file", str)

    if CLIENT then
        include(str)
    end

    if SERVER then
        AddCSLuaFile(str)
    end
end

-->>> LOA UI
--> Include
LOA_ui:IncludeClient(LOA_ui.Dir,"settings/config.lua")
LOA_ui:IncludeClient(LOA_ui.Dir,"misc/font.lua")
LOA_ui:IncludeClient(LOA_ui.Dir,"misc/draw.lua")

