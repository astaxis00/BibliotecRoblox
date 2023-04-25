local GuiLibrary = {}

-- Cria uma nova janela com o título especificado
function GuiLibrary.new(title)
    local gui = {}
    
     -- Cria a gui

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Cria a janela
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 200)
    frame.Position = UDim2.new(0.5, -100, 0.5, -100)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.new(1, 1, 1)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = game:GetService("Players").LocalPlayer.PlayerGui

    -- Adiciona o título
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 20)
    titleBar.BackgroundColor3 = Color3.new(0, 0, 0)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = frame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -6, 1, -6)
    titleLabel.Position = UDim2.new(0, 3, 0, 3)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    -- Adiciona um botão
    function gui.button(text, callback)
        local button = Instance.new("TextButton")
        button.Text = text
        button.Size = UDim2.new(0, 100, 0, 30)
        button.Position = UDim2.new(0.5, -50, 0.5, 30)
        button.Parent = frame

        button.MouseButton1Click:Connect(function()
            callback()
        end)
    end

    return gui
end

return GuiLibrary
