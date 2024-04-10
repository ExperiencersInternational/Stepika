local Stepika = {}

-- To start using Stepika, you'll need to fill out information about your plugin below.

Stepika.PluginData = {
	Name = "DisableCoreGUIFunctions",
	PluginDescription = "A legacy plugin to toggle GUIs.", -- A short description about your plugin
	Developer = "ExperiencersInternational", -- Who made the plugin
	Ver = "v2.2.0", -- The current version of your plugin
	Build = "",
	PluginLogo = "",
	StepikaCore = "v0.3.5" -- Don't modify this, version of the Stepika module
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
	WidgetScroll.Size = UDim2.new(1, 0, 1, -16)
	WidgetScroll.Position = UDim2.new(0, 0, 0, 8)
	
	if Stepika.StudioInfo.Theme == "Dark" then
		WidgetScroll.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	else
		WidgetScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
	
	local ListLayout = Instance.new("UIListLayout", WidgetScroll)
	ListLayout.Padding = UDim.new(0, 8)
	ListLayout.FillDirection = Enum.FillDirection.Vertical
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	ListLayout.SortOrder = Enum.SortOrder.Name
	
	--local UIPadding = Instance.new("UIPadding")
	--UIPadding.PaddingBottom = UDim.new(0, 8)
	--UIPadding.PaddingLeft = UDim.new(0, 8)
	--UIPadding.PaddingRight = UDim.new(0, 8)
	--UIPadding.PaddingTop = UDim.new(0, 8)
	
	return WidgetScroll
end

function Stepika.AuroraCreateCollapsibleMenu(Name:string, InternalName:string, DarkModeIcon:string, LightModeIcon:string, DefaultState:boolean, Parent:Instance)
	local ClosedMenu = Instance.new("Frame", Parent)
	ClosedMenu.Name = InternalName .. "Closed"
	ClosedMenu.Size = UDim2.new(1, -16, 0, 24)
	ClosedMenu.Position = UDim2.new(0, 0, 0, 8)
	
	local CUICorner = Instance.new("UICorner", ClosedMenu)
	CUICorner.CornerRadius = UDim.new(0, 8)
	
	local CUIPadding = Instance.new("UIPadding", ClosedMenu)
	CUIPadding.PaddingBottom = UDim.new(0, 4)
	CUIPadding.PaddingLeft = UDim.new(0, 4)
	CUIPadding.PaddingRight = UDim.new(0, 4)
	CUIPadding.PaddingTop = UDim.new(0, 4)
	
	local CTitleFrame = Instance.new("Frame", ClosedMenu)
	CTitleFrame.Name = "TitleElements"
	CTitleFrame.BackgroundTransparency = 1
	CTitleFrame.Size = UDim2.new(1, 0, 0, 16)
	
	local CLogo = Instance.new("ImageLabel", CTitleFrame)
	CLogo.BackgroundTransparency = 1
	CLogo.Size = UDim2.new(0, 16, 0, 16)
	
	local CTitle = Instance.new("TextLabel", CTitleFrame)
	CTitle.Text = Name
	CTitle.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	CTitle.Position = UDim2.new(0, 20, 0, 0)
	CTitle.Size = UDim2.new(1, -64, 0, 16)
	CTitle.BackgroundTransparency = 1
	CTitle.TextSize = 16
	CTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	local CToggle = Instance.new("TextButton", CTitleFrame)
	CToggle.BackgroundTransparency = 1
	CToggle.Size = UDim2.new(0, 40, 0, 16)
	CToggle.AnchorPoint = Vector2.new(1, 0)
	CToggle.Position = UDim2.new(1, 0, 0, 0)
	CToggle.Text = "Show"
	CToggle.TextColor3 = Color3.fromRGB(0, 170, 255)
	CToggle.TextXAlignment = Enum.TextXAlignment.Right
	CToggle.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	CToggle.TextSize = 16
	
	local CScript = Instance.new("Script", CToggle)
	CScript.Source = [[script.Parent.MouseButton1Click:Connect(function()
	local Container = script.Parent.Parent.Parent
	Container.Parent.]] .. InternalName .. [[Open.Visible = true
	Container.Visible = false
end)
	]]
	
	if Stepika.StudioInfo.Theme == "Dark" then
		ClosedMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		CLogo.Image = DarkModeIcon
		CTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	else
		ClosedMenu.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
		CLogo.Image = LightModeIcon
		CTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
	end
	
	-- Open frame
	
	local OpenMenu = Instance.new("Frame", Parent)
	OpenMenu.Name = InternalName .. "Open"
	OpenMenu.Size = UDim2.new(1, -16, 0, 24)
	OpenMenu.Position = UDim2.new(0, 0, 0, 8)
	OpenMenu.AutomaticSize = Enum.AutomaticSize.Y

	local OUICorner = Instance.new("UICorner", OpenMenu)
	OUICorner.CornerRadius = UDim.new(0, 8)

	local OUIPadding = Instance.new("UIPadding", OpenMenu)
	OUIPadding.PaddingBottom = UDim.new(0, 4)
	OUIPadding.PaddingLeft = UDim.new(0, 4)
	OUIPadding.PaddingRight = UDim.new(0, 4)
	OUIPadding.PaddingTop = UDim.new(0, 4)

	local OTitleFrame = Instance.new("Frame", OpenMenu)
	OTitleFrame.Name = "TitleElements"
	OTitleFrame.BackgroundTransparency = 1
	OTitleFrame.Size = UDim2.new(1, 0, 0, 16)

	local OLogo = Instance.new("ImageLabel", OTitleFrame)
	OLogo.BackgroundTransparency = 1
	OLogo.Size = UDim2.new(0, 16, 0, 16)

	local OTitle = Instance.new("TextLabel", OTitleFrame)
	OTitle.Text = Name
	OTitle.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	OTitle.Position = UDim2.new(0, 20, 0, 0)
	OTitle.Size = UDim2.new(1, -64, 0, 16)
	OTitle.BackgroundTransparency = 1
	OTitle.TextSize = 16
	OTitle.TextXAlignment = Enum.TextXAlignment.Left

	local OToggle = Instance.new("TextButton", OTitleFrame)
	OToggle.BackgroundTransparency = 1
	OToggle.Size = UDim2.new(0, 40, 0, 16)
	OToggle.AnchorPoint = Vector2.new(1, 0)
	OToggle.Position = UDim2.new(1, 0, 0, 0)
	OToggle.Text = "Hide"
	OToggle.TextColor3 = Color3.fromRGB(0, 170, 255)
	OToggle.TextXAlignment = Enum.TextXAlignment.Right
	OToggle.FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	OToggle.TextSize = 16

	local OScript = Instance.new("Script", OToggle)
	OScript.Source = [[script.Parent.MouseButton1Click:Connect(function()
	local Container = script.Parent.Parent.Parent
	Container.Parent.]] .. InternalName .. [[Closed.Visible = true
	Container.Visible = false
end)
	]]
	
	local OContainer = Instance.new("Frame", OpenMenu)
	OContainer.Name = "Container"
	OContainer.BackgroundTransparency = 1
	OContainer.Size = UDim2.new(1, 0, 1, -20)
	OContainer.Position = UDim2.new(0, 0, 0, 20)

	if Stepika.StudioInfo.Theme == "Dark" then
		OpenMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		OLogo.Image = DarkModeIcon
		OTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	else
		OpenMenu.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
		OLogo.Image = LightModeIcon
		OTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
	end
	
	if DefaultState == true then
		ClosedMenu.Visible = false
	else
		OpenMenu.Visible = false
	end
		
	return ClosedMenu, OpenMenu, OContainer
end

return Stepika
