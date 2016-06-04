------------------------------------------
--    Factions
-- Team Ring-Ding
------------------------------------------

Msg("\n--------------------------------------------------\n")
Msg("Loading Spacebuild Factions Client\n")
Msg("--------------------------------------------------\n")

------------------------------------------
-- Load Factions
------------------------------------------
Msg("Loading Spacebuild Factions client files\n")

include( "shared.lua" )
include( "config.lua" )
include( "client/core.lua" )
include( "client/utility.lua" )
include( "client/jukebox.lua" )
include( "client/usermessages.lua" )
include( "client/concommands.lua" )
include( "client/spawnmenu.lua" )

include( "client/gui/textnotices.lua" )
include( "client/gui/buttontext.lua" )
include( "client/gui/flagvgui.lua" )
include( "client/gui/modifyscreencolor.lua" )
include( "client/gui/spawnpointmenu/spawnpointmenu.lua" )
include( "client/gui/helpmenu/helpmenu.lua" )
include( "client/gui/teammenu/team.lua" )
include( "client/gui/scoreboard/cl_scoreboard.lua" )
include( "client/gui/statusbar/statusbar.lua" )
include( "client/gui/swepmenu/button.lua" )
include( "client/gui/swepmenu/swepmenu.lua" )
include( "client/gui/trademenu/trademenu.lua" )
include( "client/gui/spawnmenu/creationmenu/weapons.lua" )
include( "client/gui/spawnmenu/controls/fac_weaponbutton.lua" )

if file.Exists("factions/stools.txt", "DATA") then Factions.Stools = util.KeyValuesToTable( file.Read("factions/stools.txt", "DATA") ) end

if type(Factions.Stools) ~= "table" or type(Factions.Stools.turret) ~= "table" or type(Factions.Stools.turret.cost) ~= "number" then
	if LocalPlayer() ~= nil then
		fac_Error( LocalPlayer():Nick() .. "'s stool file did not download correctly." )
		LocalPlayer():ConCommand("fac_requeststools\n") --not the greatest because by the time the client gets the file the spawnmenu will already have loaded, but its better than nothing. Besides, this is a catchall anyway.
	end
end

Msg("-------------------------------\n")
Msg("Factions Client Loaded\n")
Msg("-------------------------------\n\n")
