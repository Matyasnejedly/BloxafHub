local TweenService = game:GetService("TweenService")
local TInfo = TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local Info = TweenInfo.new(30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)


local function AnimateOpen(Frame: Frame)
	Frame.Position = UDim2.fromScale(0.332, 1)
	
	TweenService:Create(Frame, TInfo, { Position = UDim2.fromScale(0.332, 0.279) }):Play()
	wait(.2)
end

local function AnimateClose(Frame: Frame)
	Frame.Position = UDim2.fromScale(0.332, 0.279)
	
	TweenService:Create(Frame, TInfo, { Position = UDim2.fromScale(0.332, 1) }):Play()
	wait(.2)
end

local function TweetPlayer(HumanoidRootPart: Part, Goal: Part)
	local Goals =
		{
			CFrame = Goal.CFrame
		}
	local tween = TweenService:Create(HumanoidRootPart,Info,Goals)
	tween:Play()
end

local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "ScriptGui"

local button = Instance.new("TextButton", gui)
button.Name = "But"
button.Text = "Close/Open"
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.Position = UDim2.fromScale(0.108, 0.269)
button.Size = UDim2.fromScale(0.061, 0.099)
button.BackgroundTransparency = 0.5

local UiCorner = Instance.new("UICorner", button)

local UiStroke = Instance.new("UIStroke", button)
UiStroke.ApplyStrokeMode = "Border"

local Frame = Instance.new("Frame", gui)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.3
Frame.Position = UDim2.fromScale(0.332, 0.279)
Frame.Size = UDim2.fromScale(0.335, 0.441)
Frame.Visible = false

local UiCornerFrame = Instance.new("UICorner", Frame)

local UiStrokeFrame = Instance.new("UIStroke", Frame)

local DiaChest = Instance.new("TextButton", Frame)
DiaChest.BackgroundColor3 = Color3.fromRGB(57,136,255)
DiaChest.Position = UDim2.fromScale(0.145, 0.092)
DiaChest.Size = UDim2.fromScale(0.709, 0.229)
DiaChest.Text = "DiaChest"

local GoldChest = Instance.new("TextButton", Frame)
GoldChest.BackgroundColor3 = Color3.fromRGB(182,195,35)
GoldChest.Position = UDim2.fromScale(0.145, 0.385)
GoldChest.Size = UDim2.fromScale(0.709, 0.229)
GoldChest.Text = "GoldChest"

local BronzChest = Instance.new("TextButton", Frame)
BronzChest.BackgroundColor3 = Color3.fromRGB(43,24,7)
BronzChest.Position = UDim2.fromScale(0.145, 0.683)
BronzChest.Size = UDim2.fromScale(0.709, 0.229)
BronzChest.Text = "BronzChest"

button.Activated:Connect(function()
	if Frame.Visible == true then
		AnimateClose(Frame)
		Frame.Visible = false
	else
		Frame.Visible = true
		AnimateOpen(Frame)
	end
end)

BronzChest.Activated:Connect(function()
	if game.Workspace.Chest1 then
		BronzChest.Text = "BronzChest Found"
		TweetPlayer(HumanoidRootPart, game.Workspace.Chest1)
		BronzChest.Text = "BronzChest"
	else
		BronzChest.Text = "BronzChest Not Found"
		wait(1)
		BronzChest.Text = "BronzChest"
	end
end)

GoldChest.Activated:Connect(function()
	if game.Workspace.Chest2 then
		GoldChest.Text = "GoldChest Found"
		TweetPlayer(HumanoidRootPart, game.Workspace.Chest2)
		GoldChest.Text = "GoldChest"
	else
		GoldChest.Text = "GoldChest Not Found"
		wait(1)
		GoldChest.Text = "GoldChest"
	end
end)

DiaChest.Activated:Connect(function()
	if game.Workspace.Chest3 then
		BronzChest.Text = "DiaChest Found"
		TweetPlayer(HumanoidRootPart, game.Workspace.Chest3)
		BronzChest.Text = "DiaChest"
	else
		BronzChest.Text = "DiaChest Not Found"
		wait(1)
		BronzChest.Text = "DiaChest"
	end
end)
