LOA_ui.Theme = {
    bg = Color(0,0,0,230),
    bg2 = Color(10,10,10),
 
    --> LOA HUD
    hud = {
        offset = 5,
        hp = {
            bar = {
                x = 90,
                y = 930,
                w = 300,
                h = 35,
                color = Color(255,0,0,100)
            },
            text = {
                x = 90+150,
                y = 930+17,
                font = "Trebuchet24"
            },
            icon = {
                x = 90-25,
                y = 925,
                w = 35,
                h = 35,
                scale = 0.9,
                mat = Material("icon16/heart.png","noclamp smooth")
            }
        },
        money = {
            bar = {
                x = 90,
                y = 985,
                w = 200,
                h = 35,
                color = Color(255,150,0)
            },
            text = {
                x = 90 + 100,
                y = 990 + 17,
                font = "Trebuchet24"
            },
            icon = {
                x = 90-25,
                y = 985-5,
                w = 35,
                h = 35,
                mat = Material("icon16/heart.png","noclamp smooth")
            }
        },

        xp = {
            bar = {
                x = 150,
                y = 1040,
                w = 1920-150*2,
                h = 35,
                color = Color(0,255,50,100)
            },
            text = {
                x = 1920/2,
                y = 1040+17,
                font = "Trebuchet24"
            },
            icon = {
                x = 400-40,
                y = 1040,
                w = 35,
                h = 35,
                color = Color(0,255,50,100),
                mat = Material("icon16/star.png")
            }
        }
    },

    entity_info = {
        header = {
            text = {
                x = 0,
                y = -35,
                font = "Trebuchet24"
            }
        }
    },

    rarity = {
        {name = "Commun", color = Color(100,100,100)},
        {name = "Atypique", color = Color(200,200,200)},
        {name = "Rare", color = Color(255,100,0)},
        {name = "Épique", color = Color(100,0,255)},
        {name = "Légendaire", color = Color(255,0,255)},
        {name = "Mythique", color = Color(0,255,255)}
    }
}

LOA_ui.Settings = {
    distance = 5000,
    notif_delay = 8
}