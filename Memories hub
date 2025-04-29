pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local namecall = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "Kick" then
            return nil
        end
        return namecall(self, unpack(args))
    end)
end)

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

getgenv().Farming = false
getgenv().ItemPreferido = "None"

function AutoFarm()
    while getgenv().Farming and task.wait(0.2) do
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10, 10, 10)
        end
    end
end

function AutoEquipItem()
    local toolPreferido = getgenv().ItemPreferido or "None"
    local backpack = game.Players.LocalPlayer.Backpack
    local character = game.Players.LocalPlayer.Character
    if toolPreferido == "None" then
        return
    end
    if backpack:FindFirstChild(toolPreferido) then
        backpack[toolPreferido].Parent = character
    elseif character:FindFirstChild(toolPreferido) then
    end
end

local Window = OrionLib:MakeWindow({
    Name = "Memories Hub | Blox Fruits",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MemoriesHubSettings"
})

local FarmTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

FarmTab:AddButton({
    Name = "Iniciar Auto Farm",
    Callback = function()
        getgenv().Farming = true
        AutoEquipItem()
        AutoFarm()
    end
})

FarmTab:AddButton({
    Name = "Parar Auto Farm",
    Callback = function()
        getgenv().Farming = false
    end
})

local EquipTab = Window:MakeTab({
    Name = "Auto Equip",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

EquipTab:AddDropdown({
    Name = "Selecionar Arma/Estilo",
    Default = "None",
    Options = {
        "None",
        "Sharkman Karate",
        "Dragon Talon",
        "Electric Claw",
        "Superhuman",
        "Buddy Sword",
        "Yama",
        "Tushita"
    },
    Callback = function(Value)
        getgenv().ItemPreferido = Value
    end
})

EquipTab:AddButton({
    Name = "Equipar Agora",
    Callback = function()
        AutoEquipItem()
    end
})

local SettingsTab = Window:MakeTab({
    Name = "Configurações",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddLabel("Memories Hub Oficial")

SettingsTab:AddButton({
    Name = "Fechar o Script",
    Callback = function()
        OrionLib:Destroy()
    end
})

OrionLib:Init()
