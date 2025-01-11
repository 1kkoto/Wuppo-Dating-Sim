function scrReturnBodFatBody() //gml_Script_scrReturnBodFatBody
{
    for (var i = 0; i <= 1; i += 1)
    {
        if (argument_count > i)
            arg[i] = argument[i]
        else
            arg[i] = undefined
    }
    if (arg[0] == undefined)
        arg[0] = bod_fat
    switch arg[0]
    {
        case 0:
        case 1:
            var r = 7
            break
        case 2:
        case 3:
            r = 8
            break
        case 4:
        case 5:
            r = 9
            break
        case 6:
        case 7:
            r = 9
            break
        case 8:
        case 9:
            r = 11
            break
        case 10:
        case 11:
            r = 12
            break
        case 12:
        case 13:
            r = 13
            break
        case 14:
        case 15:
            r = 14
            break
        case 16:
        case 17:
            r = 15
            break
        default:
            r = 16
            break
    }

    return r;
}

