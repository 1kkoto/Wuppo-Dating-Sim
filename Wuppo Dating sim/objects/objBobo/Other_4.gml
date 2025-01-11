if place_meeting(x, y, parSolid)
{
    if (x > (room_width - 16))
        wspeed *= 0.5
    if (x < 16)
        wspeed *= 0.5
}
var itmoney1 = global.specialitem_id[1]
var itmoney2 = global.specialitem_id[2]
switch curItem
{
    case itmoney1:
    case itmoney2:
        GiveToID = -1
        break
}

halfX = 0
halfY = 0
