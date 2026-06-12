-- // ohick.hub.V3.exe - STABLE VERSION (BLACK & WHITE + COLORS) [MODIFICADO COM TEMA CORRIGIDO + PLATAFORMA + ANTI KICK]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer

-- // CONFIGURAÇÕES GERAIS
_G.Aimbot = false
_G.AimbotMode = "Normal" 
_G.ExibirFOV = false
_G.AimFOV = 25
_G.AimSmooth = 0.4
_G.AimDistance = 500
_G.TargetPart = "Head"
_G.AimTeamCheck = false
_G.ESP_Line = false
_G.ESP_Box = false
_G.ESP_Name = false
_G.ESP_Distance = false
_G.ESP_Health = false
_G.ESP_Holograma = false
_G.ESP_Skeleton = false
_G.FullBright = false
_G.SpinBot = false
_G.Noclip = false
_G.Fly = false
_G.EnableSpeed = false
_G.PlayerSpeed = 16
_G.EnableJump = false
_G.PlayerJump = 50
_G.ExpandHitbox = false
_G.HitboxSize = 5
_G.Platform = false
_G.AntiKick = false
_G.BypassFriend = false

-- // CONFIGURAÇÕES DE TEMA (PRETO E BRANCO + MAIS CORES)
_G.MenuColor = Color3.fromRGB(255, 255, 255)
_G.ESPColor = Color3.fromRGB(0, 120, 255)
_G.ESPUseCustomColor = false
_G.ThemeElements = {Bg = {}, Border = {}, Stroke = {}}
_G.SelectorUpdaters = {}

-- // INTERFACE (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OhickV3_Final"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true



-- // CÍRCULO DO FOV (PRETO)
local FOVFrame = Instance.new("Frame")
FOVFrame.Name = "FOV_Circle"
FOVFrame.Parent = ScreenGui
FOVFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FOVFrame.BackgroundTransparency = 1
FOVFrame.AnchorPoint = Vector2.new(0.5, 0.5) 
FOVFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVFrame.Visible = false

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 3.5
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Parent = FOVFrame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = FOVFrame

-- // MENU PRINCIPAL
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 450, 0, 320)
Main.Position = UDim2.new(0.5, -200, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,16)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromRGB(60,60,70)
MainStroke.Parent = Main

Main.BorderColor3 = _G.MenuColor
Main.Active = true
Main.Draggable = true
Main.Visible = true
Main.Parent = ScreenGui
table.insert(_G.ThemeElements.Border, Main)

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 25)
Top.BackgroundColor3 = Color3.fromRGB(255,255,255)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0,16)
TopCorner.Parent = Top

Top.Parent = Main
table.insert(_G.ThemeElements.Bg, Top)

local Title = Instance.new("TextLabel")
Title.Text = "> ohick menu by @o.mano.dos.xits"
Title.Size = UDim2.new(1, -35, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.TextColor3 = Color3.fromRGB(0, 0, 0)          -- Fundo branco → texto preto
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "---"
CloseBtn.Size = UDim2.new(0, 30, 1, 0)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)       -- Fundo branco → texto preto
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Top



-- ABAS
local TabHolder = Instance.new("Frame")
TabHolder.Size = UDim2.new(1, 0, 0, 25)
TabHolder.Position = UDim2.new(0, 0, 0, 25)
TabHolder.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabHolder.Parent = Main

local function CreateTab(name, x)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.25, 0, 1, 0)
    b.Position = UDim2.new(x, 0, 0, 0)
    b.BackgroundTransparency = 1
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.fromRGB(255, 255, 255)     -- Fundo preto → texto branco
    b.TextSize = 11
    b.Parent = TabHolder
    return b
end

local bAim = CreateTab("COMBATE", 0)
local bEsp = CreateTab("VISUAL", 0.25)
local bExt = CreateTab("OUTROS", 0.5)
local bThe = CreateTab("TEMA", 0.75) 

local Pages = {}
local function CreatePage(name)
    local p = Instance.new("ScrollingFrame")
    p.Size = UDim2.new(1, -10, 1, -65)
    p.Position = UDim2.new(0, 5, 0, 55)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 2
    p.ScrollBarImageColor3 = _G.MenuColor
    p.Parent = Main
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 6)
    Pages[name] = p
end

CreatePage("AIM"); CreatePage("ESP"); CreatePage("EXT"); CreatePage("THEME")
Pages["AIM"].Visible = true

-- ==================== DIVISÓRIA VISUAL ====================
local function AddDivider(parent, text)
    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, 0, 0, 28)
    divider.BackgroundTransparency = 1
    divider.Parent = parent

    -- Barra horizontal
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, -20, 0, 2)
    line.Position = UDim2.new(0, 10, 0.5, 0)
    line.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
    line.BorderSizePixel = 0
    line.Parent = divider

    -- Texto da divisória
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = divider
end

bAim.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end Pages["AIM"].Visible = true end)
bEsp.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end Pages["ESP"].Visible = true end)
bExt.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end Pages["EXT"].Visible = true end)
bThe.MouseButton1Click:Connect(function() for _,v in pairs(Pages) do v.Visible = false end Pages["THEME"].Visible = true end)

-- UI HELPERS (TEXTO CORRIGIDO: fundo branco = preto | fundo preto = branco)
local function AddToggle(name, var, parent)
    local f = Instance.new("Frame"); f.Size = UDim2.new(1, 0, 0, 22); f.BackgroundTransparency = 1; f.Parent = parent
    local b = Instance.new("TextButton"); b.Size = UDim2.new(0, 14, 0, 14); b.Position = UDim2.new(0, 8, 0.5, -7); b.BackgroundColor3 = Color3.fromRGB(25,25,25); b.Text = ""; b.Parent = f
    local m = Instance.new("Frame"); m.Size = UDim2.new(0.6, 0, 0.6, 0); m.Position = UDim2.new(0.2, 0, 0.2, 0); m.BackgroundColor3 = _G.MenuColor; m.Visible = _G[var]; m.Parent = b
    table.insert(_G.ThemeElements.Bg, m)
    
    local l = Instance.new("TextLabel"); l.Text = name; l.Position = UDim2.new(0, 30, 0, 0); l.Size = UDim2.new(1, -35, 1, 0); 
    l.TextColor3 = Color3.fromRGB(255, 255, 255)     -- Fundo escuro da página → texto branco
    l.BackgroundTransparency = 1; l.Font = Enum.Font.GothamBold; l.TextSize = 12; l.TextXAlignment = Enum.TextXAlignment.Left; l.Parent = f
    b.MouseButton1Click:Connect(function() _G[var] = not _G[var]; m.Visible = _G[var] end)
end

local function AddSlider(name, min, max, var, parent, spaceBefore)
    if spaceBefore then
        local spacer = Instance.new("Frame"); spacer.Size = UDim2.new(1, 0, 0, 10); spacer.BackgroundTransparency = 1; spacer.Parent = parent
    end
    local container = Instance.new("Frame"); container.Size = UDim2.new(1, 0, 0, 30); container.BackgroundTransparency = 1; container.Parent = parent
    local l = Instance.new("TextLabel"); l.Text = name..": "..math.floor(_G[var]); l.Size = UDim2.new(1, 0, 0, 12); 
    l.TextColor3 = Color3.fromRGB(255, 255, 255)     -- Fundo escuro → texto branco
    l.BackgroundTransparency = 1; l.Font = Enum.Font.GothamBold; l.TextSize = 10; l.Parent = container
    local sb = Instance.new("TextButton"); sb.Size = UDim2.new(0.85, 0, 0, 3); sb.Position = UDim2.new(0, 0, 0, 18); sb.BackgroundColor3 = Color3.fromRGB(35,35,35); sb.Text = ""; sb.AutoButtonColor = false; sb.Parent = container
    local fi = Instance.new("Frame"); fi.Size = UDim2.new((_G[var]-min)/(max-min), 0, 1, 0); fi.BackgroundColor3 = _G.MenuColor; fi.BorderSizePixel = 0; fi.Parent = sb
    table.insert(_G.ThemeElements.Bg, fi)
    
    local drag = false
    local function Update()
        local pos = math.clamp((UIS:GetMouseLocation().X - sb.AbsolutePosition.X)/sb.AbsoluteSize.X, 0, 1)
        local val = min + (max-min)*pos
        _G[var] = val
        fi.Size = UDim2.new(pos, 0, 1, 0)
        l.Text = name..": "..math.floor(val)
    end
    sb.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = true end end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then drag = false end end)
    RunService.RenderStepped:Connect(function() if drag then Update() end end)
end

local function AddTargetSelector(parent)
    local container = Instance.new("Frame"); container.Size = UDim2.new(1, 0, 0, 45); container.BackgroundTransparency = 1; container.Parent = parent
    local label = Instance.new("TextLabel"); label.Text = "ALVO DO AIMBOT:"; label.Size = UDim2.new(1, 0, 0, 20); 
    label.TextColor3 = Color3.fromRGB(255, 255, 255)     -- Fundo escuro → texto branco
    label.BackgroundTransparency = 1; label.Font = Enum.Font.GothamBold; label.TextSize = 11; label.Parent = container
    local btnFrame = Instance.new("Frame"); btnFrame.Size = UDim2.new(1, 0, 0, 25); btnFrame.Position = UDim2.new(0, 0, 0, 20); btnFrame.BackgroundTransparency = 1; btnFrame.Parent = container
    local buttons = {}; local parts = {["CABEÇA"] = "Head", ["PEITO"] = "UpperTorso"}

    local function updateButtons()
        for name, btn in pairs(buttons) do
            local isSelected = (parts[name] == _G.TargetPart)
            btn.BackgroundColor3 = isSelected and _G.MenuColor or Color3.fromRGB(25, 25, 25)
            btn.TextColor3 = isSelected and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255) -- branco fundo = preto | preto fundo = branco
        end
    end
    table.insert(_G.SelectorUpdaters, updateButtons)

    local count = 0
    for name, part in pairs(parts) do
        local b = Instance.new("TextButton"); b.Size = UDim2.new(0.45, 0, 0.8, 0); b.Position = UDim2.new(0.02 + (count * 0.48), 0, 0, 0); b.Text = name; b.Font = Enum.Font.GothamBold; b.TextSize = 10; b.BorderSizePixel = 0; b.Parent = btnFrame
        buttons[name] = b
        b.MouseButton1Click:Connect(function() _G.TargetPart = part; updateButtons() end)
        count = count + 1
    end
    updateButtons()
end

local function AddModeSelector(parent)
    local container = Instance.new("Frame"); container.Size = UDim2.new(1, 0, 0, 45); container.BackgroundTransparency = 1; container.Parent = parent
    local label = Instance.new("TextLabel"); label.Text = "MODO DO AIMBOT:"; label.Size = UDim2.new(1, 0, 0, 20); 
    label.TextColor3 = Color3.fromRGB(255, 255, 255)     -- Fundo escuro → texto branco
    label.BackgroundTransparency = 1; label.Font = Enum.Font.GothamBold; label.TextSize = 11; label.Parent = container
    local btnFrame = Instance.new("Frame"); btnFrame.Size = UDim2.new(1, 0, 0, 25); btnFrame.Position = UDim2.new(0, 0, 0, 20); btnFrame.BackgroundTransparency = 1; btnFrame.Parent = container
    local buttons = {}; local modes = {"Legit", "Normal", "Rage"}

    local function updateButtons()
        for name, btn in pairs(buttons) do
            local isSelected = (name == _G.AimbotMode)
            btn.BackgroundColor3 = isSelected and _G.MenuColor or Color3.fromRGB(25, 25, 25)
            btn.TextColor3 = isSelected and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255) -- branco fundo = preto | preto fundo = branco
        end
    end
    table.insert(_G.SelectorUpdaters, updateButtons)

    local count = 0
    for _, mode in pairs(modes) do
        local b = Instance.new("TextButton"); b.Size = UDim2.new(0.3, 0, 0.8, 0); b.Position = UDim2.new(0.02 + (count * 0.32), 0, 0, 0); b.Text = mode; b.Font = Enum.Font.GothamBold; b.TextSize = 10; b.BorderSizePixel = 0; b.Parent = btnFrame
        buttons[mode] = b
        b.MouseButton1Click:Connect(function() _G.AimbotMode = mode; updateButtons() end)
        count = count + 1
    end
    updateButtons()
end

local function AddColorPicker(name, targetVar, parent)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 55)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local label = Instance.new("TextLabel")
    label.Text = name
    label.Size = UDim2.new(1, 0, 0, 20)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local pickerBtn = Instance.new("TextButton")
    pickerBtn.Size = UDim2.new(0, 160, 0, 30)
    pickerBtn.Position = UDim2.new(0, 0, 0, 23)
    pickerBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    pickerBtn.Text = "🎨 Escolher Cor"
    pickerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    pickerBtn.Font = Enum.Font.GothamBold
    pickerBtn.TextSize = 13
    pickerBtn.Parent = container

    local UICornerBtn = Instance.new("UICorner")
    UICornerBtn.CornerRadius = UDim.new(0, 6)
    UICornerBtn.Parent = pickerBtn

    -- ==================== POPUP ====================
-- ==================== POPUP ====================
local popup = Instance.new("Frame")
popup.Name = "ColorPickerPopup"
popup.Size = UDim2.new(0, 235, 0, 245)        -- ← Tamanho aumentado
popup.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
popup.BorderSizePixel = 0
popup.Visible = false
popup.ZIndex = 1000
popup.Parent = ScreenGui
    local popupCorner = Instance.new("UICorner")
    popupCorner.CornerRadius = UDim.new(0, 8)
    popupCorner.Parent = popup

    -- Top Bar (Arrastável)
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 30)
    topBar.BackgroundColor3 = _G.MenuColor
    topBar.Parent = popup

    local topCorner = Instance.new("UICorner")
    topCorner.CornerRadius = UDim.new(0, 8)
    topCorner.Parent = topBar

    local title = Instance.new("TextLabel")
    title.Text = "Escolha a Cor"
    title.Size = UDim2.new(1, -40, 1, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(0, 0, 0)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Position = UDim2.new(0, 10, 0, 0)
    title.Parent = topBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "✕"
    closeBtn.Size = UDim2.new(0, 30, 1, 0)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundTransparency = 1
    closeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 16
    closeBtn.Parent = topBar

    -- Grid de Cores
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -20, 1, -45)
    content.Position = UDim2.new(0, 10, 0, 35)
    content.BackgroundTransparency = 1
    content.Parent = popup

    local colors = {
        Color3.fromRGB(255,255,255), Color3.fromRGB(0,0,0),
        Color3.fromRGB(255,0,0),   Color3.fromRGB(0,255,0),
        Color3.fromRGB(0,120,255), Color3.fromRGB(255,255,0),
        Color3.fromRGB(255,0,255), Color3.fromRGB(0,255,255),
        Color3.fromRGB(255,165,0), Color3.fromRGB(128,0,128),
        Color3.fromRGB(255,192,203), Color3.fromRGB(0,128,0),
        Color3.fromRGB(255,69,0),  Color3.fromRGB(138,43,226),
        Color3.fromRGB(0,255,127), Color3.fromRGB(255,215,0)
    }

    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0, 42, 0, 42)
    grid.CellPadding = UDim2.new(0, 10, 0, 10)
    grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    grid.Parent = content

    for _, color in ipairs(colors) do
        local btn = Instance.new("TextButton")
        btn.BackgroundColor3 = color
        btn.Text = ""
        btn.BorderSizePixel = 2
        btn.BorderColor3 = Color3.fromRGB(50, 50, 50)
        btn.Parent = content

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btn

        btn.MouseButton1Click:Connect(function()
            if targetVar == "Menu" then
                _G.MenuColor = color
                for _, v in pairs(_G.ThemeElements.Bg) do v.BackgroundColor3 = color end
                for _, v in pairs(_G.ThemeElements.Border) do v.BorderColor3 = color end
                for _, v in pairs(_G.ThemeElements.Stroke) do v.Color = color end
                for _, func in pairs(_G.SelectorUpdaters) do func() end
            elseif targetVar == "ESP" then
                _G.ESPColor = color
            end
            popup.Visible = false
        end)
    end

    -- ====== DRAG FUNCTION ======
    local dragging = false
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        popup.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = popup.Position
        end
    end)

    topBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)

    -- Abrir popup
    pickerBtn.MouseButton1Click:Connect(function()
        popup.Visible = not popup.Visible
        if popup.Visible then
            local btnPos = pickerBtn.AbsolutePosition
            popup.Position = UDim2.new(0, btnPos.X + 170, 0, btnPos.Y - 30)
        end
    end)

    -- Fechar
    closeBtn.MouseButton1Click:Connect(function()
        popup.Visible = false
    end)

    -- Fechar ao clicar fora
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and popup.Visible then
            local mouse = game:GetService("UserInputService"):GetMouseLocation()
            local pPos = popup.AbsolutePosition
            local pSize = popup.AbsoluteSize
            if not (mouse.X >= pPos.X and mouse.X <= pPos.X + pSize.X and mouse.Y >= pPos.Y and mouse.Y <= pPos.Y + pSize.Y) then
                popup.Visible = false
            end
        end
    end)
end

-- GERANDO UI AIM
AddToggle("ATIVAR AIMBOT", "Aimbot", Pages["AIM"])
AddToggle("AIM FRIEND", "BypassFriend", Pages["AIM"])
AddToggle("AIM TIME", "AimTeamCheck", Pages["AIM"])
AddModeSelector(Pages["AIM"])
AddToggle("EXIBIR FOV", "ExibirFOV", Pages["AIM"])
AddSlider("RAIO DO FOV", 1, 150, "AimFOV", Pages["AIM"])
AddTargetSelector(Pages["AIM"])
AddSlider("DISTÂNCIA MÁXIMA (m)", 1, 1000, "AimDistance", Pages["AIM"], true)

-- GERANDO UI ESP

AddDivider(Pages["ESP"], "ESP")

AddToggle("ESP LINHA", "ESP_Line", Pages["ESP"])
AddToggle("ESP BOX", "ESP_Box", Pages["ESP"])
AddToggle("ESP NOME", "ESP_Name", Pages["ESP"])
AddToggle("ESP DISTÂNCIA", "ESP_Distance", Pages["ESP"])
AddToggle("ESP VIDA", "ESP_Health", Pages["ESP"])
AddToggle("ESP HOLOGRAMA (CHAMS)", "ESP_Holograma", Pages["ESP"])
AddToggle("ESP ESQUELETO", "ESP_Skeleton", Pages["ESP"])
AddToggle("FULL BRIGHT (MAPA CLARO)", "FullBright", Pages["ESP"])

-- GERANDO UI EXTRAS (NOVOS: PLATAFORMA + ANTI KICK)
AddToggle("SPIN BOT", "SpinBot", Pages["EXT"])
AddToggle("FLY (VOAR)", "Fly", Pages["EXT"])
AddToggle("ATRAVESSAR PAREDES", "Noclip", Pages["EXT"])
AddToggle("ATIVAR VELOCIDADE (𝐑𝐀𝐆𝐄)", "EnableSpeed", Pages["EXT"])
AddSlider("VELOCIDADE", 16, 200, "PlayerSpeed", Pages["EXT"])
AddToggle("ATIVAR PULO (𝐑𝐀𝐆𝐄)", "EnableJump", Pages["EXT"])
AddSlider("ALTURA DO PULO", 50, 300, "PlayerJump", Pages["EXT"])
AddToggle("EXPANDIR HITBOX (𝐑𝐀𝐆𝐄)", "ExpandHitbox", Pages["EXT"])
AddSlider("TAMANHO DA HITBOX", 2, 50, "HitboxSize", Pages["EXT"], true)
AddToggle("PLATAFORMA NO PULO", "Platform", Pages["EXT"])
AddToggle("ANTI KICK", "AntiKick", Pages["EXT"])

-- GERANDO UI TEMA
AddColorPicker("COR PRINCIPAL DO MENU:", "Menu", Pages["THEME"])
local spacerTheme = Instance.new("Frame"); spacerTheme.Size = UDim2.new(1, 0, 0, 10); spacerTheme.BackgroundTransparency = 1; spacerTheme.Parent = Pages["THEME"]
AddToggle("FORÇAR COR NO ESP (IGNORAR TEAM)", "ESPUseCustomColor", Pages["THEME"])
AddColorPicker("COR CUSTOMIZADA DO ESP:", "ESP", Pages["THEME"])

-- // LÓGICA FULL BRIGHT
RunService.RenderStepped:Connect(function()
    if _G.FullBright then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
    end
end)

-- // LÓGICA AIMBOT
local function GetBodyPart(char)
    if _G.TargetPart == "Head" then return char:FindFirstChild("Head")
    else return char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart") end
end

RunService.RenderStepped:Connect(function()
    local size = _G.AimFOV * 10
    FOVFrame.Size = UDim2.new(0, size, 0, size)
    FOVFrame.Visible = _G.ExibirFOV
    if _G.SpinBot and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(45), 0)
    end
    if _G.Aimbot then
        local currentSize, currentSmooth = size, _G.AimSmooth
        if _G.AimbotMode == "Rage" then currentSize, currentSmooth = 100000, 1 
        elseif _G.AimbotMode == "Legit" then currentSize, currentSmooth = size * 0.4, _G.AimSmooth * 0.2 end
        local t, d = nil, currentSize/2
        for _, v in pairs(Players:GetPlayers()) do
    if v ~= Player and v.Character then
        
        -- Bypass Friend
        if _G.BypassFriend and Player:IsFriendsWith(v.UserId) then
            continue
        end
        
        if _G.AimTeamCheck and v.Team == Player.Team then
            continue
        end
                local part = GetBodyPart(v.Character)
                if part then
                    local dist = (Camera.CFrame.Position - part.Position).Magnitude
                    if dist <= _G.AimDistance then
                        local p, s = Camera:WorldToViewportPoint(part.Position)
                        if s then
                            local mag = (Vector2.new(p.X, p.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                            if mag < d then d = mag; t = part end
                        end
                    end
                end
            end
        end
        if t then Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, t.Position), currentSmooth) end
    end
end)

-- // LÓGICA EXPANDIR HITBOX
RunService.RenderStepped:Connect(function()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = v.Character.HumanoidRootPart
            if _G.ExpandHitbox then
                hrp.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                hrp.Transparency = 0.7 
                hrp.CanCollide = false
            else
                hrp.Size = Vector3.new(2, 2, 1) 
                hrp.Transparency = 1
            end
        end
    end
end)

-- // LÓGICA ESP E CHAMS
local function CreateESP(target)
    local Line = Drawing.new("Line"); local Box = Drawing.new("Square"); local Name = Drawing.new("Text"); local Dist = Drawing.new("Text"); local HP = Drawing.new("Line")
    local Skeleton = {}; for i=1, 14 do Skeleton[i] = Drawing.new("Line") end
    
    local Highlight = Instance.new("Highlight") 
    Highlight.Enabled = false
    Highlight.FillTransparency = 0.5
    Highlight.OutlineTransparency = 0
    
    Box.Thickness, Box.Filled = 1, false

    Name.Size = 11
    Name.Outline = true
    Name.OutlineColor = Color3.fromRGB(0, 0, 0)
    Dist.Size = 11
    Dist.Outline = true
    Dist.OutlineColor = Color3.fromRGB(0, 0, 0)

    RunService.RenderStepped:Connect(function()
                local char = target.Character
        if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
            local hrp, hum = char.HumanoidRootPart, char.Humanoid
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

local isFriend = _G.BypassFriend and Player:IsFriendsWith(target.UserId)

local renderColor
if isFriend then
    renderColor = Color3.fromRGB(0, 0, 0)
else
    renderColor = _G.ESPUseCustomColor and _G.ESPColor or ((target.Team ~= Player.Team) and Color3.fromRGB(255,0,0) or Color3.fromRGB(255,255,255))
end

if _G.ESP_Holograma then
    Highlight.Parent = char
    Highlight.Enabled = true
    Highlight.FillColor = renderColor
    Highlight.OutlineColor = Color3.fromRGB(255,255,255)
else
    Highlight.Enabled = false
end

if onScreen then
    local topPos = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2.5, 0))
    local bottomPos = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3.5, 0))

    local height = math.abs(topPos.Y - bottomPos.Y)
    local width = height * 0.55

    local centerX = pos.X
    local centerY = (topPos.Y + bottomPos.Y) / 2

    local sx = width
    local sy = height

    Line.Visible = _G.ESP_Line
    Line.From = Vector2.new(
    Camera.ViewportSize.X/2,
    Camera.ViewportSize.Y/2
)
    Line.To = Vector2.new(pos.X, pos.Y)
    Line.Color = renderColor

    Box.Visible = _G.ESP_Box
    Box.Size = Vector2.new(sx, sy)
    Box.Position = Vector2.new(centerX - sx/2, centerY - sy/2)
    Box.Color = renderColor

    local distValue = math.floor((Camera.CFrame.Position - hrp.Position).Magnitude)
                local nameText = target.Name
                if _G.ESP_Distance then
                    nameText = nameText .. " [" .. distValue .. "m]"
                end
                Name.Visible = _G.ESP_Name
                Name.Text = nameText
                Name.Position = Vector2.new(pos.X, pos.Y - sy/2 - 15)
                Name.Color = renderColor
                
                Dist.Visible = false
                
                if _G.ESP_Health then
                    HP.Visible = true; HP.From = Vector2.new(pos.X - sx/2 - 5, pos.Y + sy/2); HP.To = Vector2.new(pos.X - sx/2 - 5, pos.Y + sy/2 - (sy * (hum.Health/hum.MaxHealth))); HP.Color = Color3.fromRGB(0, 255, 0)
                else HP.Visible = false end
                
                if _G.ESP_Skeleton then
                    local joints = {
                        {char:FindFirstChild("Head"), char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")},
                        {char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"), char:FindFirstChild("LowerTorso") or char:FindFirstChild("HumanoidRootPart")},
                        {char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"), char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm")},
                        {char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm"), char:FindFirstChild("LeftLowerArm")},
                        {char:FindFirstChild("LeftLowerArm"), char:FindFirstChild("LeftHand")},
                        {char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"), char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm")},
                        {char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm"), char:FindFirstChild("RightLowerArm")},
                        {char:FindFirstChild("RightLowerArm"), char:FindFirstChild("RightHand")},
                        {char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso"), char:FindFirstChild("LeftUpperLeg") or char:FindFirstChild("Left Leg")},
                        {char:FindFirstChild("LeftUpperLeg") or char:FindFirstChild("Left Leg"), char:FindFirstChild("LeftLowerLeg")},
                        {char:FindFirstChild("LeftLowerLeg"), char:FindFirstChild("LeftFoot")},
                        {char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso"), char:FindFirstChild("RightUpperLeg") or char:FindFirstChild("Right Leg")},
                        {char:FindFirstChild("RightUpperLeg") or char:FindFirstChild("Right Leg"), char:FindFirstChild("RightLowerLeg")},
                        {char:FindFirstChild("RightLowerLeg"), char:FindFirstChild("RightFoot")}
                    }
                    for i = 1, 14 do
                        local joint = joints[i]
                        if joint and joint[1] and joint[2] then
                            local p1, v1 = Camera:WorldToViewportPoint(joint[1].Position)
                            local p2, v2 = Camera:WorldToViewportPoint(joint[2].Position)
                            Skeleton[i].Visible = (v1 or v2); Skeleton[i].From = Vector2.new(p1.X, p1.Y); Skeleton[i].To = Vector2.new(p2.X, p2.Y); Skeleton[i].Color = renderColor
                        else Skeleton[i].Visible = false end
                    end
                else for i=1, 14 do Skeleton[i].Visible = false end end
            else
                Line.Visible, Box.Visible, Name.Visible, Dist.Visible, HP.Visible = false, false, false, false, false
                for i=1, 14 do Skeleton[i].Visible = false end
            end
        else
            Line.Visible, Box.Visible, Name.Visible, Dist.Visible, HP.Visible = false, false, false, false, false
            Highlight.Enabled = false
            for i=1, 14 do Skeleton[i].Visible = false end
        end
    end)
end

RunService.Stepped:Connect(function()
    local char = Player.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if _G.Noclip then for _, v in pairs(char:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
        if hum then
            if _G.EnableSpeed then hum.WalkSpeed = _G.PlayerSpeed end
            if _G.EnableJump then hum.UseJumpPower = true; hum.JumpPower = _G.PlayerJump end
        end
    end
end)

-- // NOVA FUNÇÃO: PLATAFORMA NO PULO (aparece ao pular e desce lentamente)
local currentPlatform = nil
local function spawnPlatform()
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart

    if currentPlatform then 
        currentPlatform:Destroy()
        currentPlatform = nil
    end

    currentPlatform = Instance.new("Part")
    currentPlatform.Name = "OhickPlatform"
    currentPlatform.Size = Vector3.new(8, 0.5, 8)
    currentPlatform.Position = root.Position + Vector3.new(0, -3.5, 0)
    currentPlatform.Anchored = false
    currentPlatform.CanCollide = true
    currentPlatform.Transparency = 0.3
    currentPlatform.Color = Color3.fromRGB(0, 170, 255)
    currentPlatform.Material = Enum.Material.Neon
    currentPlatform.Parent = workspace

    -- Desce lentamente
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Name = "PlatformVelocity"
    bodyVelocity.Velocity = Vector3.new(0, -8, 0)
    bodyVelocity.MaxForce = Vector3.new(0, 4000, 0)
    bodyVelocity.Parent = currentPlatform

    -- Auto-destrói depois de um tempo
    task.delay(8, function()
        if currentPlatform then
            currentPlatform:Destroy()
            currentPlatform = nil
        end
    end)
end

local function setupJumpPlatform()
    if Player.Character then
        local hum = Player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.Jumping:Connect(function(active)
                if active and _G.Platform then
                    spawnPlatform()
                end
            end)
        end
    end
end
Player.CharacterAdded:Connect(setupJumpPlatform)
setupJumpPlatform()

-- // NOVA FUNÇÃO: ANTI KICK (impede kick do jogo)
local antiKickApplied = false
local function applyAntiKick()
    pcall(function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" and (self == Player or self == game.Players.LocalPlayer) then
                return nil -- bloqueia o kick
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
    end)
end

RunService.RenderStepped:Connect(function()
    if _G.AntiKick and not antiKickApplied then
        antiKickApplied = true
        applyAntiKick()
    end
end)

-- ==================== FLY FUNCTION (ANIMAÇÃO DE VOAR + MENOS GIRO) ====================
local flying = false
local flyConnection = nil
local alignOrientation = nil

local function startFly()
    if flying then return end
    flying = true

    local character = Player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then return end

    -- Animação de voar
    humanoid.PlatformStand = true

    -- Cria AlignOrientation para reduzir giro louco
    if not alignOrientation then
        alignOrientation = Instance.new("AlignOrientation")
        alignOrientation.Name = "FlyAlign"
        alignOrientation.MaxTorque = Vector3.new(100000, 100000, 100000)
        alignOrientation.Responsiveness = 25
        alignOrientation.Parent = root
    end

    flyConnection = RunService.Heartbeat:Connect(function()
        if not flying or not root or not root.Parent then 
            stopFly()
            return 
        end
        
        local camera = workspace.CurrentCamera
        local moveDir = camera.CFrame.LookVector
        
        -- Movimento suave
        root.Velocity = moveDir * 48
        
        -- Mantém o personagem olhando para onde a câmera aponta (reduz giro)
        if alignOrientation then
            alignOrientation.CFrame = CFrame.lookAt(root.Position, root.Position + moveDir)
        end
    end)
end

local function stopFly()
    flying = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end

    local character = Player.Character
    if character then
        local root = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        
        if root then 
            root.Velocity = Vector3.new(0, root.Velocity.Y * 0.3, 0)
        end
        if humanoid then 
            humanoid.PlatformStand = false
        end
        if alignOrientation then
            alignOrientation:Destroy()
            alignOrientation = nil
        end
    end
end

-- ==================== FLOATING FLY TOGGLE ====================
local FlyToggle = nil

local function createFloatingFlyToggle()
    if FlyToggle then FlyToggle:Destroy() end

    FlyToggle = Instance.new("TextButton")
    FlyToggle.Name = "FloatingFlyToggle"
    FlyToggle.Size = UDim2.new(0, 120, 0, 50)
    FlyToggle.Position = UDim2.new(0.5, -60, 0.75, 0)
    FlyToggle.BackgroundColor3 = _G.MenuColor
    FlyToggle.Text = "FLY: OFF"
    FlyToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    FlyToggle.Font = Enum.Font.GothamBold
    FlyToggle.TextSize = 14
    FlyToggle.Parent = ScreenGui
    FlyToggle.ZIndex = 1000
    FlyToggle.Active = true
    FlyToggle.Draggable = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = FlyToggle

    FlyToggle.MouseButton1Click:Connect(function()
        if flying then
            stopFly()
            FlyToggle.Text = "FLY: OFF"
        else
            startFly()
            FlyToggle.Text = "FLY: ON"
        end
    end)
end

local function destroyFloatingFlyToggle()
    if FlyToggle then
        FlyToggle:Destroy()
        FlyToggle = nil
    end
    stopFly()
end

-- ==================== CONTROLE DO FLY ====================
RunService.RenderStepped:Connect(function()
    if _G.Fly then
        if not FlyToggle then
            createFloatingFlyToggle()
        end
    else
        if FlyToggle then
            destroyFloatingFlyToggle()
        end
    end
end)

-- Limpeza ao respawn
Player.CharacterAdded:Connect(function()
    task.wait(1)
    if flying then
        stopFly()
        if FlyToggle then FlyToggle.Text = "FLY: OFF" end
    end
end)


-- ==================== CONTROLE DO FLY ====================
RunService.RenderStepped:Connect(function()
    if _G.Fly then
        if not FlyToggle then
            createFloatingFlyToggle()
        end
    else
        if FlyToggle then
            destroyFloatingFlyToggle()
        end
    end
end)

-- Limpeza ao morrer / respawn
Player.CharacterAdded:Connect(function()
    task.wait(0.8) -- espera o character carregar
    if flying then
        stopFly()
        if FlyToggle then
            FlyToggle.Text = "FLY: OFF"
        end
    end
end)

-- Limpeza quando o script é destruído
ScreenGui.AncestryChanged:Connect(function()
    if not ScreenGui.Parent then
        stopFly()
        if FlyToggle then FlyToggle:Destroy() end
    end
end)

-- // MINIMIZAR / RESTAURAR
local MinSquare = Instance.new("ImageButton")

MinSquare.Name = "MinSquare"
MinSquare.Size = UDim2.new(0, 55, 0, 55)
MinSquare.Position = UDim2.new(0.02, 0, 0.2, 0)

MinSquare.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinSquare.BackgroundTransparency = 0

MinSquare.Image = "rbxassetid://81493663766274" -- troque pelo ID que quiser
MinSquare.ScaleType = Enum.ScaleType.Fit

MinSquare.AutoButtonColor = true
MinSquare.Visible = false
MinSquare.Active = true
MinSquare.Draggable = true
MinSquare.ZIndex = 999

MinSquare.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = MinSquare

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(0, 0, 0)
Stroke.Parent = MinSquare

table.insert(_G.ThemeElements.Bg, MinSquare)

CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    MinSquare.Visible = true
end)

MinSquare.MouseButton1Click:Connect(function()
    Main.Visible = true
    MinSquare.Visible = false
end)


CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false; MinSquare.Visible = true end)
MinSquare.MouseButton1Click:Connect(function() Main.Visible = true; MinSquare.Visible = false end)

for _, p in pairs(Players:GetPlayers()) do if p ~= Player then CreateESP(p) end end
Players.PlayerAdded:Connect(function(p) if p ~= Player then CreateESP(p) end end)