function LOA_ui:CreateFont(name,size,weight)
    surface.CreateFont("LOA_ui."..name,{
        font = "FontName",
        size = size or 16,
        weight = weight or 500
    })
end