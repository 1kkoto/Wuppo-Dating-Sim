function scrHappinessAfterDialogue(argument0) //gml_Script_scrHappinessAfterDialogue
{
    var t = instance_create(x, y, objDShappyAfterDialogue)
    t.hap = argument0
}

