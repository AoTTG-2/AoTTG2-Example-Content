addon InfiniteSupply
{
    #Description = "Infinite gas, blades and ammo.";

    Gas = true;
    GasTooltip = "Enable infinite ODM gas.";
    Blades = true;
    BladesTooltip = "Enable infinite blades.";
    UnbreakingBlades = false;
    UnbreakingBladesTooltip = "Enables unbreakable blades.";
    AHSS = true;
    AHSSTooltip = "Enable AHSS shots.";
    APG = true;
    APGTooltip = "Enable APG bullets.";
    Thunderspear = true;
    ThunderspearTooltip = "Enable infinite Thunderspears.";

    function Init()
    {
        Game.Print("Addon: Infinite supply.");
    }

    function OnCharacterSpawn(character)
    {
        if (character.IsMainCharacter && character.Type == "Human" && self.Gas)
        {
            character.MaxGas = 100000;
            character.CurrentGas = 100000;
        }
    }

    function OnSecond()
    {
        h = Network.MyPlayer;
        if (h.Status == "Alive" && h.Character.Type == "Human")
        {
            self.InfiniteSupply(h.Character);
        }
    }

    function InfiniteSupply(c)
    {
        if (c.Weapon == "Blade" && self.Blades)
        {
            c.CurrentBlade = c.MaxBlade;
            if(self.UnbreakingBlades)
            {
                c.CurrentBladeDurability = 100000;
            }
            return;
        }
        if (c.Weapon == "Thunderspear" && self.Thunderspear)
        {
            c.CurrentAmmoRound = c.MaxAmmoRound;
            return;
        }
        if (c.Weapon == "AHSS" && self.AHSS)
        {
            c.CurrentAmmoRound = c.MaxAmmoRound;
            return;
        }
        if (c.Weapon == "APG" && self.APG)
        {
            c.CurrentAmmoRound = c.MaxAmmoRound;
            return;
        }
    }
}