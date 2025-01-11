if (gml_Script_CheckAlarm(0) == -1)
    alarmSet(0, 15)
if (M > 2 || hpupimg >= 0 || instance_number(objHp2) || instance_number(objHpMaxUpEffect))
{
    x = lerp(x, BOBO.x, (0.33 * global.DELTA))
    y = lerp(y, (BOBO.y - 40), (0.33 * global.DELTA))
    BOBO.Hp[1] = BOBO.Hp[2]
}
else
    scrGuiBallMovement(BOBO, 44, -5)
if (M < 2)
{
    if objBobo.visible
    {
        var able_in_this_room = 1
        switch room
        {
            case rm_40_406:
                able_in_this_room = 0
                break
        }

        if obj_exists(objBossHP)
        {
            alarmSet(1, 200)
            M = 1
        }
        else if able_in_this_room
        {
            if heal_cooldown
            {
                M = 1
                alarmSet(1, 200)
            }
            else if instance_number(parEnemy)
            {
                var ine = instance_nearest(x, y, parEnemy)
                if instance_exists(ine)
                {
                    var ined = point_distance(x, y, ine.x, ine.y)
                    if (ined < 200)
                    {
                        M = 1
                        alarmSet(1, 200)
                    }
                }
            }
            else if instance_number(parHurt)
            {
                ine = instance_nearest(x, y, parHurt)
                ined = point_distance(x, y, ine.x, ine.y)
                if (ined < 250 && BOBO.visible)
                {
                    M = 1
                    alarmSet(1, 200)
                }
            }
            if (M != 1)
            {
                var thershp = instance_number(objHp1)
                if (!thershp)
                {
                    if obj_exists(objHp2)
                    {
                        with (objHp2)
                        {
                            if (gml_Script_CheckAlarm(1) == -1)
                                thershp = 1
                        }
                        if thershp
                        {
                            M = 1
                            alarmSet(1, 100)
                        }
                        if (scale2 > 0)
                        {
                            scale2 *= (1 - global.DELTA * 0.1)
                            if (scale2 <= (global.DELTA * 0.1))
                                scale2 = 0
                        }
                        if (scale2 < 0)
                        {
                            shake = 4 - random(8)
                            scale2 *= (1 - 0.1 * global.DELTA)
                            if (scale2 >= -0.1)
                            {
                                shake = 0
                                scale2 = 0
                            }
                        }
                        if (M == 1)
                        {
                            if (scale < 1)
                                scale += (global.DELTA * 0.05)
                            else
                                scale = 1
                        }
                        else if (M == -1)
                        {
                            if (scale > 0)
                                scale -= (global.DELTA * 0.05)
                            else
                                scale = 0
                        }
                        if (M == 2.1)
                        {
                            scale += (global.DELTA * 0.15)
                            if (scale > 2)
                                M = 2.2
                        }
                        else if (M == 2.2)
                        {
                            if (scale > 1)
                                scale -= 0.2
                            else
                            {
                                scale = 1
                                M = 1
                                alarmSet(1, 200)
                            }
                        }
                        if (hpupimg >= 0)
                        {
                            var hpup_prev = hpupimg
                            hpupimg += (global.DELTA * 0.5)
                            if (hpupimg > 28)
                                hpupimg = (-global.DELTA)
                            if (hpupimg < 19)
                            {
                                objBobo.img[2] = 23
                                objBobo.face = 186
                            }
                            if (hpupimg >= 19 && hpup_prev < 19)
                            {
                                global.happiness += happiness_add
                                if (global.happiness >= 100)
                                {
                                    if (!scrGotHappiness(100))
                                        global.happiness = 100
                                    if (global.happiness >= 101)
                                        global.happiness = 101
                                }
                                scrSteamAchievementEnlightenment()
                                objBobo.Hp[2] = 100 + global.happiness
                                if ((objBobo.Hp[1] + other.happiness_add) < objBobo.Hp[2])
                                    objBobo.Hp[1] += other.happiness_add
                                if (objBobo.Hp[1] >= objBobo.Hp[2])
                                    objBobo.Hp[1] = objBobo.Hp[2]
                                with (objBobo.HPdisp)
                                    lastPU = 6
                                hpupimg = 20
                                M = 2.1
                                scale = 0.7
                                var fx = instance_create(x, y, objHpMaxUpEffect)
                                fx.depth = depth - 1
                                fx.q = happiness_add
                                with (objBobo)
                                {
                                    scrWepAdObj(1)
                                    img[2] = 0
                                }
                                var hf = instance_create(x, y, objDSboboHappyFace)
                                with (hf)
                                    alarmSet(0, 100)
                            }
                        }
                        if heal_cooldown
                            heal_cooldown -= (global.DELTA * 1)
                        if heal_cooldown_cancelheal
                            heal_cooldown_cancelheal -= (global.DELTA * 1)
                        if (show_hp_number > 1)
                            show_hp_number -= (global.DELTA * 0.1)
                        else if (show_hp_number > 0)
                        {
                            show_hp_number *= (1 - 0.2 * global.DELTA)
                            if (show_hp_number < 0.1)
                                show_hp_number = 0
                        }
                        var hetpoi = 0
                        if obj_exists(objBobo)
                        {
                            with (objBobo)
                            {
                                if (heath || poison)
                                    hetpoi = 1
                            }
                        }
                        if (Hp[1] < 20 || instance_number(objHp1) || hetpoi || instance_number(objHp2))
                            show_hp_number = show_hp_number_default
                        if (x < 0)
                            x = 0
                        if (x > room_width)
                            x = room_width
                        if (y < 0)
                            y = 0
                        if (y > room_height)
                            y = room_height
                    }
                }
                if thershp
                {
                    M = 1
                    alarmSet(1, 100)
                }
            }
        }
    }
}
if (scale2 > 0)
{
    scale2 *= (1 - global.DELTA * 0.1)
    if (scale2 <= (global.DELTA * 0.1))
        scale2 = 0
}
if (scale2 < 0)
{
    shake = 4 - random(8)
    scale2 *= (1 - 0.1 * global.DELTA)
    if (scale2 >= -0.1)
    {
        shake = 0
        scale2 = 0
    }
}
if (M == 1)
{
    if (scale < 1)
        scale += (global.DELTA * 0.05)
    else
        scale = 1
}
else if (M == -1)
{
    if (scale > 0)
        scale -= (global.DELTA * 0.05)
    else
        scale = 0
}
if (M == 2.1)
{
    scale += (global.DELTA * 0.15)
    if (scale > 2)
        M = 2.2
}
else if (M == 2.2)
{
    if (scale > 1)
        scale -= 0.2
    else
    {
        scale = 1
        M = 1
        alarmSet(1, 200)
    }
}
if (hpupimg >= 0)
{
    var hpup_prev = hpupimg
    hpupimg += (global.DELTA * 0.5)
    if (hpupimg > 28)
        hpupimg = (-global.DELTA)
    if (hpupimg < 19)
    {
        objBobo.img[2] = 23
        objBobo.face = 186
    }
    if (hpupimg >= 19 && hpup_prev < 19)
    {
        global.happiness += happiness_add
        if (global.happiness >= 100)
        {
            if (!scrGotHappiness(100))
                global.happiness = 100
            if (global.happiness >= 101)
                global.happiness = 101
        }
        scrSteamAchievementEnlightenment()
        objBobo.Hp[2] = 100 + global.happiness
        if ((objBobo.Hp[1] + other.happiness_add) < objBobo.Hp[2])
            objBobo.Hp[1] += other.happiness_add
        if (objBobo.Hp[1] >= objBobo.Hp[2])
            objBobo.Hp[1] = objBobo.Hp[2]
        with (objBobo.HPdisp)
            lastPU = 6
        hpupimg = 20
        M = 2.1
        scale = 0.7
        var fx = instance_create(x, y, objHpMaxUpEffect)
        fx.depth = depth - 1
        fx.q = happiness_add
        with (objBobo)
        {
            scrWepAdObj(1)
            img[2] = 0
        }
        var hf = instance_create(x, y, objDSboboHappyFace)
        with (hf)
            alarmSet(0, 100)
    }
}
if heal_cooldown
    heal_cooldown -= (global.DELTA * 1)
if heal_cooldown_cancelheal
    heal_cooldown_cancelheal -= (global.DELTA * 1)
if (show_hp_number > 1)
    show_hp_number -= (global.DELTA * 0.1)
else if (show_hp_number > 0)
{
    show_hp_number *= (1 - 0.2 * global.DELTA)
    if (show_hp_number < 0.1)
        show_hp_number = 0
}
var hetpoi = 0
if obj_exists(objBobo)
{
    with (objBobo)
    {
        if (heath || poison)
            hetpoi = 1
    }
}
if (Hp[1] < 20 || instance_number(objHp1) || hetpoi || instance_number(objHp2))
    show_hp_number = show_hp_number_default
if (x < 0)
    x = 0
if (x > room_width)
    x = room_width
if (y < 0)
    y = 0
if (y > room_height)
    y = room_height
