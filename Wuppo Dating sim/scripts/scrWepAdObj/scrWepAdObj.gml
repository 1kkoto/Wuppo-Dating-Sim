function scrWepAdObj() //gml_Script_scrWepAdObj
{
    for (var i = 0; i <= 1; i += 1)
    {
        if (argument_count > i)
            arg[i] = argument[i]
        else
            arg[i] = 0
    }
    var isBobo = 0
    if (object_index == objBobo)
    {
        isBobo = 1
        objController.curid = 0
    }
    if arg[0]
    {
        var PreviousWepAdObjId = self
        if (wepAdObj != self)
        {
            PreviousWepAdObjId = wepAdObj
            wepAdObj = instance_create(x, y, objBlank)
        }
    }
    if (wepAdObj != self)
    {
        with (wepAdObj)
            instance_destroy()
        wepAdObj = self
    }
    var tMyRace = scrReturnRace()
    if (object_index != objBobo)
    {
        if (tMyRace != 4)
        {
            if (TARGET != self)
            {
                if (TARGET != id)
                {
                    if (TARGET != object_index)
                    {
                        with (TARGET)
                            instance_destroy()
                    }
                }
            }
        }
    }
    Hp[3] = 0
    if (tMyRace == 0)
        var prevface = -1
    else
        prevface = face
    if (curItem <= 1)
        face = 176
    else if (curItem < 200)
    {
        switch curItem
        {
            case (2 << 0):
                face = 176
                if isBobo
                {
                    if global.powerup[2]
                        face = 178
                }
                break
            case (3 << 0):
                face = 194
                break
            case (4 << 0):
                face = 188
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case (5 << 0):
                face = 194
                wepAdObj = instance_create(x, y, objLantarnLight)
                with (wepAdObj)
                {
                    BOBO = other.id
                    scrMiniFlameIni(0.5, 363)
                }
                break
            case (6 << 0):
                face = 195
                break
            case 7:
                face = 195
                break
            case (8 << 0):
                face = 195
                scrWepAdObjDeliverysuitPoster()
                break
            case 9:
                face = 193
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 10:
                face = 195
                break
            case 11:
                face = 176
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 12:
                face = 176
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboPopoHatWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 13:
                face = 194
                if (object_index == objBobo)
                    var obj = objLampHelmetLight
                else
                    obj = objWumLampHelmetLight
                wepAdObj = instance_create(x, y, obj)
                wepAdObj.BOBO = id
                break
            case 14:
                face = 337
                break
            case 15:
                face = 176
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboBazookaWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 16:
                face = 195
                break
            case 17:
                face = 195
                Hp[3] = 0.35
                break
            case 18:
                face = 194
                break
            case 19:
                face = 176
                break
            case 20:
                face = 195
            case 21:
                face = 195
                break
            case 22:
                face = 195
                break
            case 23:
                face = 194
                break
            case 24:
                face = 195
                break
            case 25:
                face = 195
                wepAdObj = instance_create(x, y, objBoboBirdukus)
                var tcolOut = -1
                if global.betasnavel
                    tcolOut = 0
                else if global.denksnavelcolor
                    tcolOut = global.denksnavelcolor
                if (tcolOut != -1)
                {
                    wepAdObj.DIFFERENT_COLOR = 1
                    scrShiftColorShaderIni(wepAdObj, 0, tcolOut)
                }
                wepAdObj.BOBO = id
                break
            case 26:
                face = 195
                break
            case (27 << 0):
                face = 194
                wepAdObj = instance_create(x, y, objBoboMatchHat)
                with (wepAdObj)
                {
                    BOBO = other.id
                    scrMiniFlameIni(0.4, 363)
                }
                break
            case 28:
                face = 195
                break
            case 29:
                face = 195
                break
            case 31:
                face = 188
                break
            case 32:
                face = 195
                break
            case 33:
                face = 194
                break
            case 34:
                face = 195
                break
            case 35:
                face = 195
                break
            case 36:
                face = 194
                break
            case 37:
                face = 194
                break
            case 38:
                face = 195
                break
            case 39:
                face = 195
                break
            case 40:
                face = 195
                break
            case 41:
                face = 195
                break
            case 42:
                face = 186
                wepAdObj = instance_create(x, y, objBoboWepLight)
                wepAdObj.BOBO = id
                with (wepAdObj)
                {
                    image_alpha = 0.1
                    sprite_index = sprBoboSwimSuitLight
                }
                break
            case 43:
                face = 176
                wepAdObj = instance_create(x, y, objBoboGemeenteraadWepObj)
                wepAdObj.BOBO = id
                break
            case 44:
                face = 195
                wepAdObj = instance_create(x, y, objBoboRadioWepObj)
                wepAdObj.BOBO = id
                break
            case 45:
                face = 337
                break
            case 46:
                face = 337
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                with (wepAdObj)
                {
                    image_alpha = 1
                    ani = random(360)
                    image_yscale = 0
                    sprite_index = sprSireneLight
                }
                break
            case 47:
                face = 194
                break
            case 48:
                face = 195
                break
            case 49:
                face = 194
                break
            case 50:
                face = 195
                break
            case 51:
                face = 195
                break
            case 52:
                face = 195
                break
            case 53:
                face = 195
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 54:
                face = 194
                break
            case 55:
                face = 195
                wepAdObj = instance_create(x, y, objBoboBliekmblockWepObj)
                wepAdObj.BOBO = id
                if (object_index != objBobo)
                    wepAdObj.isBobo = 0
                break
            case 56:
                face = 194
                break
            case 57:
                face = 348
                break
            case 58:
                face = 348
                break
            case 59:
                face = 194
                wepAdObj = instance_create(0, 0, objBoboBrefthatWepObj)
                wepAdObj.BOBO = id
                break
            case 60:
                face = 337
                break
            case 61:
                face = 337
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 62:
                face = 195
                break
            case 63:
                face = 182
                wepAdObj = instance_create(0, 0, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 64:
                face = 176
                break
            case 65:
                face = 195
                wepAdObj = instance_create(0, 0, objBoboMiniFnak)
                wepAdObj.BOBO = id
                break
            case 66:
                face = 194
                break
            case 67:
                face = 194
                break
            case 68:
                face = 194
                break
            case 69:
                face = 194
                break
            case 70:
                face = 188
                break
            case 71:
                face = 176
                break
            case 72:
                face = 338
                break
            case 73:
                face = 188
                break
            case 74:
                face = 179
                break
            case 75:
                face = 188
                wepAdObj = instance_create(0, 0, objBoboBliekCarry)
                wepAdObj.BOBO = id
                break
            case 76:
                face = 176
                wepAdObj = instance_create(0, 0, objBoboBliekCarry)
                wepAdObj.BOBO = id
                break
            case 77:
                face = 194
                break
            case 78:
                face = 178
                break
            case 80:
                face = 195
                Hp[3] = -3
                wepAdObj = instance_create(0, 0, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 81:
                face = 343
                break
            case 82:
                face = 195
                wepAdObj = instance_create(0, 0, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 83:
                face = 195
                break
            case 84:
                face = 194
                break
            case 85:
                face = 195
                wepAdObj = instance_create(0, 0, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 86:
                face = 337
                wepAdObj = instance_create(0, 0, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 87:
                face = 195
                break
            case 88:
                face = 194
                break
            case 89:
            case 90:
            case 91:
            case 92:
            case 93:
                face = 195
                break
            case 94:
            case 95:
            case 96:
                face = 195
                break
            case 97:
            case 98:
            case 99:
            case 100:
            case 101:
                face = 195
                break
            case 102:
                face = 195
                break
            case 103:
                face = 195
                break
            case 104:
                face = 183
                break
            case (105 << 0):
                face = 194
                wepAdObj = instance_create(0, 0, objBoboLightbulbWepAdObj)
                if instance_exists(wepAdObj)
                    wepAdObj.BOBO = id
                else
                    wepAdObj = self
                break
            case 106:
                face = 176
                break
            case 107:
                face = 176
                break
            case 108:
                face = 176
                break
            case 109:
                face = 176
                break
            case 110:
                face = 188
                break
            case 111:
                face = 188
                break
            case 112:
                face = 176
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 113:
                face = 176
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 114:
                face = 195
                break
            case 115:
                face = 195
                break
            case 116:
                face = 349
                break
            case 117:
                face = 194
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                with (wepAdObj)
                    alarmSet(0, 1)
                break
            case 118:
                face = 194
                wepAdObj = instance_create(x, y, objBoboKnevisHat)
                wepAdObj.BOBO = id
                break
            case 119:
                face = 176
                break
            case 120:
                face = 176
                break
            case 121:
                face = 176
                break
            case 122:
                face = 183
                break
            case 123:
                face = 176
                if isBobo
                {
                    wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                    wepAdObj.BOBO = id
                }
                break
            case 124:
                face = 195
                break
            case 125:
                face = 176
                break
            case 126:
                face = 176
                break
            case 127:
                face = 176
                break
            case 128:
                face = 176
                break
            case 129:
                face = 176
                break
            case 130:
                face = 176
                break
            case 131:
                face = 348
                break
            case 132:
                face = 195
                if (global.anual_event == 3)
                    Hp[3] = 0.5
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 133:
                face = 195
                break
            case 134:
                face = 337
                break
            case 135:
                face = 195
                break
            case 136:
                face = 176
                break
            case 137:
                face = 176
                break
            case 138:
                face = 195
                break
            case 139:
                face = 188
                break
            case 140:
                face = 188
                break
            case 141:
                face = 176
                break
            case 142:
                face = 337
                break
            case 143:
                face = 337
                break
            case 144:
                face = 176
                break
            case 145:
                face = 176
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 146:
                face = 176
                break
            case 147:
                face = 195
                break
            case 148:
                face = 195
                break
            case 149:
                face = 194
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 158:
                face = 176
                break
            case 159:
                face = 194
                break
            case 160:
                face = 195
                break
            case 164:
                face = 194
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboBazookaWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 165:
                face = 176
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboBazookaWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 166:
                face = 194
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboBazookaWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 167:
                face = 194
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboBazookaWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 168:
                face = 194
                if (object_index == objBobo)
                {
                    wepAdObj = instance_create(x, y, objBoboBazookaWepObj)
                    wepAdObj.BOBO = id
                }
                break
            case 169:
                face = 176
                break
            case 170:
                face = 195
                break
            case 171:
                face = 195
                break
            case 172:
                face = 195
                break
            case 173:
                face = 195
                break
            case 174:
                face = 195
                break
            case 175:
                face = 194
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 176:
                face = 338
                wepAdObj = instance_create(x, y, objBoboWepAdObjMain)
                wepAdObj.BOBO = id
                break
            case 177:
                face = 195
                break
            case 178:
                face = 195
                scrWepAdObjDeliverysuitPoster()
                break
            case 179:
                face = 195
                scrWepAdObjDeliverysuitPoster()
                break
            case 180:
                face = 195
                scrWepAdObjDeliverysuitPoster()
                break
        }

    }
    if (wepAdObj != self)
    {
        wepAdObj.WEAPON = curItem
        if (object_index != objBobo)
        {
            wepAdObj.persistent = 0
            if (TARGET != -1)
                TARGET = instance_create(x, y, objBlank)
        }
    }
    else if (curItem == 79)
        face = 195
    if (curItem == global.specialitem_id[0])
        face = 176
    if (curItem == global.specialitem_id[1])
        face = 176
    if (curItem == global.specialitem_id[2])
        face = 176
    if (!scrCheckIfWum(id))
    {
        if (object_index != objBobo)
            face = prevface
    }
    if arg[0]
    {
        if (PreviousWepAdObjId != self)
        {
            with (wepAdObj)
                instance_destroy()
            if instance_exists(PreviousWepAdObjId)
                wepAdObj = PreviousWepAdObjId
        }
    }
}

