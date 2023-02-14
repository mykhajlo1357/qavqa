local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()



local Window = Library.CreateLib("Сlown Hub 🤡", "RJTheme3")

-- Секция
local Tab = Window:NewTab("Характеристики")

-- Подсекция
local Section = Tab:NewSection("Характеристики Твоего Персонажа")



-- Слайдер
Section:NewSlider("Люди пешки", "SliderInfo", 100, 0, function(h) -- 500 (Макс. значение) | 0 (Мин. значение)
   game.Players.LocalPlayer.Character.Humanoid.HipHeight = h
end)

Section:NewToggle("Спидозность", "ToggleInfo", function(state)
    if state then
        f = false
        a = true
        if (a == true) then
        while wait() do
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80
        if(f == true)then break else end
        end else f = true end
    else
        f = true 
        a = false
        if (a == false) then
        while wait() do
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 
        if(f == false)then break else end
        end else f = false end
    end
end)

Section:NewSlider("C - Moon", "SliderInfo", 1000, 0, function(g) -- 500 (Макс. значение) | 0 (Мин. значение)
   game:GetService("Workspace").Gravity = g
end)


local Tab3 = Window:NewTab("Esp")

-- Подсекция
local Sectionp = Tab3:NewSection("Способка видеть всех")

Sectionp:NewButton("Видить всех", "какай", function()
while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.50
                    esp.Color3 = Color3.fromRGB(255,216,0)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end 
end)


local Tab4 = Window:NewTab("Телепорт")

local Sectionpf = Tab4:NewSection("Телепорт мышкой")

Sectionpf:NewButton("ТП кликом", "какай", function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Click Teleport"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

local Sectionpf = Tab4:NewSection("Выбери игрока")
Plr = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Plr,v.Name) 
end
local drop = Sectionpf:NewDropdown("Игрок", "Click To Select", Plr, function(t)
   PlayerTP = t
end)
Sectionpf:NewButton("Одноразовое тп", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayerTP].Character.HumanoidRootPart.CFrame
end)
Sectionpf:NewToggle("Постояное тп", "", function(t)
_G.TPPlayer = t
while _G.TPPlayer do wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayerTP].Character.HumanoidRootPart.CFrame
end
end)

Sectionpf:NewButton("Перезапустить список игроков","Refresh Dropdown", function()
  drop:Refresh(Plr)
end)

local colors = {
	-- Цвет фона у Секций
    SchemeColor = Color3.fromRGB(255, 0, 0),
	-- Цвет фона в правой части UI
	Background = Color3.fromRGB(128,128,128),
	-- Цвет фона в левой части UI
    Header = Color3.fromRGB(255, 255, 255),
	-- Цвет текста
    TextColor = Color3.fromRGB(0, 0, 0),
	-- Цвет фона у кнопок
    ElementColor = Color3.fromRGB(139, 0, 255)
}