if (DEAD == 0 && visible == true && (!obj_exists(objLoadGame)))
{
    var cancel = 0
    var special_check_rkschuif = instance_number(objRKgasthuisSchuif)
    if special_check_rkschuif
    {
        if place_meeting((x + wspeed + fhsp), (y + vsp + fhsp), parSolid)
            cancel = 1
    }
    if (!cancel)
    {
        var off = 0
        if (x > (room_width + off) || x < (-off) || y > (room_height + off) || y < (-off))
        {
            global.room_y_previous = global.room_y
            global.room_x_previous = global.room_x
            if (x > room_width)
                scrRoomChange(1)
            else if (x < 0)
                scrRoomChange(2)
            else if (y < 0 && (room != rm_6_12 || global.room_y == 12))
                scrRoomChange(3)
            else if (y > room_height && room != rm_6_12)
                scrRoomChange(4)
        }
    }
}
