--[[
STEPIKA

Making plugin design easy. Get started by opening the Stepika module script and modifying all elements in PluginData, excluding StepikaCore.

Then, customise your widget below. Visit documentation to learn how to add stuff.
]]

local Stepika = require(script.Parent.Stepika) -- DO NOT REMOVE

-- Add any functions to run in your plugin below. By default, the configuration is to create an initial scrolling frame, like auroraSuite, Use functions that begin with Aurora to make sure everything works as expected.

local ScrollingFrame = Stepika.AuroraCreateInitialScroll()
local CreateSteps = Stepika.AuroraCreateCollapsableMenu("Create Steps", "Steps", "http://www.roblox.com/asset/?id=12749569444", "http://www.roblox.com/asset/?id=12749569444", false, ScrollingFrame)

-- Leave this to run last to ensure Stepika works properly.

local Toolbar = plugin:CreateToolbar(Stepika.PluginData.Name .. " plugin") -- Creates a toolbar for your plugin, no need to modify
local Launcher = Toolbar:CreateButton("Open widget", "Opens the widget for this plugin.", Stepika.PluginData.PluginLogo) -- Creates a button for your plugin in the toolbar, no need to modify

local Widget = plugin:CreateDockWidgetPluginGui(
	Stepika.PluginData.Name,
	DockWidgetPluginGuiInfo.new(
		Enum.InitialDockState.Float, -- Where the plugin will dock when launched
		false,
		false,
		280, -- Widget default width
		540, -- Widget default height
		280, -- Widget minimum width
		540 -- Widget minimum height
	)
)

Widget.Title = Stepika.PluginData.Name -- The title of your widget when opened (no need to modify)
Widget.Name = Stepika.PluginData.Developer .. "." .. Stepika.PluginData.Name -- The name of your widget in game.PluginGuiService (no need to modify)

-- Do not modify anything below this point.

local MaxSize = 12
local MinSize = 6
local ThicknessSize = 0
local IsBorder = false
local AutoAdjustZIndex = true
local GlobalZindex = true

local WidgetUI = script.Parent.UI
WidgetUI.Parent = Widget

Launcher.Click:Connect(function()
	Widget.Enabled = not Widget.Enabled
end)

print("Plugin launched: " .. Stepika.PluginData.Name .. " using Stepika " .. Stepika.PluginData.StepikaCore)
