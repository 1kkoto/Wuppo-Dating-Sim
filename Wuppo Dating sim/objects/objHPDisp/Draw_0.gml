var BOBCOL = c_white
if instance_exists(BOBO)
    BOBCOL = BOBO.col[1]
if (scale > 0)
{
    var W = 64
    var H = 64
    var hap = 0.01 * global.happiness
    var sc = SCALE * scale
    var tpoison_animation = 0.9 + (lengthdir_x(0.1, (5 * poison * poison_ani)))
    if poison
        sc *= tpoison_animation
    if heal_cooldown
    {
        var cooldown_imgat = heal_cooldown_images - heal_cooldown_images * (heal_cooldown / heal_cooldown_initialized)
        heal_cooldown_ani += 3
        var sc42 = sc * (0.85 + (lengthdir_x(0.025, heal_cooldown_ani)))
        var tcl = c_white
        if heal_cooldown_cancelheal
            tcl = 255
        draw_sprite_ext(sprHPcooldown, cooldown_imgat, (x + shake), y, sc42, sc42, (image_angle + (lengthdir_x(5, heal_cooldown_ani))), tcl, (1 * alpha2))
    }
    if (hap > 0)
    {
        if (!surface_exists(surf))
            surf = surface_create(W, H)
        surface_set_target(surf)
        draw_clear_alpha(c_black, 0)
        var SCEL = sc * 1.25 + scale2
        if chigov
            draw_sprite_ext(sprHPwhite, lastPU, (32 + shake), 32, SCEL, SCEL, image_angle, make_colour_rgb(227, 104, 76), 1)
        else
            draw_sprite_ext(sprHP2, lastPU, (32 + shake), 32, SCEL, SCEL, image_angle, c_white, 1)
        if (hap < 1)
        {
            draw_set_blend_mode(3)
            draw_set_kolor_optimalised(c_black)
            draw_set_alpha_optimalised(1)
            draw_sprite_ext(sprHPdisp, (indHp2 + ind2), 32, 32, (SCALE * (0.8 * scale) + scale2), (-((SCALE * (0.6 * scale) + scale2))), 0, c_black, 1)
        }
        draw_set_blend_mode(0)
        surface_reset_target()
    }
    var pscel = SCALE
    if (scale < 1)
        pscel = scale * SCALE
    draw_sprite_ext(sprite_index, 37, (x + shake), y, pscel, pscel, point_direction(x, y, BOBO.x, BOBO.y), BOBCOL, (1 * alpha2))
    if poison
    {
        poison_ani += 1
        var poison_scale = 0.3 + 0.5 * (poison * tpoison_animation)
        draw_sprite_ext(sprBubbleBig, (0 + ind2), (x + shake), y, (sc * poison_scale), (sc * poison_scale), (image_angle - (lengthdir_x(10, (poison_ani * 2)))), poison_colour, 1)
    }
    draw_sprite_ext(sprite_index, 35, (x + shake), y, sc, sc, image_angle, c_white, 1)
    var COLARIA = BOBCOL
    var sat = colour_get_saturation(COLARIA)
    var hue = colour_get_hue(COLARIA)
    var val = colour_get_value(COLARIA)
    val *= 6
    if (val >= 255)
        val = 255
    COLARIA = make_colour_hsv(hue, sat, val)
    draw_sprite_ext(sprite_index, (ind + ind2), (x + shake), y, sc, sc, image_angle, COLARIA, alpha2)
    if chigov
        draw_sprite_ext(sprHPwhite, lastPU, (x + shake), y, (sc * 1.25 + scale2), (sc * 1.25 + scale2), image_angle, make_colour_rgb(252, 75, 151), (alpha2 * 1.25))
    else
        draw_sprite_ext(sprHP, lastPU, (x + shake), y, (sc * 1.25 + scale2), (sc * 1.25 + scale2), image_angle, c_white, (alpha2 * 1.25))
    if (hap > 0)
    {
        draw_set_alpha_optimalised(1)
        draw_surface(surf, (x - 32), (y - 32))
    }
    draw_sprite_ext(sprite_index, 36, (x + shake), y, sc, sc, image_angle, c_white, (1 * alpha2))
    if (hpupimg >= 0)
    {
        var hpupalp = hpupimg * 0.1
        if (hpupalp > 1)
            hpupalp = 1
        if (hpupimg > 20)
            hpupalp = 1 - (hpupimg - 10) * 0.02
        draw_sprite_ext(sprHPup, hpupimg, (x + shake), y, sc, sc, image_angle, c_white, hpupalp)
    }
    if poison
    {
        var tdist = 5
        tang = 0
        repeat (5)
        {
            var tX = x + shake + (lengthdir_x(tdist, tang))
            var tY = y + 8 + (lengthdir_y(tdist, tang))
            var tscal = poison * (sc * (0.8 + (lengthdir_x(0.8, (3 * poison_ani + (2 * tdist + tang))))))
            draw_sprite_ext(sprPTCbubble1, ind2, tX, tY, tscal, tscal, image_angle, poison_colour, 1)
            tang += 40
            tdist = 8 + (lengthdir_x(4, (tang * 3)))
        }
        draw_sprite_ext(sprBubbleBig, (0 + ind2), (x + shake), y, (sc * poison_scale), (sc * poison_scale), (image_angle + 180 + (lengthdir_x(10, (poison_ani * 3)))), poison_colour, (0.5 * poison))
    }
    draw_sprite_ext(sprite_index, (45 + ind2), (x + shake), y, sc, sc, image_angle, BOBCOL, 1)
    draw_set_font(global.numberfont2)
    draw_set_alpha_optimalised(1)
    draw_set_kolor_optimalised(merge_colour(c_white, BOBCOL, 0.5))
    var tposx = x + 16
    if (Hp[1] >= 100)
        tposx -= 3
    var sssccc334 = show_hp_number
    if (sssccc334 > 1)
        sssccc334 = 1
    if (show_hp_number > (show_hp_number_default - 0.5))
        sssccc334 += (show_hp_number_default - show_hp_number)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    var hpsho = round(Hp[1])
    draw_text_transformed(tposx, (y - 9), string_hash_to_newline(hpsho), (sssccc334 * sc), (sssccc334 * sc), 0)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}
