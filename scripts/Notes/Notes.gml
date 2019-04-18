/*
Attack ability order
Declare Attack - Resolve all abilities
Deal damage - If dead get all abilities for dead and kill it, put on bottom of stack
Get abilities for damage dealt, get abilities for completed attack
attacked - damage dealt - unit sent to grave could order all in battle? would work fine probs

in damage dealt > check if health < 0, if so label target as dying, get abilities, send to grave, 

attack > get declare attack abilities > do damage, check if dead, if dead set dying, set cause, get dying abilities > get damage abilities > get post attack > if target still dying kill it, get sent to grave abilities

deal damage, check if 0 health, if 0 make it dying collect dying > if still dying kill it, deal damage abilities
do this in 1 script call

Cost --1

Fix card sprites, cast spells