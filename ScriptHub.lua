local TweenService = game:GetService("TweenService")
local TInfo = TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local Info = TweenInfo.new(20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)


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

button.Activated:Connect(function()
	if Frame.Visible == true then
		AnimateClose(Frame)
		Frame.Visible = false
	else
		Frame.Visible = true
		AnimateOpen(Frame)
		TweetPlayer(HumanoidRootPart, game.Workspace.Chest3)
	end
end)
