Hp[1] = BOBO.Hp[1]
Hp[2] = BOBO.Hp[2]
if (BOBO.object_index == objBobo)
    poison = BOBO.poison
alarmSet(0, 15)
ind = (round(10 * (Hp[1] / Hp[2]))) * 3
if (ind2 < 2)
    ind2 += 1
else
    ind2 = 0
indHp2 = (round(0.1 * (100 - global.happiness))) * 3
image_blend = BOBO.col[1]
