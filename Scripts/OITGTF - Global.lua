function TakeMachineProfile()
	return PROFILEMAN:GetMachineProfile():GetSaved()
end

function OITGThemerFallbackRevisionNumber()
	return string.format("% 4d",413)
end

function GlobalCenterX(n)
	return SCREEN_CENTER_X + n - 320
end

function GlobalCenterY(n)
	return SCREEN_CENTER_Y + n - 240
end

-- I do know that OpenITG has a function to give the name, but i decided to make this because i was thinking of bringing this system
-- To 3.95 builds eventually, when i get the time and if i don't get frustrated with the system from 3.95.
function ThemeName() local str = string.sub(THEME:GetPath(2,'','_blank.png'),9) return string.sub(str,1,string.find(str,'/')-1) end

function WarnAboutCourseMod()
	BuildName = ''
	if OPENITG then
		BuildName = 'OpenITG'
	end
	if FUCK_EXE then
		BuildName = 'NotITG'
	end
	if not OPENITG and not FUCK_EXE then
		BuildName = 'whatever the hell you\'re playing'
	end

	SCREENMAN:SystemMessage("I'm sorry, but Course Modification doesn't exist on "..BuildName..'.')
end


function OptionRowBase(name,modList)
	local t = {
		Name = name or 'Unnamed Options',
		LayoutType = (ShowAllInRow and 'ShowAllInRow') or 'ShowOneInRow',
		SelectType = 'SelectOne',
		OneChoiceForAllPlayers = false,
		ExportOnChange = true,
		Choices = modList or {'Off','On'},
		LoadSelections = function(self, list, pn) list[1] = true end,
		SaveSelections = function(self, list, pn)	 end
	}
	return t
end

function EnableCharacterListingOnOptions()
	local t = OptionRowBase('EnableCharacterListingOnOptions')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "Enable", "Disable" }
	t.LoadSelections = function(self, list) if TakeMachineProfile().OITGTF_EnableCharactersOnPlayerOptions then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then TakeMachineProfile().OITGTF_EnableCharactersOnPlayerOptions = true;  end
		if list[2] then TakeMachineProfile().OITGTF_EnableCharactersOnPlayerOptions = false; end
	end
	return t
end

function UseITGNoteskinSystem()
	local t = OptionRowBase('UseITGNoteskinSystem')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "Enable", "Disable" }
	t.LoadSelections = function(self, list) if TakeMachineProfile().OITGTF_UseITGNoteskinSystem then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then TakeMachineProfile().OITGTF_UseITGNoteskinSystem = true;  end
		if list[2] then TakeMachineProfile().OITGTF_UseITGNoteskinSystem = false; end
	end
	return t
end

function EnableScoreDisplayListing()
	local t = OptionRowBase('EnableScoreDisplayListing')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "Enable", "Disable" }
	t.LoadSelections = function(self, list) if TakeMachineProfile().OITGTF_EnableScoreDisplayListing then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then TakeMachineProfile().OITGTF_EnableScoreDisplayListing = true;  end
		if list[2] then TakeMachineProfile().OITGTF_EnableScoreDisplayListing = false; end
	end
	return t
end

function RestoreInternetListing()
	local t = OptionRowBase('RestoreInternetListing')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "Enable", "Disable" }
	t.LoadSelections = function(self, list) if TakeMachineProfile().OITGTF_RestoreInternetListing then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then TakeMachineProfile().OITGTF_RestoreInternetListing = true;  end
		if list[2] then TakeMachineProfile().OITGTF_RestoreInternetListing = false; end
	end
	return t
end

function EnableAdvanceGraphicOptions()
	local t = OptionRowBase('EnableAdvanceGraphicOptions')
	t.OneChoiceForAllPlayers = true
	t.Choices = { "Enable", "Disable" }
	t.LoadSelections = function(self, list) if TakeMachineProfile().OITGTF_EnableAdvanceGraphicOptions then list[1] = true else list[2] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then TakeMachineProfile().OITGTF_EnableAdvanceGraphicOptions = true;  end
		if list[2] then TakeMachineProfile().OITGTF_EnableAdvanceGraphicOptions = false; end
	end
	return t
end

function HeightPositioningForReceptors()
	local t = OptionRowBase('HeightPositioningForReceptors')
	t.OneChoiceForAllPlayers = true
	
	Cyberia_Position_TOP = -154
	Cyberia_Position_REV = 154
	ITG_Position_TOP=-125
	ITG_Position_REV=145

	t.Choices = { "Global On Theme ("..ReceptorHeightTop() .." / "..ReceptorHeightBottom()..")", "Cyberia-Style / A.o.I ("..Cyberia_Position_TOP .." / "..Cyberia_Position_REV..")", "Disable ("..ITG_Position_TOP .." / "..ITG_Position_REV..")" }
	t.LoadSelections = function(self, list) if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == true and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == false then list[1] = true elseif TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == true and TakeMachineProfile().OITGTF_HeightPositioningForReceptors == false then list[2] = true else list[3] = true end end
	t.SaveSelections = function(self, list)
		if list[1] then TakeMachineProfile().OITGTF_HeightPositioningForReceptors = true;  TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia = false; end
		if list[2] then TakeMachineProfile().OITGTF_HeightPositioningForReceptors = false; TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia = true;  end
		if list[3] then TakeMachineProfile().OITGTF_HeightPositioningForReceptors = false; TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia = false; end
	end
	return t
end


-- This is where the choices you set on OITGTFOptions take place.
-- WHY TWO RECEPTOR POSITION FUNCTIONS? YOU CAN MAKE ONE!
-- 	No. I've tested it, and it breaks the reverse function completely. So that's why i separated it into two functions, to act independently.
function ReceptorHeightTop()

	-- Set them up
	CurrentPosition_TOP = 0


	Fallback_Position_TOP = -144
	Cyberia_Position_TOP = -154
	ITG_Position_TOP=-125

	Cyberia_Style_Title = 'CyberiaStyle 6 -consciousness to cyber- / StepMania Customize Theme'
	AOI_Title = 'SM with A.O.I.'
	-- Trance Machina uses the same one found on OITGThemerFallback.

	if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == true and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == false then
		if ThemeName() == Cyberia_Style_Title or ThemeName() == AOI_Title then
			CurrentPosition_TOP = Cyberia_Position_TOP
		else
			CurrentPosition_TOP = Fallback_Position_TOP
		end
	end

	if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == false and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == true then
		CurrentPosition_TOP = Cyberia_Position_TOP
	end


	if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == false and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == false then
		CurrentPosition_TOP = ITG_Position_TOP
	end

	return CurrentPosition_TOP
end

function ReceptorHeightBottom()

	-- Set them up
	CurrentPosition_REV = 0

	Fallback_Position_REV = 144
	Cyberia_Position_REV = 154
	ITG_Position_REV=145

	Cyberia_Style_Title = 'CyberiaStyle 6 -consciousness to cyber- / StepMania Customize Theme'
	AOI_Title = 'SM with A.O.I.'
	-- Trance Machina uses the same one found on OITGThemerFallback.

	if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == true and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == false then
		if ThemeName() == Cyberia_Style_Title or ThemeName() == AOI_Title then
			CurrentPosition_REV = Cyberia_Position_REV
		else
			CurrentPosition_REV = Fallback_Position_REV
		end
	end

	if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == false and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == true then
		CurrentPosition_REV = Cyberia_Position_REV
	end


	if TakeMachineProfile().OITGTF_HeightPositioningForReceptors == false and TakeMachineProfile().OITGTF_HeightPositioningForReceptors_Cyberia == false then
		CurrentPosition_REV = ITG_Position_REV
	end

	return CurrentPosition_REV
end

function PlayerOptionsRowListing()
	ChoiceNames = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15'
	ScoreDisplayNumber = ',13';
	CharacterListNumber = ',15';

	if TakeMachineProfile().OITGTF_EnableCharactersOnPlayerOptions == false then
		ChoiceNames = string.gsub(ChoiceNames, CharacterListNumber, '')
	end

	if TakeMachineProfile().OITGTF_EnableScoreDisplayListing == false then
		ChoiceNames = string.gsub(ChoiceNames, ScoreDisplayNumber, '')
	end

	return ChoiceNames
end

function OptionsMenuListing()
	ChoiceNames = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17'
	InternetNumber = '14'

	if TakeMachineProfile().OITGTF_RestoreInternetListing == false then
		ChoiceNames = string.gsub(ChoiceNames, InternetNumber, '')
	end

	return ChoiceNames
end

function CheckIfAdvGraphOptions()
	RowListOfChoices = '1,2,3,4,5,6,7,8,9,10,11,12'
	if TakeMachineProfile().OITGTF_EnableAdvanceGraphicOptions == true then
		RowListOfChoices = '3,4,5,6,7,8,9,10,11,12'
	end

	return RowListOfChoices
end

function SetAspOnAppearanceOptions()
	RowListOfChoices = '1,2,3,4,5,6,7,8,9,10,11,12,13,14'
	if TakeMachineProfile().OITGTF_EnableAdvanceGraphicOptions == true then
		RowListOfChoices = '1,2,3,4,5,6,7,8,9,10,11,12,13'
	end

	return RowListOfChoices
end

function GraphListName()
	GraphicName = 'list,Graphic Options'

	if TakeMachineProfile().OITGTF_EnableAdvanceGraphicOptions == true then
		GraphicName = 'list,TotalBasic Graphic Options'
	end

	return GraphicName
end

function NoteskinsRowListing()
	ChoiceName = ''

	if TakeMachineProfile().OITGTF_UseITGNoteskinSystem == true then
		ChoiceName = 'list,NoteSkins2'
	else
		ChoiceName = 'list,NoteSkins'
	end

	return ChoiceName
end






--[[
Simple PrefsRows API for 3.95/OpenITG, version 1.2
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

Base definitions and templates for StepMania LUA options lists.
Written by Mark Cannon ("Vyhd") for OpenITG (http://www.boxorroxors.net/)
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]

function CreateOptionRow( Params, Names, LoadFctn, SaveFctn )
	if not Params.Name then return nil end

	-- this needs to be used because Lua evaluates 'false' as 'nil', so
	-- we can't use an OR operator to assign the value properly.
	local function setbool( value, default )
		if value ~= nil then return value else return default end
	end

	-- fill in with passed params or default values. only Name is required.
	local t =
	{
		Name = Params.Name,

		LayoutType = Params.LayoutType or "ShowAllInRow",
		SelectType = Params.SelectType or "SelectOne",

		OneChoiceForAllPlayers = setbool(Params.OneChoiceForAllPlayers, true),
		EnabledForPlayers = Params.EnabledForPlayers or {PLAYER_1, PLAYER_2},

		ExportOnChange = setbool(Params.ExportOnChange, false),
		ReloadRowMessages= Params.ReloadRowMessages or {},

		Choices = Names,
		LoadSelections = LoadFctn,
		SaveSelections = SaveFctn,
	}

	setmetatable( t, t )
	return t
end

-- creates a row list given a list of names and values
function CreatePrefsRow( Params, Names, Values, prefname )
	local amt = table.getn(Names)
	local val = PREFSMAN:GetPreference(prefname)

	local function Load(self, list, pn)
		for i = 1, amt do
			if Values[i] == val then
				list[i] = true
				return
			end
		end
		list[1] = true	-- fall back to first value
	end

	local function Save(self, list, pn)
		for i = 1, amt do
			if list[i] then
				PREFSMAN:SetPreference(prefname, Values[i])
				return
			end
		end
	end

	return CreateOptionRow( Params, Names, Load, Save )
end

-- creates a ranged list, given an offset and delta between values
function CreatePrefsRowRange( Params, Names, prefname, start, delta )
	local amt = table.getn(Names)
	local val = PREFSMAN:GetPreference(prefname)

	local function IndexToValue(i)
		return start+(delta*(i-1))
	end

	local function Load(self, list, pn)
		for i = 1, amt do
			if IndexToValue(i) == val then
				list[i] = true
				return
			end
		end
		list[1] = true	-- fall back to first value
	end

	local function Save(self, list, pn)
		for i = 1,amt do
			if list[i] then
				PREFSMAN:SetPreference(prefname, IndexToValue(i))
			end
		end
	end

	return CreateOptionRow( Params, Names, Load, Save )
end

-- creates an enumerated toggle for a preference
function CreatePrefsRowEnum( Params, Names, prefname )
	local amt = table.getn(Names)
	local val = PREFSMAN:GetPreference(prefname)

	return CreateOptionRowRange( Params, Names, prefname, 0, 1 )
end 

-- creates a boolean toggle for a preference
function CreatePrefsRowBool( Params, prefname )
	local OptionValues = { false, true }
	local OptionNames = { "OFF", "ON" }

	local val = PREFSMAN:GetPreference(prefname)

	local function Load(self, list, pn)
		if PREFSMAN:GetPreference(prefname) == true then
			list[2] = true
		else
			list[1] = true
		end
	end

	-- set 0 if "OFF" (index 1), 1 if "ON" (index 2)
	local function Save(self, list, pn)
		for i = 1,2 do
			if list[i] then
				PREFSMAN:SetPreference(prefname, OptionValues[i] )
				return
			end
		end
	end

	return CreateOptionRow( Params, OptionNames, Load, Save )
end

-- very simple boolean toggle for a preference
function CreateSimplePrefsRowBool( prefname )
	local Params = {}
	Params.Name = prefname

	return CreatePrefsRowBool( Params, prefname )
end

--[[
OpenITG resolution switcher, version 1.0
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

These probably won't work unless they're used on the same screen. You've been warned.

Written by Mark Cannon ("Vyhd") for OpenITG (http://www.boxorroxors.net/)
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]

-- used in a few places, so we keep it here.
-- checks to see if two floats are equal, within error
local function fequ( f1, f2, error )
	if not f1 or not f2 then return nil end
	local error = error or 0.01
	local absolute_diff = math.abs(f1 - f2)
	return absolute_diff < error
end

-- Ratio is pre-declared in order to avoid drifting due to
-- saving badly-rounded floats over time. Possibly paranoia,
-- but this will save us some headaches regardless.
local Resolutions =
{
	["4:3"] = 
	{
		Ratio = 1.333333,
		Res = { "512x384", "640x480", "800x600", "1024x768", "1152x864", "1280x1024", "1400x1050", "1600x1200" },
	},

	["16:10"] =
	{
		Ratio = 1.6,
		Res = { "720x480", "1000x600", "1280x800", "1440x900", "1600x1024" },
	},

	["16:9"] =	
	{
		Ratio = 1.777777,
		Res = { "960x540", "1280x720", "1600x900", "1920x1080" },
	},
}

-- Width, then height. "640x480" -> 640, 480
local function SplitResolution( res )
	-- part before "x" is the width in pixels, part after is height in pixels
	local delim_pos = string.find( res, "x" )
	local width = tonumber( string.sub(res,1,delim_pos-1) )
	local height = tonumber( string.sub(res,delim_pos+1) )
	return width, height
end

-- returns the float value associated with the given ratio
local function RatioToFloat( ratio )
	return tonumber(Resolutions[ratio].Ratio)
end

-- returns the table key that best matches the given ratio
local function FloatToRatio( float )
	for key,tbl in pairs(Resolutions) do
		if fequ( tbl.Ratio, float ) then return key end
	end

	return nil
end

-- holds the aspect ratio that the system will have once everything's set
local temp_ratio = FloatToRatio( PREFSMAN:GetPreference("DisplayAspectRatio") )
local temp_float = RatioToFloat( temp_ratio )

-- This function only sets a temporary ratio for the other table to pick up on
function LuaSetAspectRatio()	
	-- build from all the key values of Resolutions
	local Names = {}
	for k,v in pairs(Resolutions) do table.insert(Names, k) end
	
	local function Load(self, list, pn)
		for i=1,table.getn(Names) do
			if fequ(temp_float, RatioToFloat(Names[i])) then list[i] = true return end
		end
	
		list[1] = true;	-- default to 4:3
	end

	local function Save(self, list, pn)
		for i=1,table.getn(Names) do
			if list[i] then
				if not fequ(ratio,temp_float) then
					temp_ratio = Names[i]
					temp_float = RatioToFloat( temp_ratio )
					MESSAGEMAN:Broadcast( "AspectRatioChanged" )
					return
				end
			end
		end
	end

	local Params =
	{
		Name = "AspectRatio",
		LayoutType = "ShowOneInRow",
		ExportOnChange = true,
	}

	return CreateOptionRow( Params, Names, Load, Save )
end

function LuaSetResolution( ratio )
	-- Fill in with the values names of the appropriate Resolutions table
	local Names = {}
	for i=1,table.getn(Resolutions[ratio].Res) do table.insert(Names, Resolutions[ratio].Res[i]) end
	
	local curwidth = PREFSMAN:GetPreference( "DisplayWidth" )
	local curheight = PREFSMAN:GetPreference( "DisplayHeight" )

	local function Load(self, list, pn)
		for i=1,table.getn(Names) do
			local width, height = SplitResolution( Names[i] )

			-- just find the closest match here...
			if width == curwidth or height == curheight then list[i] = true return end
		end

		-- fallback value: smallest one
		list[1] = true
	end

	local function Save(self, list, pn)
		for i=1,table.getn(Names) do
			if list[i] then
				-- make sure we're the right one being selected
				if ratio ~= temp_ratio then return end

				local width, height = SplitResolution( Names[i] )

				-- set the new preferences
				PREFSMAN:SetPreference( "DisplayWidth", width )
				PREFSMAN:SetPreference( "DisplayHeight", height )
				PREFSMAN:SetPreference( "DisplayAspectRatio", Resolutions[ratio].Ratio )
				Debug( "New resolution: " .. width .. "x" .. height .. ", ratio " .. Resolutions[ratio].Ratio )

				GAMESTATE:DelayedGameCommand( "reloadtheme" )
			end
		end
	end

	local Params =
	{
		Name = "DisplayResolution",
		LayoutType = "ShowOneInRow",

		-- disable this line if it isn't used for the current ratio
		EnabledForPlayers = fequ(RatioToFloat(ratio),temp_float) and {PLAYER_1,PLAYER_2} or {},
		ReloadRowMessages = { "AspectRatioChanged" },
	};

	return CreateOptionRow( Params, Names, Load, Save )
end

--[[
OpenITG simple graphics configuration, version 0.2
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

These probably won't work unless they're used on the same screen. You've been warned.
Written by Mark Cannon ("Vyhd") for OpenITG (http://www.boxorroxors.net/)
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]

-- aliases for the different config levels
local GraphicsLevels = { "LOW", "MEDIUM", "HIGH", "MAXIMUM" }

-- this is a little oddly written, in order to facilitate options setting.
-- each key is named after the preference it's intended to set, and has a
-- table with values corresponding to the above levels. that way, we can
-- simply do k,v for pairs() and refer to v[level]
local GraphicsSettings =
{
	DisplayColorDepth		= {	16,	32,	32,	32	},
	TextureColorDepth		= {	16,	32,	32,	32	},
	MovieColorDepth			= {	16,	16,	16,	32	},
	MaxTextureResolution		= {	256,	512,	1024,	2048	},

	DelayedTextureDelete		= {	false,	false,	false,	true	},
	DelayedModelDelete		= {	false,	false,	true,	true	},
	PalettedBannerCache		= {	false,	false,	true,	true	},

	TrilinearFiltering		= {	false,	false,	true,	true	},
	AnisotropicFiltering		= {	false,	false,	true,	true	},

	BannerCache			= {	0,	0,	1,	1	},

	-- XXX: this is here so we have some way of setting it...
	ThreadedMovieDecode		= {	false,	false,	false,	true	},
	SmoothLines			= {	false,	true,	true,	true	},
}

function LuaGraphicOptions()
	local function Load(self, list, pn)
		local cur_res = PREFSMAN:GetPreference("MaxTextureResolution")
		for i=1,table.getn(GraphicsLevels) do
			if cur_res == GraphicsSettings.MaxTextureResolution[i] then list[i] = true return end
		end

		-- default to "MEDIUM"
		list[2] = true;
	end

	local function Save(self, list, pn)
		for i=1,table.getn(GraphicsLevels) do
			if list[i] == true then
				for pref,tbl in pairs(GraphicsSettings) do
					PREFSMAN:SetPreference( pref, tbl[i] )
				end

				GAMESTATE:DelayedGameCommand( "reloadtheme" )
				return
			end
		end
	end

	local Params = { Name = "GraphicQuality" }

	return CreateOptionRow( Params, GraphicsLevels, Load, Save )
end