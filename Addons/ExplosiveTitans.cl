addon ExplosiveTitans
{
    Description = "Titans will explode on death.";
    ExplosionDelay = 1.0;
    BlastRadius = 50.0;

    function OnCharacterDie(victim, killer, killerName)
    {

        if (Network.IsMasterClient && victim.Type == "Titan")
        {            
            self.Explode(victim.NapePosition, self.ExplosionDelay);            
        }
    }

    coroutine Explode(position, time)
    {
        wait time;
        Game.SpawnEffect("ThunderspearExplode", position, Vector3.Zero, self.BlastRadius * 2.0, Color(255, 255, 255, 255));
        for (human in Game.Humans)
        {
            if (Vector3.Distance(human.Position, position) < self.BlastRadius)
            {
                human.GetKilled("Titan Explosion");
            }
        }
    }
}