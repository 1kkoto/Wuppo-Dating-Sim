var extr = instance_exists(objEXTRheal)
wepup = 0
var healS = 1
var healT = 1
HealingFinal = 5
HealingChew = 1
var HealingThis = 0
if extr
{
    healS = objEXTRheal.healS
    healT = objEXTRheal.healT
    HealingFinal = objEXTRheal.healingF
    HealingChew = objEXTRheal.healingC
    with (objEXTRheal)
        instance_destroy()
}
else
{
    HealingThis = scrCheckItemHeal2(curItem)
    switch scrCheckItemHeal(curItem)
    {
        case 0:
            healT = 15
            break
        case 1:
            healT = 20
            break
        case 2:
            healT = 25
            break
        case 3:
            healT = 25
            break
        case 5:
            healT = 25
            break
        default:
            healT = 15
            break
    }

    scrHealSpecial(curItem)
    scrRemoveItemFromInventoryReplaceSC(curItem)
    healS = HealingThis - (5 + healT)
}
var tfat_add = scrCheckItemHealFat(curItem)
if (tfat_add || (!eating))
{
    if (bod_fat <= 21)
        bod_fat += 2
    scrBoboBodFatGrowth()
}
scrSound(10)
if (move != 6)
{
    scrBoboDuck(0)
    alarmSet(4, 12)
    img[2] = 15
}
eating = 1
if (eatingtime <= 0)
    eatingtime = 0
eatingtime += healT
repeat healS
    instance_create((x - 10 + random(20)), (y - 10 + random(20)), objHp1)
