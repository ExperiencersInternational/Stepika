-- To start using Stepika, you'll need to fill out information about your plugin below.

local PluginData = {
	Name = "DisableCoreGUIFunctions",
	PluginDescription = "A legacy plugin to toggle GUIs.",
	Developer = "ExperiencersInternational",
	Ver = "v2.2.0",
	StepikaCore = "v0.1.0",
	PluginLogo = ""
}

-- Ignore all the below, this is what makes the module work!

local StudioInfo = {
	Theme = settings().Studio.Theme.Name,
}

local function CreateWidget(PluginDirectory, WidgetMinWidth, WidgetMinHeight)

	local Toolbar = plugin:CreateToolbar(PluginData.Name .. PluginData.Ver)
	local Launcher = Toolbar:CreateButton("Open widget", "Opens the widget for this plugin.", PluginData.PluginLogo)
	
	local Widget = plugin:CreateDockWidgetPluginGui(
		PluginData.Name,
		DockWidgetPluginGuiInfo.new(
			Enum.InitialDockState.Float,
			false,
			false,
			280,
			540,
			WidgetMinWidth,
			WidgetMinHeight
		)
	)
	
	Widget.Title = PluginData.Name
	Widget.Name = PluginData.Developer .. "." .. PluginData.Name
	
	local MaxSize = 12
	local MinSize = 6
	local ThicknessSize = 0
	local IsBorder = false
	local AutoAdjustZIndex = true
	local GlobalZindex = true
	
	local WidgetUI = Instance.new("Frame", Widget)
	WidgetUI.Name = "UI"
	
	if StudioInfo.Theme == "Dark" then
		WidgetUI.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	else
		WidgetUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
	
	return Widget
end
