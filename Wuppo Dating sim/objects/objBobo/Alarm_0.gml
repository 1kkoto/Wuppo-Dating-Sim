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