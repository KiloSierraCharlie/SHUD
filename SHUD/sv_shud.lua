include('sh_config.lua')

SHUD = {}
SHUD.Config = {}
SHUD.Build = "833"
SHUD.Version = "8.3.3"
SHUD.CurrentBuild = "0"
SHUD.LatestBuild = "0"
SHUD.BuildOutdated = false

local function CompareVersions()
	if tonumber(SHUD.CurrentBuild) < tonumber(SHUD.LatestBuild) then
		MsgN('')
		MsgN('SHUD is out of date!')
		MsgN('Local build: ' .. SHUD.CurrentBuild .. ', Latest build: ' .. SHUD.LatestBuild .. '')
		MsgN('Download the latest version from https://github.com/mindfulhacker/SHUD/archive/master.zip')
		MsgN('')
		SHUD.BuildOutdated = true
	else
		MsgN('')
		MsgN('SHUD is on the latest version.')
		MsgN('')
	end
end

hook.Add("PlayerInitialSpawn", "NotifyOutdated", function( ply )
	if(SHUD.BuildOutdated)then
		ply:SendLua("notification.AddLegacy(\"SHUD is outdated!\", NOTIFY_ERROR, 300)")
	end
end)

function CheckVersion()
	local url = 'https://raw.githubusercontent.com/mindfulhacker/SHUD/master/CurrentVersion.txt'
	http.Fetch( url,
		function( content )
			SHUD.LatestBuild = tostring( content ) or "Error"
			CompareVersions()
		end,
		function(failCode)
			MsgN('SHUD couldn\'t check version.')
			MsgN(url, ' returned ', failCode)
		end
	)
end
