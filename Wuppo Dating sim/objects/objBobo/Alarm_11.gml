if (visible == true)
{
    if (img[2] == 0 || (img[2] == 28 && instance_number(objDialogueChoice)))
    {
        alarmSet(11, 5)
        img[2] += 1
        scrSound(4)
    }
    else if (img[2] != 15 && img[2] != 16 && img[2] != 17)
    {
        alarmSet(11, (100 + random(200)))
        if (img[2] == 29)
            img[2] = 28
        else if (img[2] == 1 || img[2] == 15)
        {
            if (random(4) >= 3 && img[2] == 15)
                alarmSet(11, (5 + random(10)))
            img[2] = 0
        }
    }
}
else
    alarmSet(11, 100)
