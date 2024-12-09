function LOA_ui:DrawHexagon(x,y,w,h,color)
    local color = color or Color(255,255,255)
    local box = {
        {x = x,                 y = y      },
        {x = x + w,             y = y      },
        {x = x + w + (h/2),     y = y + h/2},
        {x = x + w,             y = y + h  },
        {x = x,                 y = y + h  },
        {x = x - (h/2),         y = y + h/2},
    }
    surface.SetDrawColor(color)
    draw.NoTexture()
    surface.DrawPoly(box)
end

function LOA_ui:DrawBar(type,value,multX,multY,offset)
    --vars
    local offset = offset or LOA_ui.Theme.hud.offset
    local width = ((type.w-offset*2)*multX)*math.Clamp(value,0,1)
    --BG box
    LOA_ui:DrawHexagon(type.x*multX,type.y*multY,type.w*multX,type.h*multY,LOA_ui.Theme.bg)
    --Filled box
    LOA_ui:DrawHexagon((type.x+offset)*multX,(type.y+offset)*multY,width,(type.h-offset*2)*multY,type.color)
end

function LOA_ui:DrawIcon(type,multX,multY)
    --vars
    local scl = type.scale or 1
    --BG box
    surface.SetDrawColor(LOA_ui.Theme.bg)
    draw.NoTexture()
    surface.DrawTexturedRectRotated(type.x*multX,type.y*multY,type.w*multX,type.h*multY,45)
    --Icon
    surface.SetDrawColor(type.color or Color(255,255,255))
    surface.SetMaterial(type.mat)
    surface.DrawTexturedRectRotated(type.x*multX,type.y*multY,(type.w*scl)*multY,(type.h*scl)*multY,0)
end

function LOA_ui:DrawText(text,type,multX,multY)
    --vars
    local color = type.color or color_white
    local px = 1.5
    local multX,multY = multX or 1, multY or 1
    --shadow/outline
    draw.SimpleText(text,type.font,(type.x+px)*multX,(type.y+px)*multY,color_black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    --text
    draw.SimpleText(text,type.font,type.x*multX,type.y*multY,color,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end