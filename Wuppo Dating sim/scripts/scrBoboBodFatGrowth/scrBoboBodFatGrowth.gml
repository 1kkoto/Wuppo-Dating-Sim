function scrBoboBodFatGrowth() //gml_Script_scrBoboBodFatGrowth
{
    body = scrReturnBodFatBody(bod_fat)
    switch bod_fat
    {
        case 0:
        case 1:
            bod_h = 0
            bod_faceh = 0
            break
        case 2:
        case 3:
            bod_h = 1
            bod_faceh = 0
            break
        case 4:
        case 5:
            bod_h = 2
            bod_faceh = 0
            break
        case 6:
        case 7:
            bod_h = 3
            bod_faceh = 1
            break
        case 8:
        case 9:
            bod_h = 4
            bod_faceh = 2
            break
        case 10:
        case 11:
            bod_h = 5
            bod_faceh = 3
            break
        case 12:
        case 13:
            bod_h = 6
            bod_faceh = 3
            break
        case 14:
        case 15:
            bod_h = 8
            bod_faceh = 4
            break
        case 16:
        case 17:
            bod_h = 10
            bod_faceh = 6
            break
        default:
            bod_h = 13
            bod_faceh = 10
            break
    }

}

