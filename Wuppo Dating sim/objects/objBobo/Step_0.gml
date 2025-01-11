if (swim_hold_y > 0)
    swim_hold_y -= 0.05
else
    swim_hold_y = 0
var diab = global.Diable
if (alarm[8] && eating == 0)
    wepup *= 1.5
if scrBoboNoSleepHere()
    sleep_alarm = sleep_alarm_base
if (visible == false)
{
    if (move != 6)
    {
        if (buis_sound_snd != -1)
        {
            scrSoundStop(buis_sound_snd)
            buis_sound_snd = -1
        }
    }
    if (poison_sound_snd != -1)
    {
        scrSoundStop(poison_sound_snd)
        poison_sound_snd = -1
    }
    if (braad_sound_snd != -1)
    {
        scrSoundStop(braad_sound_snd)
        braad_sound_snd = -1
    }
    return;
}
else if (visible == true)
{
    if (move == 6)
    {
        if (buis_sound_snd == -1)
            buis_sound_snd = scrSound(28, 1, 1)
        speed = 0
        vsp = 0
        HSP = 0
        wspeed = 0
        fhsp = 0
        fvsp = 0
        ang[2] = 90 + tubedir
        if (tubespd < 8)
            tubespd += 0.05
        x += lengthdir_x(tubespd, tubedir)
        y += lengthdir_y(tubespd, tubedir)
        if (tubedir != tubedirto)
        {
            if (tubedirto > tubedir)
                tubedir += 22.5
            if (tubedirto < tubedir)
                tubedir -= 22.5
        }
    }
    else if (!DEAD)
    {
        if (buis_sound_snd != -1)
        {
            scrSoundSpec(472)
            scrSoundStop(buis_sound_snd)
            buis_sound_snd = -1
        }
        if ((UD[2] == 0 || (move < 7 && move != 2) || move >= 9) && move != 5 && move != 1.3 && (!is_message()) && (!obj_exists(objDialogueChoice)) && PARALYZED == 0 && (!obj_exists(objAnswerEmotion)) && (!obj_exists(parMenu)) && global.DialogueAllBusy == 0 && diab)
            inputable = 1
        else
            inputable = 0
        col_w_water = 0
        if obj_exists(parWaterBlock)
        {
            if (collision_point(x, y, parWaterBlock, 1, 1) && collision_rectangle(bbox_left, bbox_top, bbox_right, (bbox_top + 13), parWaterBlock, 1, 1))
            {
                var incw = instance_nearest(x, y, parWaterBlock)
                scrFillWater(incw.image_blend)
                col_w_water = 1
                var tpois = 0
                if (curItem != 42)
                {
                    switch room
                    {
                        case rm_24_402:
                            tpois = 1
                            break
                        default:
                            switch global.CurrentWorld
                            {
                                case 7:
                                case 7.5:
                                    tpois = 1
                                    if global.RVAR[119]
                                        tpois = 0
                                    break
                            }

                            break
                    }

                    if tpois
                    {
                        if (poison < 1)
                            poison += 0.025
                        if (poison >= 1)
                            poison = 1
                        poison_colour = merge_colour(poison_colour, incw.col2, 0.05)
                    }
                }
            }
        }
        if (col_w_water == 1)
        {
            if (swimming == 0)
                swim_splash = 1
            scrSwiMotion()
            swimming = 1
        }
        else
        {
            if (UD[0] != 0)
            {
                if (abs(UD[0]) < 0.15)
                    UD[0] = 0
                else
                    UD[0] *= 0.9
            }
            if (floor(move) == 9)
            {
                scrContactSolid(270, 3)
                UD[2] = 0
                if (move != 9.3)
                {
                    if (free == 1)
                        move = 1
                    else
                    {
                        move = 0
                        img[2] = 0
                    }
                }
            }
            swimming = 0
            scrMotion((global.holdR == 1 && inputable == 1), (global.pressJump == 1 && inputable == 1 && (!popo_grab)), (global.holdL == 1 && inputable == 1), fhsp, fvsp, 1)
        }
        if ((swimming == 0 && abs(wspeed) < (global.DELTA * (acc_spd * 0.6))) || (swimming == 1 && wspeed < (global.DELTA * 0.1) && wspeed > ((-global.DELTA) * 0.1)))
        {
            if (wspeed != 0)
            {
                if (x != round(x))
                {
                    if (!(place_meeting(round(x), y, parAnyBlock)))
                        x = round(x)
                }
            }
            wspeed = 0
            if (swimming == 0)
                img[3] = 0
        }
        if (curItem == 5 && PARALYZED == 0 && inputable)
        {
            if (global.CursorHold && global.Diable)
            {
                img[2] = 27
                var max_lantarn_scale = 1 + (lengthdir_x(1, ((point_direction(x, y, global.CursorX, global.CursorY)) - 90)))
                if (max_lantarn_scale < 1)
                    max_lantarn_scale = 1
                if (wepAdObj == objLantarnLight)
                {
                    if (wepAdObj.SCALE < max_lantarn_scale)
                        wepAdObj.SCALE += 0.05
                }
            }
            else
            {
                if (img[2] == 27)
                    img[2] = 0
                if ((wepAdObj == objLantarnLight) > 0)
                {
                    if (wepAdObj.SCALE > 1)
                        wepAdObj.SCALE -= 0.05
                }
            }
        }
        if (diab && move != 5 && visible)
        {
            scrBoboInput()
            var not_spitting_water = 1
            switch curItem
            {
                case (2 << 0):
                case (78 << 0):
                case (182 << 0):
                    if (gml_Script_CheckAlarm(1) >= 0)
                        not_spitting_water = 0
                    break
            }

            whistlehold -= 1
            if ((global.ActionWhistle || (global.ActionWhistleHold && whistlehold <= 0)) && not_spitting_water)
                scrBoboWhistle()
        }
        scrWumAnimationsN()
        scrBoboDrawStep()
    }
}
if (gml_Script_CheckAlarm(0) == -1)
    alarmSet(0, 100)
if (gml_Script_CheckAlarm(11) == -1)
    alarmSet(11, 100)
if (global.ItemSwitchTrigger1 || global.ItemSwitchTrigger2)
{
    var able = 0
    if global.boss[1]
        able = 1
    else if scrCheckWehaQ(1)
        able = 1
    if able
    {
        if (!scrBoboAbleToSwitchItem(0))
            able = 0
    }
    if able
    {
        if (global.Diable && PARALYZED != 1 && inputable == 1)
        {
            if (curItem == global.specialitem_id[0] || curItem == global.specialitem_id[1] || curItem == global.specialitem_id[2])
                scrWEAPTO(global.bobo_main_item)
            else
            {
                WEAPTO = -1
                if global.ItemSwitchTrigger2
                    WEAPTO = -1.1
                if (wepswap == 0)
                {
                    waniforce = 0
                    wepswap = 0.1
                }
                else if (waniforce > 0.2)
                {
                    waniforce = 0
                    wepswap = 0.1
                    wepup = 0
                    wepscale = 1
                    scrChangeWeapon()
                    scrSetAutoFire()
                    UD[2] = 0
                }
            }
        }
    }
}
sleep_alarm -= 1
if (sleep_alarm <= 0)
{
    if (!scrBoboNoSleepHere())
        scrBoboFallAsleep()
    else
        sleep_alarm = sleep_alarm_base
}
