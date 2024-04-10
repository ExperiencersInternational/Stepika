local Stepika = {}

-- To start using Stepika, you'll need to fill out information about your plugin below.

Stepika.PluginData = {
	Name = "DisableCoreGUIFunctions",
	PluginDescription = "A legacy plugin to toggle GUIs.", -- A short description about your plugin
	Developer = "ExperiencersInternational", -- Who made the plugin
	Ver = "v2.2.0", -- The current version of your plugin
	PluginLogo = "",
	StepikaCore = "v0.2.1" -- Don't modify this, version of the Stepika module
}

-- Ignore all the below, this is what makes the module work!

Stepika.StudioInfo = {
	Theme = settings().Studio.Theme.Name,
}

function Stepika.AuroraCreateInitialScroll()
	local WidgetUI = Instance.new("Frame", script.Parent)
	WidgetUI.Name = "UI"
	WidgetUI.BackgroundTransparency = 1
	WidgetUI.Size = UDim2.new(1, 0, 1, 0)
	
	local WidgetScroll = Instance.new("ScrollingFrame", WidgetUI)
	WidgetScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	WidgetScroll.BorderSizePixel = 0
	WidgetScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	WidgetScroll.ScrollBarThickness = 4
	WidgetScroll.ScrollingDirection = Enum.ScrollingDirection.Y
	WidgetScroll.Size = UDim2.new(1, 0, 1, 0)
	
	if Stepika.StudioInfo.Theme == "Dark" then
		WidgetScroll.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	else
		WidgetScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
	
	return WidgetScroll
end

return Stepika
