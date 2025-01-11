var _temp_local_var_2;
function scrHappiness() //gml_Script_scrHappiness
{
    for (var i = 0; i <= 5; i += 1)
    {
        if (argument_count > i)
            arg[i] = argument[i]
        else
            arg[i] = 0
    }
    if (arg[1] <= 0)
        arg[1] = 35
}

