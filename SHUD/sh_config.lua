SHUD = {}
SHUD.Config = {}
SHUD.Config.DLC = {}
SHUD.Config.Icon = {}
SHUD.Config.Text = {}
SHUD.Config.Addon = {}
SHUD.Config.Color = {}
SHUD.Config.Ranks = {}

// General Configs
SHUD.Config.DarkRP              = true                  -- Using DarkRP?
SHUD.Config.Second              = true                  -- Show the second bar (HP and Job)
SHUD.Config.Showrank            = true                  -- Show the rank of admins
SHUD.Config.ShowEx              = "health"              -- false = disabled, Use health or armor.
SHUD.Config.Range               = 250                   -- Range of the player card
SHUD.Config.Round               = 1                     -- The main box: 1 = Default , 2 = Square
SHUD.Config.Font                = 1                     -- Text fonts: 1 = Default, 2 = SHUD BIG, 3 = Old School
SHUD.Config.Lang                = 1                     -- Languages: 1 = English, 2 = Swedish, 3 = Danish
SHUD.Config.RHide               = 'false'               -- Usergroup (SHUD will be deactivated for this person)

// DarkRP Configs
SHUD.Config.Showwanted  	      = true                  -- Show if a player is wanted
SHUD.Config.Patrol              = "TEAM_ADMIN"          -- Name of the admin class (The SHUD will be deactivated for this class)
SHUD.Config.Wanted              = "Custom Wanted Text"  -- Custom wanted text, set Lang to 4 to use this

// DarkRP Icons
SHUD.Config.Icon.Gun            = "gun"                 -- Silkicon for the gun
SHUD.Config.Icon.Paper          = "page"                -- Silkicon for the paper
SHUD.Config.Icon.Warning        = "stop"                -- Silkicon for the warning sign

// Configs for other Addons and Modules
SHUD.Config.Addon.Showgang      = false                 -- Show gang name (DarkRP Gang System) (Not 100% sure if its working)
SHUD.Config.Addon.GangSize      = "medium"              -- Text size (small/medium/large)
SHUD.Config.Addon.Showorg       = false                 -- Show org name (Organisations Addon for DarkRP)
SHUD.Config.Addon.OrgSize       = "medium"              -- Text size (small/medium/large)

// Configs for SHUD DLC's
SHUD.Config.DLC.Tag             = false                 -- Custom tag (SHUD Tag System)

// Colors (Do not change the last ',180'...)
SHUD.Config.Color.Nametext      = Color(10,10,10,180)
SHUD.Config.Color.Namebg        = Color(160,160,160)

SHUD.Config.Color.Jobtext       = Color(255,255,255)
SHUD.Config.Color.Jobbg         = Color(255,255,255)

SHUD.Config.Color.Ranktext      = Color(255,255,255,180)
SHUD.Config.Color.Rankbg        = Color(0,0,0,180)

SHUD.Config.Addon.Gangcolor     = Color(0,0,0,180)
SHUD.Config.Addon.Gangtext      = Color(255,255,255,255)
SHUD.Config.Addon.Orgcolor      = Color(10,10,10,180)
SHUD.Config.Addon.Orgtext       = Color(255,255,255,255)

// Ranks (First color code = Box, Second color code = Text)
SHUD.Config.Ranks["superadmin"] = {"Super Admin", "shield_add", Color(10,10,10,180), Color(255,255,255,180)}
SHUD.Config.Ranks["admin"]      = {"Admin", "shield", Color(10,10,10,180), Color(255,255,255,180)}