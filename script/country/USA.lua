-----------------------------------------------------------
-- LUA Hearts of Iron 3 USA File
-- Created By: Lothos
-- Modified By: Lothos
-- Date Last Modified: 5/14/2011
-----------------------------------------------------------

local P = {}
AI_USA = P

-- #######################################
-- Static Production Variables overide
function P.LandToAirRatio(voProductionData)
	local laArray = {
		5, -- Land Briages
		1}; -- Air
	
	return laArray
end

function P._LandRatio_Units_(minister)
	local laLandRatioUnits = {
		'garrison_brigade', -- Garrison
		'infantry_brigade', -- Infantry
		'motorized_brigade', -- Motorized
		'mechanized_brigade', -- Mechanized
		'armor_brigade|heavy_armor_brigade|super_heavy_armor_brigade', -- Armor
		'militia_brigade', -- Militia
		'cavalry_brigade'}; -- Cavalry
	
	return laLandRatioUnits
end
-- #######################################

-- Tech weights
--   1.0 = 100% the total needs to equal 1.0
function P.TechWeights(minister)
	local laTechWeights = {
		0.18, -- landBasedWeight
		0.09, -- landDoctrinesWeight
		0.12, -- airBasedWeight
		0.15, -- airDoctrinesWeight
		0.18, -- navalBasedWeight
		0.10, -- navalDoctrinesWeight
		0.10, -- industrialWeight
		0.04, -- secretWeaponsWeight
		0.04}; -- otherWeight
	
	return laTechWeights
end

-- Techs that are used in the main file to be ignored
--   techname|level (level must be 1-9 a 0 means ignore all levels
--   use as the first tech name the word "all" and it will cause the AI to ignore all the techs
function P.LandTechs(minister)
	local ministerCountry = minister:GetCountry()
	local loTechStatus = ministerCountry:GetTechnologyStatus()
	local lbArmor = loTechStatus:IsUnitAvailable(CSubUnitDataBase.GetSubUnit("armor_brigade"))
	local ignoreTech
	
	if lbArmor then
		ignoreTech = {{"cavalry_smallarms", 3}, 
			{"cavalry_support", 3},
			{"cavalry_guns", 3}, 
			{"cavalry_at", 3},
			{"armored_car_armour", 0},
			{"armored_car_gun", 0},
			{"heavy_tank_brigade", 0},
			{"heavy_tank_gun", 0},
			{"heavy_tank_engine", 0},
			{"heavy_tank_armour", 0},
			{"heavy_tank_reliability", 0},
			{"super_heavy_tank_brigade", 0},
			{"super_heavy_tank_gun", 0},
			{"super_heavy_tank_engine", 0},
			{"super_heavy_tank_armour", 0},
			{"super_heavy_tank_reliability", 0},
			{"rocket_art", 0},
			{"rocket_art_ammo", 0},
			{"rocket_carriage_sights", 0}};
	else
		ignoreTech = {{"cavalry_smallarms", 3}, 
			{"cavalry_support", 3},
			{"cavalry_guns", 3}, 
			{"cavalry_at", 3},
			{"armored_car_armour", 0},
			{"armored_car_gun", 0},
			{"heavy_tank_brigade", 0},
			{"heavy_tank_gun", 0},
			{"heavy_tank_engine", 0},
			{"heavy_tank_armour", 0},
			{"heavy_tank_reliability", 0},
			{"super_heavy_tank_brigade", 0},
			{"super_heavy_tank_gun", 0},
			{"super_heavy_tank_engine", 0},
			{"super_heavy_tank_armour", 0},
			{"super_heavy_tank_reliability", 0},
			{"rocket_art", 0},
			{"rocket_art_ammo", 0},
			{"rocket_carriage_sights", 0},
			{"lighttank_gun", 2},
			{"lighttank_engine", 2},
			{"lighttank_armour", 2},
			{"lighttank_reliability", 2}};
	end
		
	local preferTech = {"infantry_activation",
		"smallarms_technology",
		"infantry_support",
		"infantry_guns",
		"infantry_at",
		"lighttank_brigade",
		"lighttank_gun",
		"lighttank_engine",
		"lighttank_armour",
		"lighttank_reliability",
		"tank_brigade",
		"tank_gun",
		"tank_engine",
		"tank_armour",
		"tank_reliability",
		"art_barrell_ammo",
		"art_carriage_sights"};
		
	return ignoreTech, preferTech
end

function P.LandDoctrinesTechs(minister)
	local ignoreTech = {{"mass_assault", 0},
		{"large_front", 3},
		{"guerilla_warfare", 0},
		{"peoples_army", 0},
		{"large_formations", 0}};
		
	local preferTech = {"mobile_warfare",
		"spearhead_doctrine",
		"schwerpunkt",
		"blitzkrieg",
		"operational_level_command_structure",
		"tactical_command_structure",
		"delay_doctrine",
		"integrated_support_doctrine",
		"superior_firepower",
		"mechanized_offensive",
		"combined_arms_warfare",
		"infantry_warfare"};	
		
	return ignoreTech, preferTech
end

function P.AirTechs(minister)
	local ignoreTech = {};

	local preferTech = {"single_engine_aircraft_design",
		"basic_aeroengine",
		"basic_small_fueltank",
		"basic_single_engine_airframe",
		"basic_aircraft_machinegun",
		"multi_role_fighter_development",
		"twin_engine_aircraft_design",
		"basic_medium_fueltank",
		"basic_twin_engine_airframe",
		"basic_bomb",
		"nav_development",
		"air_launched_torpedo"};
		
	return ignoreTech, preferTech
end

function P.AirDoctrineTechs(minister)
	local ignoreTech = {{"forward_air_control", 0},
		{"battlefield_interdiction", 0},
		{"bomber_targerting_focus", 0},
		{"fighter_targerting_focus", 0}};

	local preferTech = {"fighter_pilot_training",
		"interception_tactics",
		"ground_attack_tactics",
		"tac_pilot_training",
		"interdiction_tactics",
		"tactical_air_command",
		"nav_pilot_training",
		"portstrike_tactics",
		"navalstrike_tactics",
		"naval_air_targeting",
		"naval_tactics"};		
		
	return ignoreTech, preferTech
end
		
function P.NavalTechs(minister)
	local ignoreTech = {{"battlecruiser_technology", 0},
		{"battlecruiser_antiaircraft", 0},
		{"battlecruiser_engine", 0},
		{"battlecruiser_armour", 0},
		{"super_heavy_battleship_technology", 0}};

	local preferTech = {"smallwarship_asw",
		"destroyer_technology",
		"destroyer_armament",
		"destroyer_antiaircraft",
		"destroyer_engine",
		"destroyer_armour",
		"cag_development",
		"escort_carrier_technology",
		"carrier_technology",
		"carrier_antiaircraft",
		"carrier_engine",
		"carrier_armour",
		"carrier_hanger",
		"submarine_technology",
		"submarine_engine",
		"submarine_hull",
		"submarine_torpedoes"};		
		
	return ignoreTech, preferTech
end
		
function P.NavalDoctrineTechs(minister)
	local ignoreTech = {};

	local preferTech = {"fleet_auxiliary_carrier_doctrine",
		"carrier_group_doctrine",
		"carrier_crew_training",
		"carrier_task_force"};		
		
	return ignoreTech, preferTech
end

function P.IndustrialTechs(minister)
	local ignoreTech = {};

	local preferTech = {"agriculture",
		"industral_production",
		"industral_efficiency",
		"oil_to_coal_conversion",
		"supply_production",
		"oil_refinning",
		"education",
		"mechnical_computing_machine"};
		
	return ignoreTech, preferTech
end
		
function P.SecretWeaponTechs(minister)
	local ignoreTech = {}
	
	return ignoreTech, nil
end

function P.OtherTechs(minister)
	local ignoreTech = {{"naval_engineering_research", 0},
		{"submarine_engineering_research", 0},
		{"aeronautic_engineering_research", 0},
		{"rocket_science_research", 0},
		{"chemical_engineering_research", 0},
		{"nuclear_physics_research", 0},
		{"jetengine_research", 0},
		{"mechanicalengineering_research", 0},
		{"automotive_research", 0},
		{"electornicegineering_research", 0},
		{"artillery_research", 0},
		{"mobile_research", 0},
		{"militia_research", 0},
		{"infantry_research", 0}};

	return ignoreTech, nil
end

-- END OF TECH RESEARCH OVERIDES
-- #######################################

-- #######################################
-- Production Overides the main LUA with country specific ones

-- Production Weights
--   1.0 = 100% the total needs to equal 1.0
function P.ProductionWeights(voProductionData)
	local laArray
	local liYear = CCurrentGameState.GetCurrentDate():GetYear()
	
	-- Check to see if manpower is to low
	-- More than 200 brigades so build stuff that does not use manpower
	if (voProductionData.ManpowerTotal < 100 and voProductionData.LandCountTotal > 200)
	or voProductionData.ManpowerTotal < 50 then
		laArray = {
			0.0, -- Land
			0.35, -- Air
			0.35, -- Sea
			0.30}; -- Other
	elseif liYear <= 1940 and not(voProductionData.IsAtWar) then
		laArray = {
			0.15, -- Land
			0.35, -- Air
			0.35, -- Sea
			0.15}; -- Other
	else
		laArray = {
			0.40, -- Land
			0.30, -- Air
			0.25, -- Sea
			0.05}; -- Other
	end
	
	return laArray
end
-- Land ratio distribution
function P.LandRatio(voProductionData)
	local laArray = {
		1, -- Garrison
		10, -- Infantry
		4, -- Motorized
		3, -- Mechanized
		3, -- Armor
		0, -- Militia
		0}; -- Cavalry
	
	return laArray
end
-- Special Forces ratio distribution
function P.SpecialForcesRatio(voProductionData)
	local laArray = {
		5, -- Land
		1}; -- Special Forces Unit
	
	return laArray
end
-- Air ratio distribution
function P.AirRatio(voProductionData)
	local laArray = {
		5, -- Fighter
		1, -- CAS
		3, -- Tactical
		1, -- Naval Bomber
		2}; -- Strategic
	
	return laArray
end
-- Naval ratio distribution
function P.NavalRatio(voProductionData)
	local laArray = {
		6, -- Destroyers
		4, -- Submarines
		4, -- Cruisers
		1, -- Capital
		2, -- Escort Carrier
		1}; -- Carrier
	
	return laArray
end
-- Transport to Land unit distribution
function P.TransportLandRatio(voProductionData)
	local laArray = {
		40, -- Land
		1}; -- Transport
	
	return laArray
end

-- Build Armor
function P.Build_Armor(ic, voProductionData, armor_brigade, vbGoOver)
	return Support.Build_Standard_Armor(ic, voProductionData, armor_brigade, vbGoOver)
end

-- Do not build light armor (wait till you have armor or better)
function P.Build_LightArmor(ic, voProductionData, light_armor_brigade, vbGoOver)
	-- Replace Ligth Armor request with Armor
	if voProductionData.TechStatus:IsUnitAvailable(CSubUnitDataBase.GetSubUnit("armor_brigade")) then
		return P.Build_Armor(ic, voProductionData, light_armor_brigade, vbGoOver)
	else
		return ic, 0
	end
end

-- Do not build battle cruisers
function P.Build_Battlecruiser(ic, voProductionData, battlecruiser, vbGoOver)
	-- Replace Battlecruiser request with a Battleship
	if voProductionData.TechStatus:IsUnitAvailable(CSubUnitDataBase.GetSubUnit("battleship")) then
		return Utils.CreateDivision_nominor(voProductionData, "battleship", 1, ic, battlecruiser, 1, vbGoOver)
	else
		return ic, 0
	end
end
		
-- END OF PRODUTION OVERIDES
-- #######################################

-- Influence Ignore list
function P.InfluenceIgnore(minister)
	-- Ignore Austria, Czechoslovakia as we will loose them
	-- Ignore Switzerland as there is no chance of them joining
	-- Ignore Vichy, they wont join anyone unles DOWed
	local laIgnoreList = {
		"SIK",
		"CYN",
		"CGX",
		"CSX",
		"ETH",
		"AUS",
		"CZE",
		"SCH",
		"VIC",
		"JAP",
		"ITA"};
	
	return laIgnoreList
end

-- Influence Monitor list
function P.InfluenceMonitor(minister)
	local laMonitorList = {
		"TUR", -- Europe
		"BEL",
		"HOL",
		"POL",
		"SPA",
		"SPR",
		"POR",
		"SWE",
		"YUG",
		"AFG", -- Middle East
		"PER",
		"SAU",
		"ARG", -- South America
		"BOL",
		"BRA",
		"CHL",
		"COL",
		"ECU",
		"GUY",
		"PAR",
		"PRU",
		"URU",
		"VEN",
		"CUB", -- Central America
		"COS",
		"DOM",
		"GUA",
		"HAI",
		"HON",
		"MEX",
		"NIC",
		"PAN",
		"SAL"};
	
	return laMonitorList
end

function P.DiploScore_OfferTrade(score, ai, actor, recipient, observer, voTradedFrom, voTradedTo)
	local lsActorTag = tostring(actor)
	
	if tostring(actor) == "JAP"
	or lsActorTag == "CHI"
	or lsActorTag == "CHC" 
	or lsActorTag == "CGX" 
	or lsActorTag == "CSX" 
	or lsActorTag == "CXB"
	or lsActorTag == "CYN" 
	or lsActorTag == "SIK"
	or lsActorTag == "ENG" 
	or lsActorTag == "FRA" then
		score = score + 20
	elseif tostring(actor) == "GER" or tostring(actor) == "ITA" then
		score = score - 20
	end
	
	return score
end

function P.DiploScore_InviteToFaction(score, ai, actor, recipient, observer)
	-- Only go through these checks if we are being asked to join the Allies
	if tostring(actor:GetCountry():GetFaction():GetTag()) == "allies" then
		local liYear = CCurrentGameState.GetCurrentDate():GetYear()
		local liMonth = CCurrentGameState.GetCurrentDate():GetMonthOfYear()
		local chiTag = CCountryDataBase.GetTag("CHI")
		local lochiTagCountry = chiTag:GetCountry()
		local lbChinaExists = lochiTagCountry:Exists()
		
		-- Date check to make sure they come in within resonable time
		if liYear >= 1943 then
			score = score + 30
		elseif liYear >= 1942 then
			score = score + 20
		elseif liYear == 1941 and liMonth >= 10 then
			score = score + 10
		end
		
		-- China check see if Japan is being aggressive in China
		if lbChinaExists then
			local japTag = CCountryDataBase.GetTag("JAP")
			local loChiJapRelation = lochiTagCountry:GetRelation(japTag)
			
			-- Check to see who they are a puppet of
			if lochiTagCountry:IsPuppet() then
				local lojapTagCountry = japTag:GetCountry()
			
				-- China has been taken over by Japan
				if (loChiJapRelation:HasAlliance())
				or (lochiTagCountry:HasFaction() and lochiTagCountry:GetFaction() == lojapTagCountry:GetFaction()) then
					score = score + 50
				end
			else
				local lbChiJapHasWar = loChiJapRelation:HasWar()
				
				if lochiTagCountry:IsGovernmentInExile() and lbChiJapHasWar then
					score = score + 50
				elseif lbChiJapHasWar then
					score = score + 10
				end
			end
		else
			local loRecipientCountry = recipient:GetCountry()
			local loControllerTag = CCurrentGameState.GetProvince(4191):GetController()  -- Shangzhi
			local loControllerCountry = loControllerTag:GetCountry()

			-- If the new owner is in a faction that is not ours then raise our score
			--   if not it is an unknown factor what happend so do nothing
			if loControllerCountry:HasFaction() then
				if not(loControllerCountry:GetFaction() == loRecipientCountry:GetFaction()) then
					score = score + 50
				end
			end
		end
	end
	
	return score
end

function P.DiploScore_Guarantee( score, ai, actor, recipient, observer)

	local recipientCountry = recipient:GetCountry()
	if not recipientCountry:HasFaction() then
		local continent = tostring( recipientCountry:GetCapitalLocation():GetContinent():GetTag() )
		if (continent == "north_america" or continent == "south_america")
		and not (tostring(recipient) == 'CAN') then
			return 100
		end
	end
	
	return score
end


function P.ProposeDeclareWar(minister)
	local ministerCountry = minister:GetCountry()
	
	local axisFaction = CCurrentGameState.GetFaction("axis")
	local alliesFaction = CCurrentGameState.GetFaction("allies")
	local axisLeaderTag = axisFaction:GetFactionLeader()
	
	local loStrategy = ministerCountry:GetStrategy()
	
	-- Make sure USA is part of the allies
	if ministerCountry:GetFaction() == alliesFaction
	and not(loStrategy:IsPreparingWar()) then
		local loMinisterCapital = ministerCountry:GetCapitalLocation():GetContinent()
	
		-- Generic DOW for countries not part of the same faction
		for loTargetCountry in CCurrentGameState.GetCountries() do
			local loTargetTag = loTargetCountry:GetCountryTag()
			
			if not(loTargetCountry:GetFaction() == ministerCountry:GetFaction()) then
				if loTargetCountry:Exists() 
				and loTargetCountry:GetCapitalLocation():GetContinent() == loMinisterCapital then
					if ministerCountry:GetRelation(loTargetTag):GetThreat():Get() > ministerCountry:GetMaxNeutralityForWarWith(loTargetTag):Get()  then
						loStrategy:PrepareWar( loTargetTag, 100 )
					end
				end
			end
		end

		-- Declare War on Vichy
		if ministerCountry:GetRelation(axisLeaderTag):HasWar() then
			-- Vichy Check
			local vicTag = CCountryDataBase.GetTag("VIC")
			local loVicCountry = vicTag:GetCountry()
			local loRelation = ministerCountry:GetRelation(vicTag)
			
			if loVicCountry:Exists()
			and not(loRelation:HasAlliance())
			and not(loVicCountry:HasFaction())
			and not(loRelation:HasWar()) then
				loStrategy:PrepareWar(vicTag, 100)
			end
		end
	end
end

-- Produce slightly better trained troops
function P.CallLaw_training_laws(minister, voCurrentLaw)
	local _ADVANCED_TRAINING_ = 29
	return CLawDataBase.GetLaw(_ADVANCED_TRAINING_)
end

return AI_USA

