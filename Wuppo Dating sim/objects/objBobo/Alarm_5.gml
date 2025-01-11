hitable = 1
image_alpha = 1
if (move == 4)
{
    if ((!(place_meeting(x, (y + 1 + vsp), parBlock))) && (!(place_meeting(x, (y + 1 + vsp), parJTBlock))))
        move = 1.2
    else
        move = 4.1
}
if (img[2] == 3)
    img[2] = 0
if swimming
{
    repeat (20)
        scrCreateBubble(1335, x, y, (4 - random(8)), (4 - random(8)), (0.5 + random(0.5)), (10 + random(50)))
}
