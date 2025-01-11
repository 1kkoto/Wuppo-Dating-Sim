function scrBoboDrawStep() //gml_Script_scrBoboDrawStep
{
    LDyFaceStuff = ang[1] + ang[2] + ang[4] - 90
    BODY_HEIGHTx = lengthdir_x((-bod_h), LDyFaceStuff)
    BODY_HEIGHTy = lengthdir_y((-bod_h), LDyFaceStuff)
    FACE_HEIGHTx = lengthdir_x((-bod_faceh), LDyFaceStuff)
    FACE_HEIGHTy = lengthdir_y((-bod_faceh), LDyFaceStuff)
    ang[3] = pd
    if (swimming == 0)
    {
        var checkslope = 0
        if (!free)
            checkslope = (on_slope && (!(collision_point(x, (bbox_bottom + 1), objBlock1, 0, 1))))
        if checkslope
        {
            var ang1to = scrGetAngle()
            if (ang1to != 0)
            {
                if (free_previous || landed || wspeed == 0)
                    ang[1] = ang1to
                else
                    ang[1] = lerp(ang[1], (ang[1] - (angle_difference(ang[1], ang1to))), 0.3)
            }
            if (ang[1] < 0)
                ang[1] += 360
            else if (ang[1] > 360)
                ang[1] -= 360
        }
        else if (vsp == 0 && (!free))
            ang[1] = lerp(ang[1], (ang[1] - (angle_difference(ang[1], 0))), 0.3)
        else
            ang[1] = 0
        if (ang[1] > 180)
            UD[1] = lengthdir_x(6, (ang[1] + 90))
        else
            UD[1] = lengthdir_x(-6, (ang[1] + 90))
    }
    else if (ang[1] != 0)
    {
        ang[1] *= 0.9
        if (abs(ang[1]) < 0.1)
            ang[1] = 0
    }
    if (UD[2] == 5)
    {
        if free
        {
            if (move == 2)
                move = 0
            UD[2] = 0
        }
    }
}

