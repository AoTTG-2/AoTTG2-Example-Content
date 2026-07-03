addon RemainingTitansHighlighter
{
    Description = "Highlights remaining titans";

    TitanCountForHighlight = 3; # Titans will be highlighted when alive titans count is less than or equal to this
    OutlineDistance = 300; # How far the titan have to be to be highlighted. titans close to local player will not be highlighted

    function OnSecond()
    {
        titans = Game.Titans;
        aliveTitans = titans.Count;

        if (aliveTitans <= self.TitanCountForHighlight)
        {
            c = Network.MyPlayer.Character;
            if (c != null && c.IsAlive)
            {
                for(t in titans)
                {
                    distance = Vector3.Distance(t.Position, c.Position);
                    
                    t.RemoveOutline();
                    if (distance > self.OutlineDistance)
                    {
                        color = Color("#FFF");
                        if (aliveTitans == 1)
                        {
                            color = Color(255, 130, 130);
                        }
                        t.AddOutline(color, OutlineModeEnum.OutlineHidden);
                    }
                }
            }
        }
    }
}