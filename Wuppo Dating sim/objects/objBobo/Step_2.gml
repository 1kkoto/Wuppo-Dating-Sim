if (wspeed == 0 || free || (!visible) || instance_number(objTussenMaskAnimatino))
{
    if audio_is_playing(walking_sound_id)
        audio_stop_sound(walking_sound_id)
    if audio_is_playing(walking_sound2_id)
    {
        if (audio_sound_get_gain(walking_sound2_id) == 0)
            audio_stop_sound(walking_sound2_id)
        else
        {
            var fade_time = 40
            switch objCamera.BOBO_GROUND
            {
                case 2:
                case 8:
                    fade_time = 140
                    break
            }

            audio_sound_gain(walking_sound2_id, 0, fade_time)
        }
    }
}
else if (abs(wspeed) > 0.5 && (!free) && visible && (!DEAD))
{
    if (!audio_is_playing(walking_sound_id))
    {
        walking_sound_id = scrSound(0)
        if audio_is_playing(walking_sound2_id)
        {
            var snd_pos = audio_sound_get_track_position(walking_sound_id)
            audio_sound_set_track_position(walking_sound2_id, snd_pos)
        }
    }
    if obj_exists(objCamera)
    {
        var grnd = objCamera.BOBO_GROUND
        sn = scrGroundSoundName(grnd)
        if (grnd != -1)
        {
            var s2_free = (!audio_is_playing(walking_sound2_id))
            if (!s2_free)
            {
                if (audio_sound_get_gain(walking_sound2_id) == 0)
                    s2_free = 1
            }
            if s2_free
            {
                if audio_is_playing(walking_sound2_id)
                    audio_stop_sound(walking_sound2_id)
                walking_sound2_id = audio_play_sound(sn, 15, true)
                var snd_pos = audio_sound_get_track_position(walking_sound_id)
                audio_sound_set_track_position(walking_sound2_id, snd_pos)
                audio_sound_gain(walking_sound2_id, (0.01 * global.OPTIONS_AUDIO_GAIN[2]), 0)
                walking_sound2_snd = sn
            }
            else if audio_is_playing(walking_sound2_id)
            {
                if (walking_sound2_snd == sn)
                {
                    var targgain = 0.1 * global.OPTIONS_AUDIO_GAIN[2]
                    if (audio_sound_get_gain(walking_sound2_id) > targgain)
                        audio_sound_gain(walking_sound2_id, targgain, 500)
                    else
                        audio_sound_gain(walking_sound2_id, targgain, 100)
                }
                else
                {
                    var gain_steal = audio_sound_get_gain(walking_sound2_id)
                    audio_stop_sound(walking_sound2_id)
                    walking_sound2_id = audio_play_sound(sn, 15, true)
                    audio_sound_gain(walking_sound2_id, (gain_steal + 0.05 * global.OPTIONS_AUDIO_GAIN[2]), 0)
                    walking_sound2_snd = sn
                    var snd_pos = audio_sound_get_track_position(walking_sound_id)
                    audio_sound_set_track_position(walking_sound2_id, snd_pos)
                }
            }
        }
    }
}
var swimsnd_play_float = 0
var swimsnd_play_under = 0
if (move >= 9 && visible && (!DEAD))
{
    if swim_float
    {
        swimsnd_play_float = 1
        swimsnd_play_under = 0
    }
    else
    {
        swimsnd_play_float = 0
        swimsnd_play_under = 1
    }
    if (wspeed == 0)
    {
        if audio_is_playing(swim_sound1_id)
            swimsnd_play_float = 0
        if audio_is_playing(swim_sound2_id)
        {
            if ((global.holdL + global.holdR + global.holdU + global.holdD) == 0)
                swimsnd_play_under = 0
        }
    }
}
if (!swimsnd_play_float)
{
    if audio_is_playing(swim_sound1_id)
    {
        if (audio_sound_get_gain(swim_sound1_id) == 0)
            audio_stop_sound(swim_sound1_id)
        else
            audio_sound_gain(swim_sound1_id, 0, 160)
    }
}
else if (!audio_is_playing(swim_sound1_id))
{
    swim_sound1_id = scrSound(17, 1)
    scrSoundGain(swim_sound1_id, 0, 0)
}
else
    scrSoundGain(swim_sound1_id, 1, 120)
if (!swimsnd_play_under)
{
    if audio_is_playing(swim_sound2_id)
    {
        if (audio_sound_get_gain(swim_sound2_id) == 0)
            audio_stop_sound(swim_sound2_id)
        else
            audio_sound_gain(swim_sound2_id, 0, 160)
    }
}
else if (!audio_is_playing(swim_sound2_id))
{
    swim_sound2_id = scrSound(18, 1)
    scrSoundGain(swim_sound2_id, 0, 0)
}
else
    scrSoundGain(swim_sound2_id, 1, 120)
if (braad_sound_snd != -1)
{
    var tpich = 0.75 + 0.25 * heath
    if (tpich >= 1.1)
        tpich = 1.1
    if (tpich <= 0.5)
        tpich = 0.5
    scrSoundPitch(braad_sound_snd, tpich)
    var tvol = heath
    if (tvol >= 0.5)
        tvol = 0.5
    if (tvol <= 0)
        tvol = 0
    scrSoundGain(braad_sound_snd, tvol, 0)
}
if (poison_sound_snd != -1)
{
    var tpich = 0.1 + 0.8 * poison
    if (tpich >= 1.1)
        tpich = 1.1
    if (tpich <= 0.1)
        tpich = 0.1
    scrSoundPitch(poison_sound_snd, tpich)
    var tvol = poison * 0.5
    if (tvol >= 0.35)
        tvol = 0.35
    if (tvol <= 0)
        tvol = 0
    scrSoundGain(poison_sound_snd, tvol, 0)
}
if game_is_paused_delta()
{
    var tloopsounds = [poison_sound_snd, braad_sound_snd, buis_sound_snd, swim_sound1_id, swim_sound2_id, walking_sound_id, walking_sound2_id]
    var tll = array_length_1d(tloopsounds)
    for (var i = 0; i < tll; i++)
    {
        if (tloopsounds[i] != -1)
        {
            if audio_is_playing(tloopsounds[i])
                audio_sound_gain(tloopsounds[i], 0, 0)
        }
    }
}
