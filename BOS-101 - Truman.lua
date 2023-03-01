----------------------------------------------------------------------------------------
---
-- Name: BOS-101 - Truman -- version 1.22
-- Date Modified: 		   01/03/2023
-- Modified by: 		     ACEL
-- CASE I recoveries:	   06:00 - 19:30
-- CASE III recoveries:	 20:00 - 05:30
-- Deck closed:			     N/A
----------------------------------------------------------------------------------------

-- No MOOSE settings menu. Comment out this line if required.
_SETTINGS:SetPlayerMenuOff()

  
-- Create AIRBOSS object.
local AirbossCVN75=AIRBOSS:New("CVN75")

-- Add recovery windows:

local window1=AirbossCVN75:AddRecoveryWindow( "06:00", "07:30", 1, nil, true, 25)
local window1=AirbossCVN75:AddRecoveryWindow( "08:00", "09:30", 1, nil, true, 25)
local window1=AirbossCVN75:AddRecoveryWindow( "10:00", "11:30", 1, nil, true, 25)
local window1=AirbossCVN75:AddRecoveryWindow( "12:00", "13:30", 1, nil, true, 25)
local window1=AirbossCVN75:AddRecoveryWindow( "14:00", "15:30", 1, nil, true, 25)
local window1=AirbossCVN75:AddRecoveryWindow( "16:00", "17:30", 1, nil, true, 25)
local window1=AirbossCVN75:AddRecoveryWindow( "18:00", "19:30", 1, nil, true, 25)
local window3=AirbossCVN75:AddRecoveryWindow( "20:00", "21:30", 3, nil, true, 15)
local window3=AirbossCVN75:AddRecoveryWindow( "22:00", "23:30", 3, nil, true, 15)
local window3=AirbossCVN75:AddRecoveryWindow( "00:00", "01:30", 3, nil, true, 15)
local window3=AirbossCVN75:AddRecoveryWindow( "02:00", "03:30", 3, nil, true, 15)
local window3=AirbossCVN75:AddRecoveryWindow( "04:00", "05:30", 3, nil, true, 15)

-- Set folder of airboss sound files within miz file.
AirbossCVN75:SetSoundfilesFolder("Airboss Soundfiles/")

--FunkyBOT
AirbossCVN75:SetFunkManOn(10042, "127.0.0.1")

-- Single carrier menu optimization.
AirbossCVN75:SetMenuSingleCarrier()

-- Set carrier frequencies -- 250 BTN 5 -- 254 BTN 6
AirbossCVN75:SetLSORadio(250, AM)
AirbossCVN75:SetMarshalRadio(254, AM)

-- Ser Carrier TACAN to X 106 LW
AirbossCVN75:SetTACAN(106, X, "LW")

-- Skipper menu.
AirbossCVN75:SetMenuRecovery(30, 20, false)

-- Remove landed AI planes from flight deck.
AirbossCVN75:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossCVN75:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossCVN75:SetAutoSave()

-- Enable trap sheet.
AirbossCVN75:SetTrapSheet()

-- Start airboss class.
AirbossCVN75:Start()


--- Function called when a player gets graded by the LSO.
function AirbossCVN75:OnAfterLSOGrade(From, Event, To, playerData, grade)
  local PlayerData=playerData --Ops.Airboss#AIRBOSS.PlayerData
  local Grade=grade --Ops.Airboss#AIRBOSS.LSOgrade

  ----------------------------------------
  --- Interface your Discord bot here! ---
  ----------------------------------------
  
  local score=tonumber(Grade.points)
  local name=tostring(PlayerData.name)
  
  -- Report LSO grade to dcs.log file.
  env.info(string.format("Player %s scored %.1f", name, score))
end

