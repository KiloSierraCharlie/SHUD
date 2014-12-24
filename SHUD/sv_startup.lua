
///////////////////////////////////////////
//  Made by Samuel 'STEAM_0:1:42929463'  //
///////////////////////////////////////////

MsgN(' ')
MsgN(' ')
MsgN('//////////////////////////////////')
MsgN('// Loaded SHUD DarkRP Module    //')
MsgN('// Version 8.3.3 Stable         //')
MsgN('// By Samuel STEAM_0:1:42929463 //')
MsgN('//////////////////////////////////')
MsgN(' ')
MsgN(' ')

CheckVersion()

function SHUD_HELP()
	local help = "[SHUD] If you need any help with SHUD please go to https://github.com/SDHAScripts/SHUD/issues and report the problem.";
	
	print(help);
	MsgN(help);
end
concommand.Add("shud_help", SHUD_HELP)