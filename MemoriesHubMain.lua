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
    PremiumOnly = true

        
if not game:GetService("Players").LocalPlayer then
    return
end

local allowedExecutors = {
    ["Fluxus"] = true,
    ["Delta"] = true,
    ["KRNL"] = true,
    ["Arceus X"] = true
}

if identifyexecutor and not allowedExecutors[identifyexecutor()] then
    game.Players.LocalPlayer:Kick("Executor não permitido para Memories Hub.")
    return
end


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Memories Hub | Blox Fruits", "Midnight") -- Estilo da Janela


local MainTab = Window:NewTab("Principal")
local MainSection = MainTab:NewSection("Funções")

MainSection:NewButton("Ativar Farm", "Iniciar farm automático", function()
    print("Farm automático iniciado!")
    
end)

MainSection:NewButton("Teleport Ilha", "Teleporta para a Ilha", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Exemplo de TP
end)

-- Aba de Configurações
local SettingsTab = Window:NewTab("Configurações")
local SettingsSection = SettingsTab:NewSection("Ajustes")

SettingsSection:NewSlider("Delay de Ataque", "Ajuste o tempo de ataque (0.1s recomendado)", 1, 0, function(value)
    _G.AttackDelay = value
    print("Delay de ataque definido para:", value)
end)

SettingsSection:NewButton("Desconectar", "Sai do jogo", function()
    game:Shutdown()
end)
})

SettingsTab:AddLabel("Memories Hub Oficial")

SettingsTab:AddButton({
    Name = "Fechar o Script",
    Callback = function()
        OrionLib:Destroy()
    end
})

OrionLib:Init()
