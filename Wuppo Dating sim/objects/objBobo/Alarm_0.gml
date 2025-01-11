alarmSet(0, 10)
if (img[1] < 3)
    img[1] += 1
else
    img[1] = 0
scrWumImg4(0)
if (eating == 1)
{
    if (eatingtime <= 2)
        img[2] = 17
    else if (img[2] == 15)
        img[2] = 16
    else
    {
        scrSound(11)
        img[2] = 15
        if (HealingChew > 0)
        {
            repeat HealingChew
                instance_create((x - 1 + random(2)), (y - 1 + random(2)), objHp1)
        }
    }
    eatingtime -= 1
    if (eatingtime <= 0)
    {
        if (HealingFinal > 0)
        {
            repeat HealingFinal
                instance_create((x - 10 + random(20)), (y - 10 + random(20)), objHp1)
        }
        scrSound(12)
        if obj_exists(objDShappyAfterEating)
        {
            scrHappiness(1, instance_number(objDShappyAfterEating))
            with (objDShappyAfterEating)
                instance_destroy()
        }
        eating = 0
        img[2] = 0
        if (move < 5)
        {
            scrBoboDuck(0)
            alarmSet(4, 12)
        }
        bod_fat -= 2
        if (bod_fat <= 0)
            bod_fat = 0
        scrBoboBodFatGrowth()
    }
}
if (curItem == 3)
{
    if (img[2] >= 20)
    {
        if (img[2] < 22)
            img[2] += 1
        else
            img[2] = 0
    }
}
scrWumDirtSurfaceCheckSizes()
scrWumDirtSurfaceDecrease(0)
if (wet > 0)
{
    wet -= 0.2
    if (move < 9)
        scrParticleColor((bbox_left + random(sprite_width)), (bbox_top + random(8)), 68, 1, wet_colour)
    if (wet <= 0)
        wet = 0
}
if (heath > 0)
{
    if (braad_sound_snd == -1)
    {
        braad_sound_snd = scrSound(26, 1, 0)
        scrSoundGain(braad_sound_snd, 0, 0)
    }
    if (heath > 0.5 && visible)
    {
        with (HPdisp)
        {
            M = 1
            if (gml_Script_CheckAlarm(1) < 200)
                alarmSet(1, 200)
        }
        var heath_dmg = 1
        if ((heath > 0.75 && (img[1] == 0 || img[1] == 2)) || (heath > 0.5 && img[1] == 0))
        {
            scrSound(22)
            with (objHPdisp)
            {
                var f = scrDmg(heath_dmg, 1, x, y, id)
                f.AnimationStyle = 0
                scrParticle(x, y, 48, 2)
                scale = 0.8
                scale2 = 0.6
                shake = 5
            }
            Hp[1] -= heath_dmg
            if (room != rm_43_394)
                global.totdmgTaken += heath_dmg
            if (Hp[1] <= 0)
                scrBoboDead()
            if (bod_fat > 0)
            {
                bod_fat -= 1
                scrBoboBodFatGrowth()
            }
        }
    }
    heath -= 0.03
    if (heath <= 0)
    {
        heath = 0
        if (heath_obj != self)
        {
            if instance_exists(heath_obj)
            {
                with (heath_obj)
                    instance_destroy()
            }
            heath_obj = self
        }
    }
    else if (heath_obj == self)
    {
        heath_obj = instance_create(x, y, objMiniSmoketrail)
        heath_obj.TARGET = id
        heath_obj.strokes = 2
        heath_obj.persistent = persistent
    }
    if (heath_obj != self)
    {
        if instance_exists(heath_obj)
        {
            heath_obj.visible = visible
            heath_obj.depth = depth
            heath_obj.image_alpha = heath
        }
        else
            heath_obj = self
    }
}
if (heath <= 0 || (!visible))
{
    if (braad_sound_snd != -1)
    {
        scrSoundStop(braad_sound_snd)
        braad_sound_snd = -1
    }
}
if (poison > 0)
{
    col[1] = merge_colour(col[1], poison_colour, (0.01 * poison))
    if (poison_sound_snd == -1)
    {
        poison_sound_snd = scrSound(27, 1, 0)
        scrSoundGain(poison_sound_snd, 0, 0)
    }
    if (poison > 0.5 && visible)
    {
        with (HPdisp)
        {
            M = 1
            if (gml_Script_CheckAlarm(1) < 200)
                alarmSet(1, 200)
        }
        var poison_dmg = 1
        if ((poison > 0.75 && (img[1] == 0 || img[1] == 2)) || (poison > 0.5 && img[1] == 0))
        {
            scrSound(22)
            with (objHPdisp)
            {
                f = scrDmg(poison_dmg, 1, x, y, id)
                f.AnimationStyle = 0
                poison_colour = other.poison_colour
                scale = 0.9
                scale2 = 0.8
                shake = 5
            }
            Hp[1] -= poison_dmg
            if (Hp[1] <= 0)
                scrBoboDead()
            global.totdmgTaken += poison_dmg
            if (bod_fat > 0)
            {
                bod_fat -= 1
                scrBoboBodFatGrowth()
            }
        }
    }
    poison -= 0.01
    if (poison < 0.5)
        poison -= 0.04
    if (poison <= 0)
    {
        poison = 0
        if (poison_obj != self)
        {
            if instance_exists(poison_obj)
            {
                with (poison_obj)
                    instance_destroy()
            }
            poison_obj = self
        }
    }
    else if (poison_obj == self)
    {
        poison_obj = instance_create(x, y, objDSpoisoned)
        poison_obj.poison_colour = poison_colour
        poison_obj.TARGET = id
        poison_obj.persistent = persistent
    }
    if (poison_obj != self)
    {
        if instance_exists(poison_obj)
        {
            poison_obj.visible = visible
            poison_obj.depth = depth
            poison_obj.image_alpha = poison
        }
        else
            poison_obj = self
    }
}
if (poison <= 0 || (!visible))
{
    if (poison_sound_snd != -1)
    {
        scrSoundStop(poison_sound_snd)
        poison_sound_snd = -1
    }
}