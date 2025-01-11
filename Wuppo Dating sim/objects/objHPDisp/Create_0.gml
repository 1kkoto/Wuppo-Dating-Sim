Hp[2] = 100
Hp[1] = choose(10, 20, 50, 80, 90, 100)
alarmSet(0, 15)
ind2 = 0
ind = Hp[1] / Hp[2] * 30 + 1
shake = 0
scale = 0
scale2 = 0
SCALE = 0.55
lastPU = choose(0, 1, 2, 3, 4, 5)
DIST = 50
alpha1 = 0
alpha2 = 0.65
M = 0
DISTX = -39
BOBO = instance_nearest(x, y, objBobo)
surf = surface_create(sprite_width, sprite_width)
indHp2 = 0
hpupimg = -1
happiness_add = 0
scrGuiBallMovementIni()
poison = 0
poison_colour = 8388736
poison_ani = 0
heal_cooldown = 0
scrHPdispCooldownIni()
heal_cooldown_initialized = 0
heal_cooldown_images = 36
heal_cooldown_ani = 0
heal_cooldown_cancelheal = 0
show_hp_number = 0
show_hp_number_default = 30
chigov = scrCHIgov()
