local notifTime,notifType
local loa_notifMsg, loa_notifMsg2
net.Receive("loa_sendNotif",function()
    notifType,notifTime = net.ReadString(), CurTime()
    if notifType == "level" then
        loa_notifMsg = "Niveau Supérieur !"
        loa_notifMsg2 = "Vous avez atteint le niveau ".. LocalPlayer().na_reputation
        LocalPlayer():EmitSound("garrysmod/save_load1.wav")
    end
end)

local function LOA_hud_CentralNotif()
    if notifTime then
        local scrWidth,scrHeight = 1920,1080
        local multX,multY = ScrW() / scrWidth, ScrH() / scrHeight
        local boxH = 35 * multY
        local boxX = 90 * multX
        local boxoffsetX,boxoffsetY = 5 * multX, 5 * multY
        local boxoffsetW,boxoffsetH = boxoffsetX*2,boxoffsetY*2

        surface.SetFont("Trebuchet24")
        local boxW = surface.GetTextSize(loa_notifMsg2) + boxoffsetX
        local boxX = scrWidth/2 - boxW/2

        DrawLOAHexagon(boxX*multX,225*multY,boxW*multX,50*multY,loa_config.hud_colors.bg)
        draw.SimpleText(loa_notifMsg,"Trebuchet24",scrWidth/2,200*multY,color_black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        draw.SimpleText(loa_notifMsg2,"Trebuchet24",scrWidth/2,250*multY,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)

        timer.Simple(loa_config.hud_notif_delay,function()
            notifType,notifTime = nil, nil
        end)
    end
end

hook.Add("HUDPaint","LOA_HUD_Notification",LOA_hud_CentralNotif)