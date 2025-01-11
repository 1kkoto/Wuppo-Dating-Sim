if (floor(move) == 6)
    return;
scrBoboDuck(1)
img[2] = 0
var cancel_throw = 0
if (curItem != 0 && wepswap == 0)
{
    var tempthrowitem = instance_create(x, y, objThrowItem)
    if instance_exists(tempthrowitem)
    {
        tempthrowitem.ORIGIN = id
        if (instance_exists(throwItemTarget) || throwItemTarget == self)
        {
            if (throwItemTarget != self)
            {
                tempthrowitem.Tx = throwItemTarget.x
                tempthrowitem.Ty = throwItemTarget.y
                tempthrowitem.TARG = throwItemTarget.id
                throwItemTarget = -1
            }
            else
            {
                tempthrowitem.Tx = global.CursorX
                tempthrowitem.Ty = global.CursorY
                tempthrowitem.TARG = -1
            }
        }
        else
            cancel_throw = 1
        if (!cancel_throw)
        {
            if (curItem != global.specialitem_id[0] && curItem != global.specialitem_id[1] && curItem != global.specialitem_id[2])
            {
                var curwep = scrCurrentWeapon()
                if (curwep >= 0)
                    tempthrowitem.image_blend = wepCol[curwep]
            }
            if (curItem == global.specialitem_id[0])
            {
                tempthrowitem.sprite_index = sprFilmroll1
                tempthrowitem.image_index = FRwear
                tempthrowitem.film = FRwear2
                tempthrowitem.filma_group = FRwear3
                tempthrowitem.filma_number = FRwear4
            }
            else if (curItem == global.specialitem_id[1])
            {
                global.moneh -= CarryMoney
                tempthrowitem.sprite_index = sprMoneh
                tempthrowitem.image_index = 0
                tempthrowitem.money = CarryMoney
                CarryMoney = 0
            }
            else if (curItem == global.specialitem_id[2])
            {
                global.splenkhakkercoins -= CarryMoney
                tempthrowitem.sprite_index = sprSplenkhakkerCoin
                tempthrowitem.image_index = 0
                tempthrowitem.splenkmoney = CarryMoney
                CarryMoney = 0
            }
            else
            {
                if (curItem == 8)
                {
                    global.PJ1_newspapers -= 1
                    WEAPTO = 8
                    scrRemoveItemFromInventory(curItem)
                }
                else
                    scrRemoveItemFromInventory(curItem)
                tempthrowitem.sprite_index = sprWehaInventory2
                tempthrowitem.image_index = curItem + 3
            }
        }
    }
    if (!cancel_throw)
    {
        if (curItem == global.specialitem_id[0] && (!instance_number(objDSboboKeepWearingAfterThrow)))
        {
            if (prevItem == global.specialitem_id[0])
                scrWEAPTO(global.bobo_main_item)
            else
                scrWEAPTO(prevItem, prevItemCol)
        }
        else if ((curItem == global.specialitem_id[1] || curItem == global.specialitem_id[2]) && (!instance_number(objDSboboKeepWearingAfterThrow)))
        {
            scrWEAPTO(prevItem, prevItemCol)
            wepswap = 1.38
            if (!free)
                vsp = -2
        }
        else
        {
            if (curItemQ <= 0)
                curItem = 0
            waniforce = 0
            wepswap = 0.1
            WEAPTO = curItem
        }
        with (objDSboboKeepWearingAfterThrow)
            instance_destroy()
    }
}
