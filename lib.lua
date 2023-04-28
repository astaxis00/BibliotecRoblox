local AstLib = {}

local Core = Instance.new("ScreenGui")
Core.Parent = game:GetService("CoreGui")

function AstLib.CreateWindown(name)
	local Win = Instance.new("Frame")
	local Header = Instance.new("Frame")
	local ExecName = Instance.new("TextLabel")
	
	Win.Name = "Menu"
	Win.Parent = Core
	Win.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
	Win.BorderSizePixel = 0
	Win.Position = UDim2.new(0.175014824, 0, 0.430174559, 0)
	Win.Size = UDim2.new(0, 574, 0, 292)
	
	Header.Name = "Header"
	Header.Parent = Win
	Header.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
	Header.BorderSizePixel = 0
	Header.Size = UDim2.new(0, 574, 0, 33)

	ExecName.Name = "ExecName"
	ExecName.Parent = Header
	ExecName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExecName.BackgroundTransparency = 1.000
	ExecName.Position = UDim2.new(0.0087108016, 0, 0, 0)
	ExecName.Size = UDim2.new(0, 166, 0, 32)
	ExecName.Font = Enum.Font.GothamBold
	ExecName.Text = name
	ExecName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ExecName.TextScaled = true
	ExecName.TextSize = 14.000
	ExecName.TextWrapped = true
	ExecName.TextXAlignment = Enum.TextXAlignment.Left
	
	local function DragScript()
		local script = Instance.new('LocalScript', Win)

		local UserInputService = game:GetService("UserInputService")

		local gui = Win

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)

	end
	coroutine.wrap(DragScript)()

end

return AstLib
