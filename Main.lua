local _, addonTable = ...
local appearances = addonTable.appearances
local instances = addonTable.instances

TransmorpherTooltip = LibStub("AceAddon-3.0"):NewAddon("TransmorpherTooltip", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

function TransmorpherTooltip:OnInitialize()
	self:SecureHook(GameTooltip, 'SetUnitAura')
	self:SecureHook(GameTooltip, 'SetUnitBuff', 'SetUnitAura')
	self:SecureHook(GameTooltip, 'SetUnitDebuff', 'SetUnitAura')
end

function TransmorpherTooltip:SetUnitAura(tt, unit, index, filter)
	if not tt or tt:IsForbidden() then return end
	local name, _, _, _, _, _, caster, _, _, id = UnitAura(unit, index, filter)

  if appearances[id] then
    GameTooltip:AddLine(' ')
    local appearanceInfo = appearances[id]

    local instanceName = instances[appearanceInfo['instance']]['name']
    local expacInfo = instances[appearanceInfo['instance']]['ex']

    GameTooltip:AddLine('Transmorphed:', 1, 1, 1)
    GameTooltip:AddLine(appearanceInfo['name'], 1, 1, 1)
    GameTooltip:AddLine(instanceName..' ['..expacInfo..']', 1, 1, 1)
    GameTooltip:AddLine(' ')
  end
end
