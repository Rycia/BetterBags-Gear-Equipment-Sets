---@class BetterBags: AceAddon
local addon = LibStub("AceAddon-3.0"):GetAddon("BetterBags")
---@class Categories: AceModule
local categories = addon:GetModule("Categories")
---@class Localization: AceModule
local L = addon:GetModule("Localization")

-------------------------------------------------------
local debug = false
local function printMsgDebug(message)
    if debug then
        print("[BetterBags Gear Sets] " .. message)
    end
end
-------------------------------------------------------

local CATEGORY_NAME = "Gear Sets"

local function UpdateGearsets()
    -- Ensure BetterBags categories are ready
    if not categories or not categories.AddItemToCategory then
        printMsgDebug("Categories module not ready yet.")
        return
    end

    -- Ensure category exists (safe to call multiple times)
    categories:CreateCategory(CATEGORY_NAME, L and L[CATEGORY_NAME] or CATEGORY_NAME)

    local equipmentSetIDs = C_EquipmentSet.GetEquipmentSetIDs()
    if not equipmentSetIDs then return end

    printMsgDebug("Updating gear sets...")

    for _, setID in ipairs(equipmentSetIDs) do
        local itemIDs = C_EquipmentSet.GetItemIDs(setID)
        if itemIDs then
            for _, itemID in ipairs(itemIDs) do
                if itemID and itemID > 0 then
                    categories:AddItemToCategory(itemID, CATEGORY_NAME)
                    printMsgDebug("Added itemID " .. itemID)
                end
            end
        end
    end
end

-------------------------------------------------------
-- Event handling
-------------------------------------------------------

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("EQUIPMENT_SETS_CHANGED")
frame:RegisterEvent("BAG_UPDATE_DELAYED")

frame:SetScript("OnEvent", function(_, event)
    printMsgDebug("Event fired: " .. event)

    -- Delay execution to ensure item data + BetterBags are ready
    C_Timer.After(0.1, UpdateGearsets)
end)
