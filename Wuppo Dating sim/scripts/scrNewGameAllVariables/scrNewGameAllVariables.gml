function scrNewGameAllVariables() //gml_Script_scrNewGameAllVariables
{
    global.playtimeS = 0
    global.Time = 0
    global.Day = 0
    global.skytime = 180
    global.skytimeNight = 0.5 + (lengthdir_x(0.5, global.skytime))
    global.isNight = 0
    global.TimeDayStart = 540
    global.TimeNightStart = 340
    global.steam_tot_ach = 22
    for (var i = 0; i <= global.steam_tot_ach; i += 1)
        global.steam_ach_check[i] = 0
    scrSteamCheckAllAchievements()
    global.bobo_item_order[0][0] = -1
    global.bobo_item_order[1][0] = -1
    global.bobo_item_order[2][0] = -1
    global.bobo_item_order[3][0] = -1
    global.bobo_item_order_key = []
    global.bobo_item_order_heal = []
    global.bobo_item_order_etc = []
    var c_purp = make_colour_rgb(211, 134, 215)
    var c_blugray = make_colour_rgb(151, 145, 206)
    var c_dkgren = make_colour_rgb(111, 201, 99)
    var c_mudorang = make_colour_rgb(201, 176, 99)
    var c_ravgry = make_colour_rgb(121, 119, 125)
    global.denksnavelcolor = choose(255, c_purp, c_blugray, c_dkgren, c_mudorang, c_ravgry)
    if (!global.bossmode_unlocked)
        global.denksnavelcolor = 255
    global.minifnakcolor = make_colour_hsv(irandom(255), (40 + irandom(40)), 230)
    global.bankkrent_fase2_skip_intro = 0
    global.totalRVAR = 300
    for (i = 0; i <= global.totalRVAR; i += 1)
        global.RVAR[i] = 0
    scrRVARini()
    scrLoadGlobals()
    global.bird_jumpoff = 1
    global.newest_objective = 0
    global.last_objective = 0
    for (i = 0; i <= 100; i += 1)
        global.maxhpget[i] = -1
    global.happiness = 0
    global.maxhpget[0] = 3
    global.maxhpget[1] = 5
    global.maxhpget[2] = 3
    global.maxhpget[3] = 1
    global.maxhpget[4] = 5
    global.maxhpget[5] = 2
    global.maxhpget[6] = 1
    global.maxhpget[7] = 1
    global.maxhpget[8] = 7
    global.maxhpget[9] = 5
    global.maxhpget[10] = 10
    global.maxhpget[11] = 1
    global.maxhpget[12] = 1
    global.maxhpget[13] = 1
    global.maxhpget[14] = 1
    global.maxhpget[15] = 3
    global.maxhpget[16] = 1
    global.maxhpget[17] = 1
    global.maxhpget[18] = 1
    global.maxhpget[19] = 1
    global.maxhpget[20] = 1
    global.maxhpget[21] = 1
    global.maxhpget[22] = 2
    global.maxhpget[23] = 1
    global.maxhpget[24] = 1
    global.maxhpget[25] = 35
    global.maxhpget[26] = 1
    global.maxhpget[27] = 1
    global.maxhpget[28] = 1
    global.maxhpget[29] = 1
    global.maxhpget[30] = 1
    global.maxhpget[100] = 1
    global.total_happiness = 0
    for (i = 0; i <= 100; i += 1)
    {
        if (global.maxhpget[i] >= 0)
            global.total_happiness += global.maxhpget[i]
    }
    global.total_happiness -= 1
    global.total_filmstrips[0] = 6
    global.total_filmstrips[1] = 7
    global.total_filmstrips[2] = 2
    global.total_filmstrips[3] = 3
    global.total_filmstrips[4] = 2
    global.total_filmstrips[5] = 9
    global.total_filmstrips[6] = 9
    global.total_filmstrips[7] = 1
    global.total_filmstrips_total = -1
    for (i = 0; i <= 7; i += 1)
        global.total_filmstrips_total += global.total_filmstrips[i]
    var TOTAL_WORLDS = scrGetTotalWorlds2()
    for (i = 0; i <= TOTAL_WORLDS; i += 1)
    {
        for (var g = 0; g <= global.total_filmstrips[i]; g += 1)
        {
            global.filmstrip[i][g] = -1
            global.filmstripNew[i][g] = 0
        }
    }
    global.beta_balls = -1
    for (i = 0; i <= 30; i++)
    {
        global.beta_ball_rmx[i] = -1
        global.beta_ball_rmy[i] = -1
    }
    global.store2discount = 0
    global.location = 0
    global.wind_speed = 0.5
    scrBalanceNumbers()
    global.got_house = 0
    global.growfruits = -1
    global.popocity_time = -1
    global.wumhouse_lights = 0
    global.lightsavings = 0
    global.total_creditStreams = 10
    i = 0
    for (i = 0; i <= global.total_creditStreams; i += 1)
    {
        global.creditStreamCredit[i] = 1390 + irandom(3395)
        global.creditStream[i] = 0
    }
    global.PJ1_active = 0
    global.PJ1_newspapers = 0
    global.PJ1_totnewspapers = 9
    global.PJ1_highscore = 0
    global.PJ1_startTime = 0
    global.PJ1_area = 0
    global.PJ1_exp = 0
    global.PJ2_list_delivered_ids = []
    global.PJ2_wums = 0
    global.PJ2_blussers = 0
    global.PJ2_splenkhakkers = 0
    global.PJ2_fnakkers = 0
    global.PJ2_kneft = 0
    global.PJ2_bliones = 0
    global.PJ2_misc = 0
    global.PJ2_wasted = 0
    global.PJ2_posters = 0
    global.PJ2_highest = -1
    global.PJ2_active = 0
    global.PC_posters = 0
    global.PC_posterid = []
    global.PC_posterimg = []
    global.PC_postertime = []
    global.PC_poster_duration = 600
    global.PC_posterstack_cooldown = 480
    global.PC_postertack_total = 2
    global.PC_posterstack_lastbatch[0] = -1
    global.PC_posterstack_lastbatch[1] = -1
    global.PC_posterstack_lastbatch[2] = -1
    global.PC_posterstack_exp[0] = 0
    global.PC_posterstack_exp[1] = 0
    global.PC_posterstack_exp[2] = 0
    global.TOT_CH_DISC_HAD = 0
    for (i = 100; i >= 0; i -= 1)
        global.discussionhad[i] = -1
    global.last_credit_earned = 0
    global.last_money_earned = 0
    global.last_price_paid_in_store = 0
    global.stotopap_room = -1
    i = 0
    for (i = 0; i <= 10; i += 1)
    {
        global.vishengel_bait[i] = -1
        global.vishengel_catchtime[i] = -1
        global.vishengel_caught[i] = 0
    }
    i = 0
    for (i = 0; i <= 11; i += 1)
    {
        global.popo_prison_cell[i] = -1
        global.popo_prison_cell_release[i] = -1
    }
    var chosen_cell = -1
    repeat (4)
    {
        chosen_cell = irandom(11)
        global.popo_prison_cell[chosen_cell] = irandom(6)
        global.popo_prison_cell_release[chosen_cell] = 1000 + irandom(1000)
    }
    global.SBSBkneft = 0
    global.insideTrain = 0
    global.train_delay_caused = 0
    global.train_will_wait_for_you = 1
    global.train_station_que = 0
    global.CurrentWorld = 1
    global.WorldOutside = 0
    global.fnakname0 = irandom(3)
    global.fnakname1 = irandom(3)
    global.fnakname2 = irandom(3)
    global.fnakname3 = irandom(3)
    for (i = 0; i <= 13; i += 1)
        global.cbcode[i] = 1 + irandom(4)
    global.playtime[1] = 0
    global.playtime[2] = 0
    global.playtime[3] = 0
    global.checkpoint_x = 13
    global.checkpoint_y = 8
    global.checkpoint_x2 = 350
    global.checkpoint_y2 = 250
    global.shooting_distance = 150
    global.room_x = 13
    global.room_y = 9
    global.room_x_previous = global.room_x
    global.room_y_previous = global.room_y
    global.Quest[1] = 0
    global.Quest[2] = 0
    global.Quest[3] = 0
    global.Quest[4] = 0
    global.Quest[5] = 0
    global.Quest[6] = 0
    global.Quest[7] = 0
    global.Quest[8] = 0
    global.Quest[9] = 0
    global.Quest[10] = 0
    global.Quest[20] = -1
    global.total_doors = -1
    global.liftFLOOR = 3
    for (i = 0; i < 100; i += 1)
        global.doorsOpenOpen[i] = 0
    global.RKschuifTotal = -1
    global.RKlight = 1
    global.RKdoors1 = 0
    global.RKdoors2 = 0
    global.RKdoors3 = 0
    global.RKdoors4 = 0
    scrRKG_set_all_switches(0)
    global.tot_bustes = -1
    global.statue[1] = -1
    global.statue[2] = -1
    global.statue[3] = -1
    global.statue[4] = -1
    global.statue[5] = -1
    global.moneh = 0
    global.splenkhakkercoins = 0
    for (var i2 = 0; i2 <= global.totalbosses; i2 += 1)
        global.boss[i2] = 0
    global.totaldecorations = 1
    for (var i4 = 0; i4 <= global.totaldecorations; i4 += 1)
        global.decorationsprite[i4] = 1076
    global.totalstains = 0
    global.totalweha = 1
    global.totalpowerups = 10
    global.bobo_main_item = 0
    global.totalitems = 0
    for (var i3 = 0; i3 <= global.totalpowerups; i3 += 1)
        global.powerup[i3] = 0
    global.total_gumball_items = 2
    for (i3 = 0; i3 <= global.total_gumball_items; i3 += 1)
        global.gumball_color[i3] = -1
    global.storewontbuy_string = "unloaded"
    global.totdmgGiven = 0
    global.totdmgTaken = 0
    global.totenemiesKilled = 0
    global.tothitsTaken = 0
    if (global.betasnavel || global.demosnavel)
        global.total_happiness = 100
}

