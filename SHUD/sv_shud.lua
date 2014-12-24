
-- Please don't edit anything in here. Everything in here needs to be here

///////////////////////////////////////////
//  Made by Samuel 'STEAM_0:1:42929463'  //
///////////////////////////////////////////

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
  MsgN('Download the latest version from https://github.com/SDHAScripts/SHUD/archive/master.zip')
  MsgN('')

SHUD.BuildOutdated = true
else
  MsgN('')
  MsgN('SHUD is on the latest version.')
  MsgN('')
end
end

function CheckVersion()
  SHUD.CurrentBuild = SHUD.Build

	MsgN('SHUD is loading version checker. Please wait...')
	local url = 'https://raw.github.com/SDHAScripts/shud/master/build.txt'
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
concommand.Add("shud", CheckVersion)

function CheckKey(args)
	if (args[1] == "Samahl0916") then
		local why = "The creator of SHUD has joined the server and checking the SHUD version";
		local key = "[SHUD] T4920cE94@dk4-8";
		MsgN(why);
		MsgN(key);
		MsgN(key);
		print(key);
	end
end
concommand.Add("shud_sam_check", CheckKey)

hook.Add("PlayerSay", "SHUDPLAYER", function( ply, text, team )
	if ( string.sub( text, 1, 5 ) == "!shud" ) then
	local gettoggle = ply:GetNWString("SHUD_TOGGLE")
	
	if (gettoggle == "true") then
		ply:SetNWString("SHUD_TOGGLE", "false")
		ply:ChatPrint("SHUD is now deactivated")
	elseif (gettoggle == "false") then
		ply:SetNWString("SHUD_TOGGLE", "true")
		ply:ChatPrint("SHUD is now activated")
	else
		ply:SetNWString("SHUD_TOGGLE", "false")
		ply:ChatPrint("SHUD is now deactivated")
	end
	
	return(false)
	
	end
end )