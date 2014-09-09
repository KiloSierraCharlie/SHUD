## Changelog

### 8.3.3 (2014/08/22
####cl_shud.lua (Client Side)

Edited if statments

####sh_config.lua (Shared Side)

Added SHUD.Config.Icon.Warning

Renamed SHUD.Config.Showwanted to SHUD.Config.DarkRP.Showwanted

Renamed SHUD.Config.Patrol to SHUD.Config.DarkRP.Patrol

Renamed SHUD.Config.Text.Wanted to SHUD.Config.DarkRP.Wanted

Renamed SHUD.Config.Gun to SHUD.Config.Icon.Gun

Renamed SHUD.Config.Paper to SHUD.Config.Icon.Paper

Change SHUD.Config.Addon.Gangsize from "small" to "medium"

Change SHUD.Config.Addon.Orgsize from "small" to "medium"

Removed non working configs

####sv_shud.lua (Server Side)

Edited Version check function

Removed non working function

### 8.3.2 (2014/08/22)
####cl_shud.lua (Client Side)

Added font size if statments (See sh_config.lua)

Added toggle if statment

Added SHUD deactivation when you are a listed class or rank

Fixed so the wanted box wont cover the gang/org box when its up

####sh_config.lua (Shared Side)

Added SHUD.Config.RHide

Added SHUD.Config.Patrol

Added SHUD.Config.Addon.GangSize

Added SHUD.Config.Addon.OrgSize

Added SHUD.Config.Addon.Showorg

Added SHUD.Config.Addon.Gangtext

Added SHUD.Config.Addon.Orgtext


Removed SHUD.Config.Dead

####sv_shud.lua (Server Side)

Added "PlayerSay" hook
Added Toggle chat command and function


### 8.3.1 (2014/08/21)
####cl_shud.lua (Client Side)

Added SHUD.Config.Second if statment

Changed some if statments

Moved local tcol = team.GetColor(ply:team()) higher up

Removed spaces

Removed local CTeam = ply:Team()



####sh_config.lua (Shared Side)
Added SHUD.Config.Second (Enable/Disable the job/health box)

Added SHUD.Config.Addon.Org (Organisations Addon for DarkRP)

Moved SHUD.Config.ShowEx higher up

Changed SHUD.Config.DEV from {"superadmin"} to "superadmin"


####sv_startup.lua (Server Side)
Added Version to the load message

sv_shud.lua (Server Side)

Added Message that tells you that the version checker is loading

Added Function that will give a rank the outdated message (Not Done)

