---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
---@class Categories: AceModule
local categories = addon:GetModule('Categories')
---@class Localization: AceModule
local L = addon:GetModule('Localization')
-------------------------------------------------------
local debug = false
local function printMsgDebug(message)
	if debug == true then
		print("[BetterBags Gear Sets] "..message)
	end
end
-------------------------------------------------------
local function UpdateGearsets() -- Add all items in equipment sets to the "Sets" category
   local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()

   for _, i in pairs(equipmentSetIDs) do -- For all sets
    printMsgDebug("Set " .. i)
      local itemIDs = C_EquipmentSet.GetItemIDs(i)
      if itemIDs then
         for _, itemID in pairs(itemIDs) do
            if itemID and itemID > 0 then
                printMsgDebug("ID: " .. itemID)
               categories:AddItemToCategory(itemID, "Gear Sets")
            else
                printMsgDebug("Invalid or missing ItemID \"" .. tostring(itemID) .. "\" in \"" .. i .. "\".")
            end
         end
      else
        printMsgDebug("Missing set \"" .. i .. "\".")
      end
   end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("EQUIPMENT_SETS_CHANGED")
frame:SetScript("OnEvent", function(self, event, ...) -- Update on login and gear change events
    printMsgDebug("Event \"" .. event .. "\" fired.")
   UpdateGearsets()
end)
