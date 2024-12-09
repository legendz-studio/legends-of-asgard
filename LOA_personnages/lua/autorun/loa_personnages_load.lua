-->>> LOA CHARACTER CREATOR
LOA_personnages = LOA_personnages or {}
LOA_personnages.Dir = "loa_personnages"

local function LOA_personnages:IncludeClient(dir,path)
    local str = dir.. "/" .. path

    print("Including LOA_ui file", str)

    if CLIENT then
        include(str)
    end

    if SERVER then
        AddCSLuaFile(str)
    end
end

-- Elements
LOA_personnages:IncludeClient(LOA_personnages.Dir,"elements/frame.lua")
-- Main
LOA_personnages:IncludeClient(LOA_personnages.Dir,"main/frame.lua")  