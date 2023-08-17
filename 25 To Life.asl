// 25 To Life Autosplitter Version 2.0.0 19/8/2022
// Supports IGT
// Supports all difficulties
// Pointers and Script <by> ||LeonSReckon||

state("TTL")
{
	float IGT: 0x4F63A0, 0x1F8, 0x10, 0x0, 0x10, 0x8, 0x14, 0x30;
	float boss: 0xAC0C4C, 0xC, 0x24, 0x1C, 0x1C, 0x4, 0x4, 0x7B8;
	int lvl: 0x5128B4, 0x4, 0x0, 0x0, 0x2E8;
	int flvl: 0x2389AC, 0x4;
}

startup
{
	vars.totalGameTime = 0;
}

update{
    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        vars.totalGameTime = 0;
    }
}

start
{
	return current.IGT > old.IGT;
}

split
{
	return current.lvl == 1 && old.lvl == 0 && current.flvl == 1 || current.lvl == 2 && old.lvl == 1 || current.lvl == 3 && old.lvl == 2 || current.lvl == 4 && old.lvl == 3 || current.lvl == 5 && old.lvl == 4 || current.lvl == 6 && old.lvl == 5 || current.lvl == 7 && old.lvl == 6 || current.lvl == 8 && old.lvl == 9 || current.lvl == 9 && old.lvl == 8 || current.lvl == 10 && old.lvl == 9 || current.lvl == 11 && old.lvl == 10;
}

isLoading
{
	return true;
}

gameTime
{
	if(current.IGT > old.IGT){
		return TimeSpan.FromSeconds(vars.totalGameTime + current.IGT);
	}
	if(current.IGT == 0 && old.IGT > 0){
			vars.totalGameTime = (vars.totalGameTime + old.IGT);
			return TimeSpan.FromSeconds(vars.totalGameTime + current.IGT);
		}
}

reset
{
	return current.lvl == 49;
}
