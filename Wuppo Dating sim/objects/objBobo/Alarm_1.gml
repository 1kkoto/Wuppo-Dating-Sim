if (PARALYZED == 0 && global.Diable && visible == true && objController.curid != 2 && gml_Script_CheckAlarm(6) == -1)
{
    BODY_HEIGHTx = lengthdir_x((-bod_h), (ang[1] + ang[2] + ang[4] - 90))
    BODY_HEIGHTy = lengthdir_y((-bod_h), (ang[1] + ang[2] + ang[4] - 90))
    var MainBulletX = newBulletX
    var MainBulletY = newBulletY
    var HEALTYPE = scrCheckItemHeal(curItem)
    if (HEALTYPE != -1)
    {
        var canHeal = 0
        switch HEALTYPE
        {
            case 5:
                canHeal = 1
                break
            default:
                if (objController.curid == 5)
                    canHeal = 1
                break
        }

        if (canHeal && PressedClick)
        {
            with (objHPdisp)
            {
                if heal_cooldown
                    canHeal = 0
            }
            if global.CursorHold
            {
                if (!canHeal)
                {
                    with (objHPdisp)
                    {
                        if scrSoundIsPlaying(62)
                            scrSoundStop(62)
                        scrSoundSpec(62)
                        scale = 0.5
                        scale2 = 0.5
                        shake = 5
                        heal_cooldown_cancelheal = 60
                        show_hp_number = show_hp_number_default
                    }
                }
                else
                {
                    objController.cursor_img = 0.4
                    if (wepswap == 0 && img[2] != 12 && alarm[4] == -1 && img[2] != 14)
                    {
                        keepItemVarHeal = curItemCol
                        scrEatItem()
                        scrHealCoolDown()
                    }
                }
            }
        }
    }
    else
    {
        switch curItem
        {
            case 1:
            case 42:
            case 158:
            case 159:
            case 160:
            case 161:
            case 162:
            case 163:
                if (move < 2 || floor(move) == 9)
                {
                    if (global.CursorHold && gotGumgumgun)
                    {
                        var upgtyp = global.powerup[1]
                        alarmSet(1, 9)
                        var bullet = instance_create(MainBulletX, MainBulletY, objBoboGumball)
                        gumball_color = scrBoboGumballColor(bullet)
                        bullet.image_blend = gumball_color
                        var tmpfir = instance_create(bullet.x, bullet.y, objGumballFire)
                        if upgtyp
                        {
                            if (upgtyp == 1)
                            {
                                scrSound(13)
                                tmpfir.yscale *= 0.7
                                tmpfir.xscale *= (0.5 + random(0.25))
                                with (bullet)
                                {
                                    thin = 1
                                    off = 36
                                    spdoff = 0.2
                                    if (dmg > 2)
                                        dmg -= 1
                                    image_xscale *= 0.75
                                    image_yscale = image_xscale
                                }
                                alarmSet(1, 4)
                            }
                            else if (upgtyp == 2)
                            {
                                scrSound(13)
                                with (tmpfir)
                                {
                                    imgspd = 0.3
                                    yscale *= 1.3
                                    image_blend = c_orange
                                }
                                with (bullet)
                                {
                                    if (sprite_index == sprGumball)
                                        sprite_index = sprGumball2
                                    else
                                    {
                                        image_xscale *= 1.5
                                        image_yscale *= 1.5
                                    }
                                    plusdist = 1
                                    if (dmg == 1)
                                        dmg = 2
                                    dmg += choose(2, 3)
                                    image_xscale *= 0.8
                                    image_yscale *= 0.8
                                }
                                alarmSet(1, 11)
                            }
                            else if (upgtyp == 3)
                            {
                                if (!instance_number(objDSrechargeBoboGun13))
                                {
                                    scrSoundSpec(210)
                                    bullet.dmg += 7
                                    bullet.amped = 1
                                    instance_create(MainBulletX, MainBulletY, objDSrechargeBoboGun13)
                                    with (tmpfir)
                                    {
                                        xscale *= 1.4
                                        yscale *= 1.25
                                        image_blend = c_orange
                                        imgspd = 0.3
                                    }
                                }
                                else
                                {
                                    scrSound(13)
                                    bullet.dmg += choose(0, 0, 1)
                                }
                            }
                        }
                        else
                            scrSound(13)
                        bullet.Tx = global.CursorX
                        bullet.Ty = global.CursorY
                        bullet.depth = depth - 1
                        img[4] = 4
                    }
                }
                break
            case 15:
            case 164:
            case 165:
            case 166:
            case 167:
            case 168:
                if (global.CursorHold && wepAdObj != self && gotBazooka)
                {
                    if (wepAdObj.charge <= 0)
                    {
                        bullet = instance_create(MainBulletX, MainBulletY, objBoboBazGumball)
                        gumball_color = scrBoboGumballColor(bullet)
                        bullet.image_blend = gumball_color
                        tmpfir = instance_create(bullet.x, bullet.y, objGumballFire)
                        bullet.Tx = instance_nearest(x, y, objPctrl).x
                        bullet.Ty = instance_nearest(x, y, objPctrl).y
                        bullet.depth = depth - 1
                        if (bullet.sprite_index != sprGumball2)
                        {
                            bullet.image_xscale *= 1.8
                            bullet.image_yscale *= 1.8
                        }
                        scrSound(13)
                        img[4] = 4
                        wepAdObj.charge = 1
                        with (wepAdObj)
                        {
                            scrSound(0)
                            alarmSet(0, 133)
                        }
                        alarmSet(1, 9)
                    }
                }
                break
            case 2:
            case 78:
            case (182 << 0):
                if (global.powerup[2] >= 1)
                {
                    if (move < 2 && BlusW.water > 0)
                    {
                        if (img[4] > 4)
                        {
                            img[4] = 6
                            if global.CursorHold
                                alarmSet(1, 5)
                            var tmpcolto = BlusW.color
                            if (curItem == (182 << 0))
                            {
                                var Ang124 = ang[1] + ang[2] + ang[4]
                                bullet = instance_create((x + (lengthdir_x(10, (Ang124 + 90))) + 7 * dir), (y + (lengthdir_y(10, (Ang124 + 90)))), objBoboBluswaterShot3)
                            }
                            else
                                bullet = instance_create((x + BODY_HEIGHTx + (lengthdir_x(4, (ang[3] + ang[2])))), (y + BODY_HEIGHTy + 3 + (lengthdir_y(4, (ang[3] + ang[2])))), objBoboBluswaterShot3)
                            with (bullet)
                                image_blend = tmpcolto
                            if (curItem == 78 || (curItem == (182 << 0) && gotUltrabucket))
                            {
                                bullet.dmg += choose(0, 1, 2)
                                if (!irandom(8))
                                    bullet.dmg += 1
                                bullet.sprite_index = sprBluswaterShot
                                bullet.image_xscale = 1 - random(0.1)
                                bullet.image_yscale = bullet.image_xscale
                                bullet.DRAW_XTRA_DROP = choose(0, 1)
                                bullet.image_single = choose(0, 1, 2)
                                with (bullet)
                                    alarmSet(3, (10 + irandom(10)))
                                if global.CursorHold
                                    alarmSet(1, 4)
                            }
                            bullet.depth = depth - 1
                            BlusW.water -= 0.5
                            if (BlusW.water <= 0)
                                BlusW.water = 0
                            if (move == 1.2)
                                bullet.direction = ang[2]
                        }
                        else if global.CursorHold
                        {
                            img[4] = 7
                            alarmSet(1, 9)
                            if (curItem == 78)
                                alarmSet(1, 12)
                        }
                    }
                }
                break
            case 5:
                if global.CursorHold
                    img[4] = 4
                else if (img[4] == 4)
                    img[2] = 0
                break
            case 11:
                var OnCoolDown = 0
                if instance_exists(BatP)
                {
                    if (BatP.OVERHEATH >= 0)
                        OnCoolDown = 1
                    BatP.M = 1
                    with (BatP)
                        alarmSet(1, 90)
                }
                if (!OnCoolDown)
                {
                    if instance_exists(wepAdObj)
                    {
                        var tshots = wepAdObj.shots_left
                        if (tshots > 0)
                        {
                            if global.CursorHold
                            {
                                scrSound(13)
                                alarmSet(1, (5 + random(3)))
                                repeat (2)
                                {
                                    bullet = instance_create(MainBulletX, MainBulletY, objBoboShockball)
                                    with (bullet)
                                    {
                                        thin = 1
                                        off = 46
                                        spdoff = 0.4
                                        image_xscale *= 0.75
                                        image_yscale = image_xscale
                                    }
                                }
                                tmpfir = instance_create(MainBulletX, MainBulletY, objGumballFire)
                                tmpfir.image_blend = c_aqua
                                tmpfir.depth = objBobo.depth - 0.01
                                wepAdObj.shots_left -= 2
                                wepAdObj.on_cooldown += 1.5
                            }
                        }
                    }
                }
                break
            case 12:
                if (global.CursorHold && wepAdObj != self)
                {
                    if (wepAdObj.atk == 0)
                    {
                        wepAdObj.atk = 1
                        img[4] = 0
                        return;
                    }
                }
                break
            case 18:
                if global.CursorHold
                {
                    if (wepswap == 0)
                    {
                        repeat (2)
                            scrSound(14)
                        scrRemoveItemFromInventory(curItem)
                        curItem = 0
                        if scrCheckWeha(18)
                            scrWEAPTO(18)
                        else
                            scrWEAPTO(0)
                        alarmSet(1, 32)
                        scrBoboRecoil(0, 1, 5)
                        var i = instance_create(x, y, objBoboTrap1)
                        i.vsp = -3
                    }
                }
                break
            case 53:
                break
            case 19:
                i = instance_create(x, y, objFlashLightCamera)
                i.BOBO = id
                break
            case 55:
                if (global.CursorHold && free == 0)
                {
                    img[2] = 8
                    scrBoboDuck(0)
                    wepAdObj.holding = 1
                }
                break
            case 59:
                if (global.CursorHold && free == 0)
                {
                    var fat = sign(bod_fat)
                    if (fat && (!eating) && (!instance_number(objEXTRheal)) && (!alarm[8]))
                    {
                        var ibpx = scrGetItemPosition(30, 0)
                        var ib = instance_create(ibpx[0], ibpx[1], objBreftBlob)
                        with (ib)
                        {
                            image_xscale = 0.3
                            image_yscale = 0.3
                            getting_eaten = 1
                        }
                        healer = instance_create(x, y, objEXTRheal)
                        healer.healS = 0
                        healer.healT = 10
                        healer.healingC = 0
                        healer.healingF = 25
                        alarmSet(8, 16)
                        with (wepAdObj)
                            alarmSet(1, gml_Script_CheckAlarmWith(other, 8))
                        wepAdObj.boboshrink = 10
                        img[2] = 12
                        UD[2] = 0
                    }
                    else
                    {
                        if ((!eating) && (!alarm[8]))
                            img[2] = 8
                        wepAdObj.shake = 1
                        with (wepAdObj)
                            alarmSet(0, 10)
                    }
                }
                break
            case 85:
                if global.CursorHold
                    scrItemAction(curItem)
                break
            case (88 << 0):
            case (181 << 0):
                if global.CursorHold
                {
                    switch curItem
                    {
                        case (181 << 0):
                            scrCreateOtherWindow(1)
                            break
                        default:
                            scrCreateOtherWindow(0)
                            break
                    }

                }
                break
            case 117:
                if global.CursorHold
                {
                    var table = 0
                    if (instance_exists(wepAdObj) && wepAdObj != self)
                    {
                        if global.definitive_edition
                            table = 1
                        else if (wepAdObj.pointer_image >= 5)
                            table = 1
                    }
                    if table
                    {
                        var cur_item_ammo_type = 0
                        if (scrCheckWehaQ(8) <= 0)
                        {
                            if (scrCheckWehaQ(178) > 0)
                                cur_item_ammo_type = 178
                            else if (scrCheckWehaQ(179) > 0)
                                cur_item_ammo_type = 179
                            else if (scrCheckWehaQ(180) > 0)
                                cur_item_ammo_type = 180
                        }
                        var gotAmmo = 0
                        if scrWepAdObjExists()
                        {
                            with (wepAdObj)
                            {
                                switch current_poster
                                {
                                    case 0:
                                        cur_item_ammo_type = 8
                                        break
                                    case 1:
                                        cur_item_ammo_type = (178 << 0)
                                        break
                                    case 2:
                                        cur_item_ammo_type = (179 << 0)
                                        break
                                    case 3:
                                        cur_item_ammo_type = (180 << 0)
                                        break
                                }

                            }
                            gotAmmo = scrCheckWehaQ(cur_item_ammo_type)
                            if (gotAmmo <= 1)
                            {
                                with (wepAdObj)
                                {
                                    alarmSet(0, 1)
                                    show_debug_message("try changing poster type.")
                                }
                            }
                        }
                        if (cur_item_ammo_type != 0 && gotAmmo)
                        {
                            bullet = instance_create(MainBulletX, MainBulletY, objBoboKrantShot)
                            switch cur_item_ammo_type
                            {
                                case 178:
                                    bullet.image_blend = c_yellow
                                    bullet.poster = 2
                                    break
                                case 179:
                                    bullet.image_blend = c_orange
                                    bullet.poster = 3
                                    break
                                case 180:
                                    bullet.image_blend = c_purple
                                    bullet.poster = 4
                                    break
                            }

                            scrParticle(MainBulletX, MainBulletY, 57, 2)
                            scrSound(13)
                            scrRemoveItemFromInventory(cur_item_ammo_type)
                            scrBoboRecoil(1, 1, 12)
                            alarmSet(1, 24)
                        }
                        else
                        {
                            scrSoundSpec(498)
                            alarmSet(1, 24)
                        }
                        break
                    }
                    else
                    {
                        if scrWepAdObjExists()
                        {
                            wepAdObj.pointer_image = 9
                            with (wepAdObj)
                                alarmSet(1, 12)
                            repeat (5)
                                scrSoundSpecPitch(599, 0, 1, 0.9)
                        }
                        alarmSet(1, 24)
                    }
                }
        }

    }
}
PressedClick = 0
