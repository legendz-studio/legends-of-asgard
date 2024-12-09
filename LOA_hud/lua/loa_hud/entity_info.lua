function LOA_hud:EntityInfo(ent)
    local pos = ent:GetPos() + ent:GetUp() * (ent:OBBMaxs().z + 20)

    local angle = ( pos - LocalPlayer():EyePos() ):GetNormalized():Angle()
    angle = Angle(0,angle.y,0) -- only Y axe move
    angle:RotateAroundAxis(angle:Up(),-90)
    angle:RotateAroundAxis(angle:Forward(),90)
    -- angle.y = angle.y + math.sin( CurTime()) * 4

    if LocalPlayer():GetPos():DistToSqr(ent:GetPos()) < LOA_ui.Settings.distance && LocalPlayer():GetEyeTrace().Entity == ent then
        surface.SetFont("Trebuchet24")
        local w = surface.GetTextSize(ent.PrintName)
        cam.Start3D2D(pos,angle,0.1)
            surface.SetDrawColor(LOA_ui.Theme.bg)
            surface.DrawRect(-w/2 - 30, -35,w+60,50)
            draw.SimpleText(ent.LOADesc,"Trebuchet24",-w/2-20,-15)
            LOA_ui:DrawHexagon(-w/2,-50,w,30,LOA_ui.Theme.bg2)
            LOA_ui:DrawText(ent.PrintName,LOA_ui.Theme.entity_info.header.text)
        cam.End3D2D()
    end
end