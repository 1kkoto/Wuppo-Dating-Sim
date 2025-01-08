if (bbox_left == 0)
{
    image_xscale += 1
    x -= 16
}
if (bbox_right >= room_width)
    image_xscale += 1
if (room != rm_6_12)
{
    if (bbox_top == 0)
    {
        image_yscale += 1
        y -= 16
    }
    if (bbox_bottom >= room_height)
        image_yscale += 1
}
image_alpha = 0.5
