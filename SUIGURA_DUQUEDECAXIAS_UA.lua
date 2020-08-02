-- SUIGURA_DUQUEDECAXIAS_UA
-- Author: SuiguraTaiki
-- DateCreated: 7/31/2020 7:17:03 PM
--------------------------------------------------------------
--Using this space to sumarize what I want, and what I think its doing but its probably completely wrong. I've had some help but i have no clue if it works. First time ever coding, not to mention using LUA.
--Everytime in greentext that "(?)" shows up, i have no clue if it actually works as i think it should, if at all.
--What i want to do here is to allow newly created units to, if they are made within a city with a DISTRICT_ENCAMPMENT, to trigger a check, and if it passes, it gains an ability. More on that below.
--------------------------------------------------------------
AddEventHandler ("UnitAddedToMap", "Suigura_UA_UnitAddedToMap")  -- Does this allow me to check if a unit is added to map, then trigger the function below? i have no clue how to even start this thing. (?)

function Suigura_UA_UnitAddedToMap(iPlayerID, iUnitID, iCityID)	-- Just spitballing here, no clue if it would work.
local pPlayer = Players(iPlayerID);	-- Checks the player's ID number
local lPlayer = pPlayer(TypeName); -- Checks LeaderType (?)
if (lPlayer ~= "LEADER_SUIGURA_DUQUEDECAXIAS" true) then return end	-- Checks if lPlayer is different from "LEADER_SUIGURA_DUQUEDECAXIAS". If not, abort.

	local pUnit = pPlayer:GetUnits():FindID(iUnitID);	-- Checks the unit's ID number and checks if it belongs to the player.
	local pUnitLoc = pUnit:GetX():GetY();	-- Checks unit's location (?)
	local pCity = pPlayer:GetCities()FindID(iCityID)	-- Check the city's ID number and checks if it belongs to the player
	local pCityLoc = pCity:GetX():GetY();	-- Checks the city's location (?)

		if ((pCityLoc = pUnitLoc) == true) then		-- Checks if city's location = unit's location. If so, runs the script below. Otherwise abort. (?)
		print("Unit is located at the City);

			if (pCity:GetID():GetDistrict(DISTRICT_ENCAMPMENT) == true) then	-- Checks if said city has an encampment district within it. If true, then runs script below. Otherwise abort.(?)

				local pUnitAbility = pUnit:GetAbility();	-- Checks all abilities?
				local iCurrentCount = pUnitAbility:GetAbilityCount("ABILITY_SUIGURA_DUQUEDECAXIAS_UA_IGNORE_JWM");	-- Checks the count on the ability i've made in another file. Not sure how it works exactly, followed an advice(?)
				print("iCurrentCount: " .. iCurrentCount);

				if (iCurrentCount<=0) then
					print("Adding Stack");
					pUnitAbility:ChangeAbilityCount("ABILITY_SUIGURA_DUQUEDECAXIAS_UA_IGNORE_JWM",1);
				end		-- If the value of iCurrentCount is less or equal to 0, then it adds 1. The point is to make it == 1(?)

				if (iCurrentCount>1) then
					print("Removing Stack");
					pUnitAbility:ChangeAbilityCount("ABILITY_SUIGURA_DUQUEDECAXIAS_UA_IGNORE_JWM",-1);
					print("Done altering ability");
				end		-- If the value of iCurrentCount is more than 0, then it subtracts 1. The point is to make it == 1 (?)

				iCurrentCount = pUnitAbility:GetAbilityCount("ABILITY_SUIGURA_DUQUEDECAXIAS_UA_IGNORE_JWM"); --		does this give the ability "ABILITY_SUIGURA_DUQUEDECAXIAS_UA_IGNORE_JWM" to the unit?(?)
				print("iCurrentCount: " .. iCurrentCount);
				if (iCurrentCount == "1") then
					pUnit=Give
			
				end
			end
		end
	end
	Events.UnitAddedToMap.Add(Suigura_UA_UnitAddedToMap);	 --NGL i'm completely lost