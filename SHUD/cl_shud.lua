--[[
  Made by Samuel 'STEAM_0:1:42929463'
]]--

include('sh_config.lua')

--[[
 Version 8.3.3 2014/08/28
]]--

--[[
    Only edit below if you know what you are doing!
]]--

if (SHUD.Config.Font == 1) then
    surface.CreateFont ("SHUDName", {
    size = 23,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "coolvetica"})
end

if (SHUD.Config.Font == 2) then
    surface.CreateFont ("SHUDName", {
    size = 23,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "DejaVu Sans"})
end

if (SHUD.Config.Font == 3) then
    surface.CreateFont ("SHUDName", {
    size = 20,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "akbar"})
end

if (SHUD.Config.Addon.OrgSize == "small") then
    surface.CreateFont ("SHUDORG", {
    size = 24,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "coolvetica"})
end

if (SHUD.Config.Addon.OrgSize == "medium") then
    surface.CreateFont ("SHUDORG", {
    size = 26,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "coolvetica"})
end

if (SHUD.Config.Addon.OrgSize == "big") then
    surface.CreateFont ("SHUDORG", {
    size = 32,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "coolvetica"})
end

if SHUD.Config.Lang == 1 and SHUD.Config.DarkRP then
    wantedtext = "Wanted by The Police"
    goterror = "Please contact an administrator"
end

if SHUD.Config.Lang == 2 and SHUD.Config.DarkRP then
    wantedtext = "Efterlyst av Polisen"
end

if SHUD.Config.Lang == 3 and SHUD.Config.DarkRP then
    wantedtext = "Eftersøgt af politiet"
end

if SHUD.Config.Lang == 4 and SHUD.Config.DarkRP then
	wantedtext = SHUD.Config.Wanted
end

local function drb(r, x, y, w, h, col)
    draw.RoundedBox(r, x, y, w, h, col)
end

local function ddt(text, font, x, y, col, align)
    draw.DrawText(text, font, x, y, col, align or 0)
end

local function dicon(mat, x, y, w, h)
    surface.SetDrawColor( 255, 255, 255, 255 )
    surface.SetMaterial( Material(mat) )
    surface.DrawTexturedRect( x, y, w, h)
end

function DrawSHUD(ply)
    local pos = ply:EyePos()
    pos.z = pos.z + 15
    pos = pos:ToScreen()
    pos.y = pos.y - 60

	if SHUD.Config.DarkRP then
		ply.DarkRPVars = ply.DarkRPVars or {}
	end

    local RankData = SHUD.Config.Ranks[ply:GetUserGroup()] or {}
    local hasRank = (RankData[1] and true or false)
    local x, y = pos.x - 115 , pos.y + 1
    local w, h = 250, (hasRank and SHUD.Config.Showrank and 90 or 60)
    local tcol = team.GetColor(ply:Team())
    local name = ply:Nick() or "Joe Doe"
	local rankpos = 2

	if SHUD.Config.DLC.Tag and (ply:GetNWString("STag") == !"") then
		w, h = w, h + 28
	end

    if SHUD.Config.Round == 1 then
		round = 6
	elseif SHUD.Config.Round == 2 then
		round = 0
    end

	if SHUD.Config.Second then
		drb(round, x, y, w, h, RankData[3] or Color(10,10,10,180))
	elseif (SHUD.Config.Second == false) then
		drb(round, x, y, w, 32, RankData[3] or Color(10,10,10,180))
	end

    drb(round, x + 3, y + 3, w - 6, 25, SHUD.Config.Color.Nametext)
    ddt(name, "SHUDName", x + w / 2, y + 4, SHUD.Config.Color.Namebg, TEXT_ALIGN_CENTER)

	if SHUD.Config.DarkRP and SHUD.Config.Second then
		ddt(ply:getDarkRPVar("job") or "", "SHUDName", x + w / 2, y + 34, SHUD.Config.Color.Jobtext, TEXT_ALIGN_CENTER)
	end

    if (SHUD.Config.ShowEx == "health") or (SHUD.Config.ShowEx == "armor") and (SHUD.Config.Second == true)  then
    if (SHUD.Config.ShowEx == "health") then
		ex = ply:Health()
	elseif (SHUD.Config.ShowEx == "armor") then
		ex = ply:Armor()
	end

    local unit = (w - 6) / 100

    if (ex < 1) and SHUD.Config.Second then
		drb(round, x + 3, y + 32, w - 6, 25, Color(tcol.r / 2, tcol.g / 2, tcol.b / 2))
	elseif (SHUD.Config.Second == false) then
		-- Hmm?
	else
		drb(round, x + 3, y + 32, w - 6, 25, Color(tcol.r / 2, tcol.g / 2, tcol.b / 2))
		drb(round, x + 3, y + 32, math.Clamp(ex * unit, 12, w - 6), 25, tcol)
	end
    else
		drb(round, x + 3, y + 32, w - 6, 25, tcol)
    end

	if SHUD.Config.DarkRP and SHUD.Config.Second then
		ddt(ply:getDarkRPVar("job") or "", "SHUDName", x + w / 2, y + 34, SHUD.Config.Color.Jobtext, TEXT_ALIGN_CENTER)
    end

	if (SHUD.Config.Addon.GangSize == "small") then
		updown = 27
	elseif (SHUD.Config.Addon.GangSize == "medium") then
		updown = 28
	elseif (SHUD.Config.Addon.GangSize == "big") then
		updown = 30
	else
		updown = 26
	end

	--[[                                                                  ]]--
	if ply:GetNWString("Gang","") != "" and SHUD.Config.Addon.Showgang then
	    local gang = ply:GetNWString("Gang","") or "No Gang"
        drb(round, x, y - 28, w, 25, SHUD.Config.Addon.Gangcolor)
        ddt(gang, "SHUDORG", x + w / 2, y - updown, SHUD.Config.Addon.Gangtext, TEXT_ALIGN_CENTER)
    elseif (ply:GetNWBool("Org_Leader",true) == true) then
        drb(round, x, y - 28, w, 25, Color(10, 10, 10, 0))
	end
	--[[                                                                  ]]--

	if (SHUD.Config.Addon.OrgSize == "small") then
		updown = 27
	elseif (SHUD.Config.Addon.OrgSize == "medium") then
		updown = 28
	elseif (SHUD.Config.Addon.OrgSize == "big") then
		updown = 30
	else
		updown = 26
	end

	--[[                                                                  ]]--
	if SHUD.Config.Addon.Showorg and ply:GetNetworkedString("Name") != "" and SHUD.Config.DarkRP then
		local org = ply:GetNetworkedString("Name") or "No Org"
		drb(round, x, y - 28, w, 25, SHUD.Config.Addon.Orgcolor)
		ddt(org, "SHUDORG", x + w / 2, y - updown, SHUD.Config.Addon.Orgtext, TEXT_ALIGN_CENTER)
	end
	--[[                                                                  ]]--

    if hasRank and SHUD.Config.Showrank and SHUD.Config.Second then
        local rank = RankData[1]
        surface.SetFont("SHUDName")
        local tw = surface.GetTextSize(rank) + 30
        local txtPos = x + w / rankpos - tw / 2
        drb(round, txtPos, pos.y + 62, tw, 25, SHUD.Config.Color.Rankbg)
        ddt(rank, "SHUDName", txtPos + 24, y + 64, RankData[4] or SHUD.Config.Color.Ranktext)
        dicon("icon16/" .. RankData[2] .. ".png", txtPos + 4, y + 66, 16, 16)
	end

	if SHUD.Config.DLC.Tag and ply:GetNWString("STag") != "" then
	    local tagsize = 85
        local tagPos = x + w / 5 - tagsize / 2
	    local stag = ply:GetNWString("STag")
	    local stype = ply:GetNWString("STag_Type")
        drb(round, x + 3, y + 90, w - 6, 25, SHUD.Config.Color.Rankbg)
        ddt(stag, "SHUDName", tagPos + 24, y + 64, Color(218,165,32, 255))
    end

	if SHUD.Config.Hit and SHUD.Config.DarkRP then
		-- Working on this --
	end

    if ply:getDarkRPVar("HasGunlicense") and SHUD.Config.DarkRP then
        dicon("icon16/" .. SHUD.Config.Icon.Paper .. ".png", x + 7, y + 62, 23, 23)
        dicon("icon16/" .. SHUD.Config.Icon.Gun .. ".png", x + 9, y + 66, 16, 16)
    end

	if ply:getDarkRPVar("wanted") and SHUD.Config.DarkRP then
        dicon("icon16/" .. SHUD.Config.Icon.Warning .. ".png", x + 34, y + 62, 23, 23)
	end

	if SHUD.Config.Addon.Showorg and ply:GetNetworkedString("Name") != "" then
		wantedpos = 56
	elseif SHUD.Config.Addon.Showgang and ply:GetNWString("Gang","") != "" then
		wantedpos = 56
	else
		wantedpos = 30
	end

    if SHUD.Config.Showwanted and ply:getDarkRPVar("wanted") and SHUD.Config.DarkRP then
        local wy = y - wantedpos
        drb(round, x, wy, w, 25, Color(0, 0, 0, 200))
        ddt(wantedtext, "SHUDName", x + w / 2 - 1, wy + 3, Color(180, 20, 20), TEXT_ALIGN_CENTER)
    end
end

function SDisplay()
    local localply = LocalPlayer()
    local localpos = localply:GetShootPos()

	if localply:Alive() and not (localply:GetNWString("SHUD_TOGGLE") == "false") then
    for k, v in pairs(player.GetAll()) do
        local pos = v:GetShootPos()
	if (v:Team() == SHUD.Config.Patrol) or (v:GetUserGroup() == SHUD.Config.RHide) and (v:GetVehicle() == "nil") then
		-- Hmm?
	else
    if localpos:Distance(pos) < SHUD.Config.Range and v:Alive() and (localply:SteamID() != v:SteamID()) then
        local diff = pos - localpos
        local trace = util.QuickTrace(localpos, diff, localply)
    if trace.Hit and trace.Entity ~= v then return end
        DrawSHUD(v)
	end
	end
	end
	end
end
timer.Simple( 12, function() hook.Add("HUDPaint", "DrawSammyHud", SDisplay) end )
