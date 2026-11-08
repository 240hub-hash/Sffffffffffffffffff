-- dump by LeakD

local load_1 = loadstring("-- ======================================================================\
-- BOOMBOX AUDIO SPY v6.1 (Obfuscator Ready Edition)\
-- ======================================================================\
\
local Players = game:GetService(\"Players\")\
local MarketplaceService = game:GetService(\"MarketplaceService\")\
local UserInputService = game:GetService(\"UserInputService\")\
local CoreGui = game:GetService(\"CoreGui\")\
\
local localPlayer = Players.LocalPlayer\
local parentGui = (typeof(gethui) == \"function\" and gethui()) or CoreGui:FindFirstChild(\"RobloxGui\") or localPlayer:WaitForChild(\"PlayerGui\")\
\
if parentGui:FindFirstChild(\"BoomboxHubLoggerGui\") then\
    parentGui:FindFirstChild(\"BoomboxHubLoggerGui\"):Destroy()\
end\
\
local ScreenGui = Instance.new(\"ScreenGui\")\
ScreenGui.Name = \"BoomboxHubLoggerGui\"\
ScreenGui.ResetOnSpawn = false\
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling\
ScreenGui.Parent = parentGui\
\
----------------------------------------------------------------------\
-- รายชื่อที่ยกเว้นการดักเพลง (คนสร้าง)\
----------------------------------------------------------------------\
local BypassPlayers = {\
    [\"HAVEN_5579\"] = true,\
    [\"qwertyuiop_meno16\"] = true\
}\
\
-- รูปแผ่นเสียงสำรองกรณีเพลงไม่มีรูปปก\
local FALLBACK_ICON = \"rbxassetid://6034281281\"\
\
----------------------------------------------------------------------\
-- ปุ่มกลมลอยทางลัด\
----------------------------------------------------------------------\
local ToggleBtn = Instance.new(\"ImageButton\")\
ToggleBtn.Name = \"FloatingToggle\"\
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)\
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)\
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)\
ToggleBtn.BorderSizePixel = 0\
ToggleBtn.Image = \"rbxassetid://111326775181700\"\
ToggleBtn.ScaleType = Enum.ScaleType.Fit\
ToggleBtn.AutoButtonColor = false\
ToggleBtn.Parent = ScreenGui\
\
local ToggleCorner = Instance.new(\"UICorner\")\
ToggleCorner.CornerRadius = UDim.new(1, 0)\
ToggleCorner.Parent = ToggleBtn\
\
local ToggleStroke = Instance.new(\"UIStroke\")\
ToggleStroke.Color = Color3.fromRGB(180, 180, 180)\
ToggleStroke.Thickness = 1.5\
ToggleStroke.Parent = ToggleBtn\
\
local btnDragging = false\
local btnDragStart, btnStartPos\
local hasMoved = false\
\
ToggleBtn.InputBegan:Connect(function(input)\
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then\
        btnDragging = true\
        hasMoved = false\
        btnDragStart = input.Position\
        btnStartPos = ToggleBtn.Position\
        \
        input.Changed:Connect(function()\
            if input.UserInputState == Enum.UserInputState.End then\
                btnDragging = false\
            end\
        end)\
    end\
end)\
\
ToggleBtn.InputChanged:Connect(function(input)\
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then\
        if btnDragging then\
            local delta = input.Position - btnDragStart\
            if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then\
                hasMoved = true\
            end\
            ToggleBtn.Position = UDim2.new(\
                btnStartPos.X.Scale, btnStartPos.X.Offset + delta.X,\
                btnStartPos.Y.Scale, btnStartPos.Y.Offset + delta.Y\
            )\
        end\
    end\
end)\
\
----------------------------------------------------------------------\
-- กรอบหน้าต่างหลัก\
----------------------------------------------------------------------\
local Main = Instance.new(\"Frame\")\
Main.Name = \"MainFrame\"\
Main.Size = UDim2.new(0, 720, 0, 440)\
Main.Position = UDim2.new(0.5, -360, 0.5, -220)\
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)\
Main.BorderSizePixel = 0\
Main.ClipsDescendants = true\
Main.Parent = ScreenGui\
\
local MainGradient = Instance.new(\"UIGradient\")\
MainGradient.Color = ColorSequence.new({\
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 35)),\
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))\
})\
MainGradient.Rotation = 90\
MainGradient.Parent = Main\
\
local MainCorner = Instance.new(\"UICorner\")\
MainCorner.CornerRadius = UDim.new(0, 12)\
MainCorner.Parent = Main\
\
local MainStroke = Instance.new(\"UIStroke\")\
MainStroke.Color = Color3.fromRGB(100, 100, 100)\
MainStroke.Transparency = 0.3\
MainStroke.Thickness = 1.5\
MainStroke.Parent = Main\
\
ToggleBtn.MouseButton1Click:Connect(function()\
    if not hasMoved then Main.Visible = not Main.Visible end\
end)\
\
----------------------------------------------------------------------\
-- แถบด้านบน\
----------------------------------------------------------------------\
local TopBar = Instance.new(\"Frame\")\
TopBar.Name = \"TopBar\"\
TopBar.Size = UDim2.new(1, 0, 0, 44)\
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)\
TopBar.BorderSizePixel = 0\
TopBar.Parent = Main\
\
local TopBarCorner = Instance.new(\"UICorner\")\
TopBarCorner.CornerRadius = UDim.new(0, 12)\
TopBarCorner.Parent = TopBar\
\
local TopBarStroke = Instance.new(\"UIStroke\")\
TopBarStroke.Color = Color3.fromRGB(70, 70, 70)\
TopBarStroke.Transparency = 0.4\
TopBarStroke.Thickness = 1\
TopBarStroke.Parent = TopBar\
\
local TopBarFix = Instance.new(\"Frame\")\
TopBarFix.Size = UDim2.new(1, 0, 0, 10)\
TopBarFix.Position = UDim2.new(0, 0, 1, -10)\
TopBarFix.BackgroundColor3 = Color3.fromRGB(25, 25, 25)\
TopBarFix.BorderSizePixel = 0\
TopBarFix.ZIndex = TopBar.ZIndex\
TopBarFix.Parent = TopBar\
\
local TitleLabel = Instance.new(\"TextLabel\")\
TitleLabel.Size = UDim2.new(0, 300, 1, 0)\
TitleLabel.Position = UDim2.new(0, 14, 0, 0)\
TitleLabel.BackgroundTransparency = 1\
TitleLabel.Font = Enum.Font.FredokaOne\
TitleLabel.Text = \"IT x  Lloyd\"\
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)\
TitleLabel.TextSize = 15\
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left\
TitleLabel.ZIndex = TopBar.ZIndex + 1\
TitleLabel.Parent = TopBar\
\
local CloseBtn = Instance.new(\"TextButton\")\
CloseBtn.Size = UDim2.new(0, 26, 0, 26)\
CloseBtn.Position = UDim2.new(1, -35, 0.5, -13)\
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)\
CloseBtn.Font = Enum.Font.FredokaOne\
CloseBtn.Text = \"X\"\
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)\
CloseBtn.TextSize = 13\
CloseBtn.ZIndex = TopBar.ZIndex + 1\
CloseBtn.Parent = TopBar\
\
local CloseBtnCorner = Instance.new(\"UICorner\")\
CloseBtnCorner.CornerRadius = UDim.new(0, 6)\
CloseBtnCorner.Parent = CloseBtn\
\
local CloseBtnStroke = Instance.new(\"UIStroke\")\
CloseBtnStroke.Color = Color3.fromRGB(80, 80, 80)\
CloseBtnStroke.Thickness = 1\
CloseBtnStroke.Parent = CloseBtn\
\
CloseBtn.MouseEnter:Connect(function()\
    CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)\
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)\
end)\
\
CloseBtn.MouseLeave:Connect(function()\
    CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)\
    CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)\
end)\
\
CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false end)\
\
local winDragging, winDragStart, winStartPos\
TopBar.InputBegan:Connect(function(input)\
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then\
        winDragging = true\
        winDragStart = input.Position\
        winStartPos = Main.Position\
        input.Changed:Connect(function()\
            if input.UserInputState == Enum.UserInputState.End then winDragging = false end\
        end)\
    end\
end)\
\
TopBar.InputChanged:Connect(function(input)\
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then\
        if winDragging then\
            local delta = input.Position - winDragStart\
            Main.Position = UDim2.new(winStartPos.X.Scale, winStartPos.X.Offset + delta.X, winStartPos.Y.Scale, winStartPos.Y.Offset + delta.Y)\
        end\
    end\
end)\
\
----------------------------------------------------------------------\
-- ฝั่งซ้าย: รายชื่อคนในเซิร์ฟ\
----------------------------------------------------------------------\
local LeftContainer = Instance.new(\"Frame\")\
LeftContainer.Size = UDim2.new(0, 270, 1, -54)\
LeftContainer.Position = UDim2.new(0, 10, 0, 50)\
LeftContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)\
LeftContainer.BorderSizePixel = 0\
LeftContainer.Parent = Main\
\
local LeftCorner = Instance.new(\"UICorner\")\
LeftCorner.CornerRadius = UDim.new(0, 10)\
LeftCorner.Parent = LeftContainer\
\
local LeftStroke = Instance.new(\"UIStroke\")\
LeftStroke.Color = Color3.fromRGB(60, 60, 60)\
LeftStroke.Transparency = 0.5\
LeftStroke.Thickness = 1\
LeftStroke.Parent = LeftContainer\
\
local LeftTitle = Instance.new(\"TextLabel\")\
LeftTitle.Size = UDim2.new(1, -20, 0, 30)\
LeftTitle.Position = UDim2.new(0, 10, 0, 0)\
LeftTitle.BackgroundTransparency = 1\
LeftTitle.Font = Enum.Font.GothamBold\
LeftTitle.Text = \"ผู้เล่นในเซิร์ฟเวอร์: 0 คน\"\
LeftTitle.TextColor3 = Color3.fromRGB(180, 180, 180)\
LeftTitle.TextSize = 11.5\
LeftTitle.TextXAlignment = Enum.TextXAlignment.Left\
LeftTitle.Parent = LeftContainer\
\
local PlayerScroll = Instance.new(\"ScrollingFrame\")\
PlayerScroll.Size = UDim2.new(1, -10, 1, -35)\
PlayerScroll.Position = UDim2.new(0, 5, 0, 30)\
PlayerScroll.BackgroundTransparency = 1\
PlayerScroll.BorderSizePixel = 0\
PlayerScroll.ScrollBarThickness = 3\
PlayerScroll.Parent = LeftContainer\
\
local PlayerListLayout = Instance.new(\"UIListLayout\")\
PlayerListLayout.Padding = UDim.new(0, 5)\
PlayerListLayout.Parent = PlayerScroll\
\
----------------------------------------------------------------------\
-- ฝั่งขวา: รายละเอียด & เมนูเพลง\
----------------------------------------------------------------------\
local RightContainer = Instance.new(\"Frame\")\
RightContainer.Size = UDim2.new(1, -300, 1, -54)\
RightContainer.Position = UDim2.new(0, 290, 0, 50)\
RightContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)\
RightContainer.BorderSizePixel = 0\
RightContainer.Parent = Main\
\
local RightCorner = Instance.new(\"UICorner\")\
RightCorner.CornerRadius = UDim.new(0, 10)\
RightCorner.Parent = RightContainer\
\
local RightStroke = Instance.new(\"UIStroke\")\
RightStroke.Color = Color3.fromRGB(60, 60, 60)\
RightStroke.Transparency = 0.5\
RightStroke.Thickness = 1\
RightStroke.Parent = RightContainer\
\
local PlaceholderText = Instance.new(\"TextLabel\")\
PlaceholderText.Name = \"PlaceholderText\"\
PlaceholderText.Size = UDim2.new(1, 0, 1, 0)\
PlaceholderText.BackgroundTransparency = 1\
PlaceholderText.Font = Enum.Font.GothamMedium\
PlaceholderText.Text = \"กรุณาคลิกเลือกชื่อผู้เล่นฝั่งซ้ายมือ\"\
PlaceholderText.TextColor3 = Color3.fromRGB(120, 120, 120)\
PlaceholderText.TextSize = 13\
PlaceholderText.Parent = RightContainer\
\
local RightContent = Instance.new(\"Frame\")\
RightContent.Name = \"RightContent\"\
RightContent.Size = UDim2.new(1, 0, 1, 0)\
RightContent.BackgroundTransparency = 1\
RightContent.Visible = false\
RightContent.Parent = RightContainer\
\
-- การ์ดเพลงปัจจุบัน\
local NowPlayingCard = Instance.new(\"Frame\")\
NowPlayingCard.Size = UDim2.new(1, -20, 0, 122)\
NowPlayingCard.Position = UDim2.new(0, 10, 0, 10)\
NowPlayingCard.BackgroundColor3 = Color3.fromRGB(28, 28, 28)\
NowPlayingCard.BorderSizePixel = 0\
NowPlayingCard.Parent = RightContent\
\
local NPCorner = Instance.new(\"UICorner\")\
NPCorner.CornerRadius = UDim.new(0, 8)\
NPCorner.Parent = NowPlayingCard\
\
local NPStroke = Instance.new(\"UIStroke\")\
NPStroke.Color = Color3.fromRGB(70, 70, 70)\
NPStroke.Thickness = 1\
NPStroke.Parent = NowPlayingCard\
\
local PlayerPlayingBadge = Instance.new(\"TextLabel\")\
PlayerPlayingBadge.Size = UDim2.new(1, -12, 0, 20)\
PlayerPlayingBadge.Position = UDim2.new(0, 8, 0, 4)\
PlayerPlayingBadge.BackgroundTransparency = 1\
PlayerPlayingBadge.Font = Enum.Font.GothamBold\
PlayerPlayingBadge.Text = \"คนที่เลือก: -\"\
PlayerPlayingBadge.TextColor3 = Color3.fromRGB(180, 180, 180)\
PlayerPlayingBadge.TextSize = 10.5\
PlayerPlayingBadge.TextXAlignment = Enum.TextXAlignment.Left\
PlayerPlayingBadge.TextTruncate = Enum.TextTruncate.AtEnd\
PlayerPlayingBadge.Parent = NowPlayingCard\
\
local NPSongIcon = Instance.new(\"ImageLabel\")\
NPSongIcon.Size = UDim2.new(0, 78, 0, 78)\
NPSongIcon.Position = UDim2.new(0, 8, 0, 32)\
NPSongIcon.BackgroundColor3 = Color3.fromRGB(12, 14, 20)\
NPSongIcon.BorderSizePixel = 0\
NPSongIcon.Image = FALLBACK_ICON\
NPSongIcon.Parent = NowPlayingCard\
\
local NPIconCorner = Instance.new(\"UICorner\")\
NPIconCorner.CornerRadius = UDim.new(0, 6)\
NPIconCorner.Parent = NPSongIcon\
\
local NPTitle = Instance.new(\"TextLabel\")\
NPTitle.Size = UDim2.new(1, -195, 0, 18)\
NPTitle.Position = UDim2.new(0, 94, 0, 32)\
NPTitle.BackgroundTransparency = 1\
NPTitle.Font = Enum.Font.GothamBold\
NPTitle.Text = \"ไม่ได้เปิดเพลงอยู่\"\
NPTitle.TextColor3 = Color3.fromRGB(255, 255, 255)\
NPTitle.TextSize = 11.5\
NPTitle.TextXAlignment = Enum.TextXAlignment.Left\
NPTitle.TextTruncate = Enum.TextTruncate.AtEnd\
NPTitle.Parent = NowPlayingCard\
\
local NPArtist = Instance.new(\"TextLabel\")\
NPArtist.Size = UDim2.new(1, -195, 0, 16)\
NPArtist.Position = UDim2.new(0, 94, 0, 52)\
NPArtist.BackgroundTransparency = 1\
NPArtist.Font = Enum.Font.GothamMedium\
NPArtist.Text = \"อัปเพลงโดย: -\"\
NPArtist.TextColor3 = Color3.fromRGB(170, 170, 170)\
NPArtist.TextSize = 10\
NPArtist.TextXAlignment = Enum.TextXAlignment.Left\
NPArtist.TextTruncate = Enum.TextTruncate.AtEnd\
NPArtist.Parent = NowPlayingCard\
\
local NPDate = Instance.new(\"TextLabel\")\
NPDate.Size = UDim2.new(1, -195, 0, 16)\
NPDate.Position = UDim2.new(0, 94, 0, 70)\
NPDate.BackgroundTransparency = 1\
NPDate.Font = Enum.Font.GothamMedium\
NPDate.Text = \"วันที่อัป: -\"\
NPDate.TextColor3 = Color3.fromRGB(140, 140, 140)\
NPDate.TextSize = 10\
NPDate.TextXAlignment = Enum.TextXAlignment.Left\
NPDate.Parent = NowPlayingCard\
\
local NPIdLabel = Instance.new(\"TextLabel\")\
NPIdLabel.Size = UDim2.new(1, -195, 0, 16)\
NPIdLabel.Position = UDim2.new(0, 94, 0, 88)\
NPIdLabel.BackgroundTransparency = 1\
NPIdLabel.Font = Enum.Font.GothamBold\
NPIdLabel.Text = \"ID: -\"\
NPIdLabel.TextColor3 = Color3.fromRGB(120, 120, 120)\
NPIdLabel.TextSize = 10\
NPIdLabel.TextXAlignment = Enum.TextXAlignment.Left\
NPIdLabel.Parent = NowPlayingCard\
\
local NPCopyBtn = Instance.new(\"TextButton\")\
NPCopyBtn.Size = UDim2.new(0, 85, 0, 32)\
NPCopyBtn.Position = UDim2.new(1, -95, 0, 55)\
NPCopyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)\
NPCopyBtn.Font = Enum.Font.FredokaOne\
NPCopyBtn.Text = \"คัดลอก\"\
NPCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)\
NPCopyBtn.TextSize = 11\
NPCopyBtn.Parent = NowPlayingCard\
\
local NPCopyCorner = Instance.new(\"UICorner\")\
NPCopyCorner.CornerRadius = UDim.new(0, 6)\
NPCopyCorner.Parent = NPCopyBtn\
\
-- ส่วนประวัติ\
local HistoryHeader = Instance.new(\"TextLabel\")\
HistoryHeader.Size = UDim2.new(1, -110, 0, 20)\
HistoryHeader.Position = UDim2.new(0, 10, 0, 138)\
HistoryHeader.BackgroundTransparency = 1\
HistoryHeader.Font = Enum.Font.GothamBold\
HistoryHeader.Text = \"ประวัติที่เคยเปิดทั้งหมด: 0\"\
HistoryHeader.TextColor3 = Color3.fromRGB(180, 180, 180)\
HistoryHeader.TextSize = 10.5\
HistoryHeader.TextXAlignment = Enum.TextXAlignment.Left\
HistoryHeader.Parent = RightContent\
\
local ClearHistoryBtn = Instance.new(\"TextButton\")\
ClearHistoryBtn.Size = UDim2.new(0, 80, 0, 22)\
ClearHistoryBtn.Position = UDim2.new(1, -90, 0, 137)\
ClearHistoryBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)\
ClearHistoryBtn.Font = Enum.Font.FredokaOne\
ClearHistoryBtn.Text = \"ล้างประวัติ\"\
ClearHistoryBtn.TextColor3 = Color3.fromRGB(200, 200, 200)\
ClearHistoryBtn.TextSize = 10\
ClearHistoryBtn.Parent = RightContent\
\
local ClearHistoryCorner = Instance.new(\"UICorner\")\
ClearHistoryCorner.CornerRadius = UDim.new(0, 4)\
ClearHistoryCorner.Parent = ClearHistoryBtn\
\
local ClearHistoryStroke = Instance.new(\"UIStroke\")\
ClearHistoryStroke.Color = Color3.fromRGB(70, 70, 70)\
ClearHistoryStroke.Thickness = 1\
ClearHistoryStroke.Parent = ClearHistoryBtn\
\
local HistoryScroll = Instance.new(\"ScrollingFrame\")\
HistoryScroll.Size = UDim2.new(1, -20, 1, -168)\
HistoryScroll.Position = UDim2.new(0, 10, 0, 162)\
HistoryScroll.BackgroundTransparency = 1\
HistoryScroll.BorderSizePixel = 0\
HistoryScroll.ScrollBarThickness = 3\
HistoryScroll.Parent = RightContent\
\
local HistoryLayout = Instance.new(\"UIListLayout\")\
HistoryLayout.Padding = UDim.new(0, 6)\
HistoryLayout.Parent = HistoryScroll\
\
----------------------------------------------------------------------\
-- ระบบจัดการข้อมูล & อัปเดต UI\
----------------------------------------------------------------------\
local playerData = {}\
local selectedPlayerKey = nil\
\
local function updatePlayerCount()\
    local count = #Players:GetPlayers()\
    LeftTitle.Text = \"ผู้เล่นในเซิร์ฟเวอร์: \" .. count .. \" คน\"\
end\
\
local function copyToClipboard(text, button)\
    if typeof(setclipboard) == \"function\" then\
        setclipboard(tostring(text))\
    elseif typeof(toclipboard) == \"function\" then\
        toclipboard(tostring(text))\
    end\
    \
    local origText = button.Text\
    button.Text = \"คัดลอกแล้ว!\"\
    button.BackgroundColor3 = Color3.fromRGB(80, 180, 100)\
    task.delay(1.5, function()\
        if button and button.Parent then\
            button.Text = origText\
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)\
        end\
    end)\
end\
\
local function formatDateTH(isoString)\
    if not isoString or isoString == \"\" then return \"ไม่ระบุ\" end\
    local year, month, day = string.match(isoString, \"^(%d+)%-(%d+)%-(%d+)\")\
    if not (year and month and day) then return \"ไม่ระบุ\" end\
    return string.format(\"%s/%02d/%02d\", year, tonumber(month), tonumber(day))\
end\
\
local function updateRightPanel()\
    if not selectedPlayerKey or not playerData[selectedPlayerKey] then\
        PlaceholderText.Visible = true\
        RightContent.Visible = false\
        return\
    end\
\
    PlaceholderText.Visible = false\
    RightContent.Visible = true\
\
    local pData = playerData[selectedPlayerKey]\
    PlayerPlayingBadge.Text = \"คนที่เลือก: \" .. pData.displayName .. \" (@\" .. pData.username .. \")\"\
    HistoryHeader.Text = \"ประวัติที่เคยเปิดทั้งหมด: \" .. #pData.history\
\
    if pData.isPlaying and pData.currentSong and pData.currentSong.id then\
        local song = pData.currentSong\
        NPTitle.Text = song.name or \"กำลังโหลด...\"\
        NPArtist.Text = \"อัปเพลงโดย: \" .. (song.creator or \"...\")\
        NPDate.Text = \"วันที่อัป: \" .. (song.date or \"...\")\
        NPIdLabel.Text = \"ID: \" .. song.id\
        \
        NPSongIcon.Image = song.iconId ~= 0 and (\"rbxassetid://\" .. tostring(song.iconId)) or (\"rbxthumb://type=Asset&id=\" .. tostring(song.id) .. \"&w=150&h=150\")\
        \
        NPCopyBtn.Visible = true\
        \
        for _, conn in ipairs(getconnections(NPCopyBtn.MouseButton1Click)) do\
            conn:Disable()\
        end\
        NPCopyBtn.MouseButton1Click:Connect(function()\
            copyToClipboard(song.id, NPCopyBtn)\
        end)\
    else\
        NPTitle.Text = \"ไม่ได้เปิดเพลงอยู่\"\
        NPArtist.Text = \"อัปเพลงโดย: -\"\
        NPDate.Text = \"วันที่อัป: -\"\
        NPIdLabel.Text = \"ID: -\"\
        NPSongIcon.Image = FALLBACK_ICON\
        NPCopyBtn.Visible = false\
    end\
\
    for _, child in ipairs(HistoryScroll:GetChildren()) do\
        if child:IsA(\"Frame\") then child:Destroy() end\
    end\
\
    for i = #pData.history, 1, -1 do\
        local song = pData.history[i]\
        local HCard = Instance.new(\"Frame\")\
        HCard.Size = UDim2.new(1, -6, 0, 48)\
        HCard.BackgroundColor3 = Color3.fromRGB(28, 28, 28)\
        HCard.BorderSizePixel = 0\
        HCard.Parent = HistoryScroll\
\
        local HCorner = Instance.new(\"UICorner\")\
        HCorner.CornerRadius = UDim.new(0, 6)\
        HCorner.Parent = HCard\
\
        local HIcon = Instance.new(\"ImageLabel\")\
        HIcon.Size = UDim2.new(0, 36, 0, 36)\
        HIcon.Position = UDim2.new(0, 6, 0.5, -18)\
        HIcon.BackgroundColor3 = Color3.fromRGB(12, 14, 20)\
        HIcon.BorderSizePixel = 0\
        \
        HIcon.Image = song.iconId ~= 0 and (\"rbxassetid://\" .. tostring(song.iconId)) or (\"rbxthumb://type=Asset&id=\" .. tostring(song.id) .. \"&w=150&h=150\")\
        HIcon.Parent = HCard\
\
        local HIconCorner = Instance.new(\"UICorner\")\
        HIconCorner.CornerRadius = UDim.new(0, 4)\
        HIconCorner.Parent = HIcon\
\
        local HTitle = Instance.new(\"TextLabel\")\
        HTitle.Size = UDim2.new(1, -130, 0, 20)\
        HTitle.Position = UDim2.new(0, 48, 0, 5)\
        HTitle.BackgroundTransparency = 1\
        HTitle.Font = Enum.Font.GothamMedium\
        HTitle.Text = song.name or (\"ID: \" .. song.id)\
        HTitle.TextColor3 = Color3.fromRGB(220, 220, 220)\
        HTitle.TextSize = 11\
        HTitle.TextXAlignment = Enum.TextXAlignment.Left\
        HTitle.TextTruncate = Enum.TextTruncate.AtEnd\
        HTitle.Parent = HCard\
\
        local HSub = Instance.new(\"TextLabel\")\
        HSub.Size = UDim2.new(1, -130, 0, 16)\
        HSub.Position = UDim2.new(0, 48, 0, 25)\
        HSub.BackgroundTransparency = 1\
        HSub.Font = Enum.Font.Gotham\
        HSub.Text = \"โดย: \" .. (song.creator or \"...\") .. \" | \" .. (song.date or \"...\")\
        HSub.TextColor3 = Color3.fromRGB(120, 120, 120)\
        HSub.TextSize = 9.5\
        HSub.TextXAlignment = Enum.TextXAlignment.Left\
        HSub.TextTruncate = Enum.TextTruncate.AtEnd\
        HSub.Parent = HCard\
\
        local HCopy = Instance.new(\"TextButton\")\
        HCopy.Size = UDim2.new(0, 60, 0, 28)\
        HCopy.Position = UDim2.new(1, -68, 0.5, -14)\
        HCopy.BackgroundColor3 = Color3.fromRGB(50, 50, 50)\
        HCopy.Font = Enum.Font.FredokaOne\
        HCopy.Text = \"คัดลอก\"\
        HCopy.TextColor3 = Color3.fromRGB(200, 200, 200)\
        HCopy.TextSize = 10\
        HCopy.Parent = HCard\
\
        local HCopyCorner = Instance.new(\"UICorner\")\
        HCopyCorner.CornerRadius = UDim.new(0, 4)\
        HCopyCorner.Parent = HCopy\
\
        HCopy.MouseButton1Click:Connect(function()\
            copyToClipboard(song.id, HCopy)\
        end)\
    end\
\
    HistoryScroll.CanvasSize = UDim2.new(0, 0, 0, #pData.history * 54)\
end\
\
ClearHistoryBtn.MouseButton1Click:Connect(function()\
    if selectedPlayerKey and playerData[selectedPlayerKey] then\
        playerData[selectedPlayerKey].history = {}\
        updateRightPanel()\
    end\
end)\
\
local function addPlayerToList(p)\
    local pKey = p.Name\
    if playerData[pKey] then return end\
\
    local PBtn = Instance.new(\"TextButton\")\
    PBtn.Name = \"PBtn_\" .. p.Name\
    PBtn.Size = UDim2.new(1, -6, 0, 42)\
    PBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)\
    PBtn.BorderSizePixel = 0\
    PBtn.Text = \"\"\
    PBtn.Parent = PlayerScroll\
\
    local PBCorner = Instance.new(\"UICorner\")\
    PBCorner.CornerRadius = UDim.new(0, 6)\
    PBCorner.Parent = PBtn\
\
    local PNameLabel = Instance.new(\"TextLabel\")\
    PNameLabel.Size = UDim2.new(1, -125, 0, 20)\
    PNameLabel.Position = UDim2.new(0, 8, 0, 3)\
    PNameLabel.BackgroundTransparency = 1\
    PNameLabel.Font = Enum.Font.GothamBold\
    PNameLabel.Text = p.DisplayName\
    PNameLabel.TextColor3 = Color3.fromRGB(240, 240, 240)\
    PNameLabel.TextSize = 11\
    PNameLabel.TextXAlignment = Enum.TextXAlignment.Left\
    PNameLabel.TextTruncate = Enum.TextTruncate.AtEnd\
    PNameLabel.Parent = PBtn\
\
    local PUserLabel = Instance.new(\"TextLabel\")\
    PUserLabel.Size = UDim2.new(1, -125, 0, 16)\
    PUserLabel.Position = UDim2.new(0, 8, 0, 22)\
    PUserLabel.BackgroundTransparency = 1\
    PUserLabel.Font = Enum.Font.Gotham\
    PUserLabel.Text = \"@\" .. p.Name\
    PUserLabel.TextColor3 = Color3.fromRGB(150, 150, 150)\
    PUserLabel.TextSize = 9.5\
    PUserLabel.TextXAlignment = Enum.TextXAlignment.Left\
    PUserLabel.TextTruncate = Enum.TextTruncate.AtEnd\
    PUserLabel.Parent = PBtn\
\
    local StatusLabel = Instance.new(\"TextLabel\")\
    StatusLabel.Size = UDim2.new(0, 120, 0, 20)\
    StatusLabel.Position = UDim2.new(1, -123, 0.5, -10)\
    StatusLabel.BackgroundTransparency = 1\
    StatusLabel.Font = Enum.Font.GothamBold\
    \
    if BypassPlayers[pKey] then\
        StatusLabel.Text = \"คนสร้างดักไม่ได้\"\
        StatusLabel.TextColor3 = Color3.fromRGB(130, 130, 130)\
    else\
        StatusLabel.Text = \"ไม่ได้เปิดเพลง\"\
        StatusLabel.TextColor3 = Color3.fromRGB(130, 130, 130)\
    end\
    \
    StatusLabel.TextSize = 9\
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Right\
    StatusLabel.Parent = PBtn\
\
    playerData[pKey] = {\
        playerObj = p,\
        displayName = p.DisplayName,\
        username = p.Name,\
        isPlaying = false,\
        currentSong = nil,\
        history = {},\
        btnRef = PBtn,\
        statusRef = StatusLabel\
    }\
\
    PBtn.MouseButton1Click:Connect(function()\
        selectedPlayerKey = pKey\
        for _, btn in ipairs(PlayerScroll:GetChildren()) do\
            if btn:IsA(\"TextButton\") then btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end\
        end\
        PBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)\
        updateRightPanel()\
    end)\
\
    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, #PlayerScroll:GetChildren() * 47)\
    updatePlayerCount()\
end\
\
for _, p in ipairs(Players:GetPlayers()) do\
    addPlayerToList(p)\
end\
\
Players.PlayerAdded:Connect(function(p)\
    addPlayerToList(p)\
end)\
\
Players.PlayerRemoving:Connect(function(p)\
    local pKey = p.Name\
    if playerData[pKey] then\
        if playerData[pKey].btnRef then playerData[pKey].btnRef:Destroy() end\
        playerData[pKey] = nil\
        if selectedPlayerKey == pKey then\
            selectedPlayerKey = nil\
            updateRightPanel()\
        end\
    end\
    updatePlayerCount()\
end)\
\
----------------------------------------------------------------------\
-- ระบบดักจับเพลงและดึงข้อมูล\
----------------------------------------------------------------------\
local function registerSong(playerObj, rawId, isPlaying)\
    local pKey = playerObj.Name\
    \
    if BypassPlayers[pKey] then return end\
\
    local pData = playerData[pKey]\
    if not pData then return end\
\
    if not isPlaying or rawId == \"\" or rawId == \"0\" then\
        pData.isPlaying = false\
        if #pData.history > 0 then\
            pData.statusRef.Text = \"ปิดเพลง\"\
        else\
            pData.statusRef.Text = \"ไม่ได้เปิดเพลง\"\
        end\
        pData.statusRef.TextColor3 = Color3.fromRGB(130, 130, 130)\
        if selectedPlayerKey == pKey then updateRightPanel() end\
        return\
    end\
\
    if pData.currentSong and pData.currentSong.id ~= rawId then\
        pData.statusRef.Text = \"กำลังเปลี่ยน ID...\"\
        pData.statusRef.TextColor3 = Color3.fromRGB(200, 200, 200)\
    else\
        pData.statusRef.Text = \"กำลังเล่นเพลง\"\
        pData.statusRef.TextColor3 = Color3.fromRGB(240, 240, 240)\
    end\
\
    pData.isPlaying = true\
\
    if pData.currentSong and pData.currentSong.id == rawId then return end\
\
    local songItem = {\
        id = rawId,\
        name = \"กำลังโหลด...\",\
        creator = \"...\",\
        date = \"...\",\
        iconId = 0\
    }\
    pData.currentSong = songItem\
    table.insert(pData.history, songItem)\
\
    if selectedPlayerKey == pKey then\
        updateRightPanel()\
    end\
\
    task.spawn(function()\
        local success, info = pcall(function()\
            return MarketplaceService:GetProductInfo(tonumber(rawId), Enum.InfoType.Asset)\
        end)\
        if success and info then\
            songItem.name = info.Name or (\"Asset ID: \" .. rawId)\
            songItem.creator = (info.Creator and info.Creator.Name) or \"Unknown\"\
            songItem.date = info.Created and formatDateTH(info.Created) or \"ไม่ระบุ\"\
            songItem.iconId = info.IconImageAssetId or 0\
        else\
            songItem.name = \"Asset ID: \" .. rawId\
            songItem.creator = \"ติดลิขสิทธิ์/Private\"\
            songItem.date = \"ไม่พบข้อมูล\"\
            songItem.iconId = 0\
        end\
        \
        pData.statusRef.Text = \"กำลังเล่นเพลง\"\
        pData.statusRef.TextColor3 = Color3.fromRGB(240, 240, 240)\
\
        if selectedPlayerKey == pKey then\
            updateRightPanel()\
        end\
    end)\
end\
\
local connectedAudioPlayers = {}\
\
local function setupAudioPlayerEvents(ap, char)\
    if not ap or connectedAudioPlayers[ap] then return end\
    connectedAudioPlayers[ap] = true\
\
    local p = Players:GetPlayerFromCharacter(char) or Players:FindFirstChild(char.Name)\
    if not p then return end\
\
    local function checkAndUpdate()\
        local assetString = ap.AssetId or \"\"\
        local rawId = string.match(assetString, \"%d+\") or \"\"\
        local isPlaying = ap.IsPlaying and ap.Volume > 0 and rawId ~= \"\"\
        \
        registerSong(p, rawId, isPlaying)\
    end\
\
    checkAndUpdate()\
\
    ap:GetPropertyChangedSignal(\"AssetId\"):Connect(checkAndUpdate)\
    ap:GetPropertyChangedSignal(\"IsPlaying\"):Connect(checkAndUpdate)\
    ap:GetPropertyChangedSignal(\"Volume\"):Connect(checkAndUpdate)\
end\
\
local function scanAllAudio()\
    for _, desc in ipairs(workspace:GetDescendants()) do\
        if desc:IsA(\"Wire\") then\
            local ap = desc.SourceInstance\
            local emitter = desc.TargetInstance\
            if ap and ap:IsA(\"AudioPlayer\") and emitter and emitter:IsA(\"AudioEmitter\") then\
                local handle = emitter.Parent\
                local acc = handle and handle.Parent\
                local char = acc and acc.Parent\
                while char and not char:IsA(\"Model\") and char ~= workspace do char = char.Parent end\
                \
                if char and char:IsA(\"Model\") then\
                    setupAudioPlayerEvents(ap, char)\
                end\
            end\
        end\
    end\
end\
\
scanAllAudio()\
\
workspace.DescendantAdded:Connect(function(desc)\
    if desc:IsA(\"Wire\") or desc:IsA(\"AudioPlayer\") then\
        task.wait(0.1)\
        scanAllAudio()\
    end\
end)")()
local Players_2 = game:GetService("Players")
local MarketplaceService_3 = game:GetService("MarketplaceService")
local UserInputService_4 = game:GetService("UserInputService")
local CoreGui_5 = game:GetService("CoreGui")
local HiddenUI_6 = gethui()
local ScreenGui_7 = Instance.new("ScreenGui")
ScreenGui_7.Name = "BoomboxHubLoggerGui"
ScreenGui_7.ResetOnSpawn = false
ScreenGui_7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui_7.Parent = HiddenUI_6
local ImageButton_8 = Instance.new("ImageButton")
ImageButton_8.Name = "FloatingToggle"
ImageButton_8.Size = UDim2.new(0, 55, 0, 55)
ImageButton_8.Position = UDim2.new(0, 20, 0.5, - 25)
ImageButton_8.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ImageButton_8.BorderSizePixel = 0
ImageButton_8.Image = "rbxassetid://111326775181700"
ImageButton_8.ScaleType = Enum.ScaleType.Fit
ImageButton_8.AutoButtonColor = false
ImageButton_8.Parent = ScreenGui_7
local UICorner_9 = Instance.new("UICorner")
UICorner_9.CornerRadius = UDim.new(1, 0)
UICorner_9.Parent = ImageButton_8
local UIStroke_10 = Instance.new("UIStroke")
UIStroke_10.Color = Color3.fromRGB(180, 180, 180)
UIStroke_10.Thickness = 1.5
UIStroke_10.Parent = ImageButton_8
local conn_11 = ImageButton_8.InputBegan:Connect(function(input, gameProcessed)
end)
local conn_12 = ImageButton_8.InputChanged:Connect(function(input, gameProcessed)
end)
local Frame_13 = Instance.new("Frame")
Frame_13.Name = "MainFrame"
Frame_13.Size = UDim2.new(0, 720, 0, 440)
Frame_13.Position = UDim2.new(0.5, - 360, 0.5, - 220)
Frame_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_13.BorderSizePixel = 0
Frame_13.ClipsDescendants = true
Frame_13.Parent = ScreenGui_7
local UIGradient_14 = Instance.new("UIGradient")
UIGradient_14.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.137255, 0.137255, 0.137255)), ColorSequenceKeypoint.new(1, Color3.new(0.0588235, 0.0588235, 0.0588235))})
UIGradient_14.Rotation = 90
UIGradient_14.Parent = Frame_13
local UICorner_15 = Instance.new("UICorner")
UICorner_15.CornerRadius = UDim.new(0, 12)
UICorner_15.Parent = Frame_13
local UIStroke_16 = Instance.new("UIStroke")
UIStroke_16.Color = Color3.fromRGB(100, 100, 100)
UIStroke_16.Transparency = 0.3
UIStroke_16.Thickness = 1.5
UIStroke_16.Parent = Frame_13
local conn_17 = ImageButton_8.MouseButton1Click:Connect(function()
Frame_13.Visible = false
end)
local Frame_18 = Instance.new("Frame")
Frame_18.Name = "TopBar"
Frame_18.Size = UDim2.new(1, 0, 0, 44)
Frame_18.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame_18.BorderSizePixel = 0
Frame_18.Parent = Frame_13
local UICorner_19 = Instance.new("UICorner")
UICorner_19.CornerRadius = UDim.new(0, 12)
UICorner_19.Parent = Frame_18
local UIStroke_20 = Instance.new("UIStroke")
UIStroke_20.Color = Color3.fromRGB(70, 70, 70)
UIStroke_20.Transparency = 0.4
UIStroke_20.Thickness = 1
UIStroke_20.Parent = Frame_18
local Frame_21 = Instance.new("Frame")
Frame_21.Size = UDim2.new(1, 0, 0, 10)
Frame_21.Position = UDim2.new(0, 0, 1, - 10)
Frame_21.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame_21.BorderSizePixel = 0
Frame_21.ZIndex = 0
Frame_21.Parent = Frame_18
local TextLabel_22 = Instance.new("TextLabel")
TextLabel_22.Size = UDim2.new(0, 300, 1, 0)
TextLabel_22.Position = UDim2.new(0, 14, 0, 0)
TextLabel_22.BackgroundTransparency = 1
TextLabel_22.Font = Enum.Font.FredokaOne
TextLabel_22.Text = "IT x  Lloyd"
TextLabel_22.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_22.TextSize = 15
TextLabel_22.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_22.ZIndex = 1
TextLabel_22.Parent = Frame_18
local TextButton_23 = Instance.new("TextButton")
TextButton_23.Size = UDim2.new(0, 26, 0, 26)
TextButton_23.Position = UDim2.new(1, - 35, 0.5, - 13)
TextButton_23.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextButton_23.Font = Enum.Font.FredokaOne
TextButton_23.Text = "X"
TextButton_23.TextColor3 = Color3.fromRGB(200, 200, 200)
TextButton_23.TextSize = 13
TextButton_23.ZIndex = 1
TextButton_23.Parent = Frame_18
local UICorner_24 = Instance.new("UICorner")
UICorner_24.CornerRadius = UDim.new(0, 6)
UICorner_24.Parent = TextButton_23
local UIStroke_25 = Instance.new("UIStroke")
UIStroke_25.Color = Color3.fromRGB(80, 80, 80)
UIStroke_25.Thickness = 1
UIStroke_25.Parent = TextButton_23
local conn_26 = TextButton_23.MouseEnter:Connect(function(...)
TextButton_23.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
TextButton_23.TextColor3 = Color3.fromRGB(255, 255, 255)
end)
local conn_27 = TextButton_23.MouseLeave:Connect(function(...)
TextButton_23.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextButton_23.TextColor3 = Color3.fromRGB(200, 200, 200)
end)
local conn_28 = TextButton_23.MouseButton1Click:Connect(function()
Frame_13.Visible = false
end)
local conn_29 = Frame_18.InputBegan:Connect(function(input, gameProcessed)
end)
local conn_30 = Frame_18.InputChanged:Connect(function(input, gameProcessed)
end)
local Frame_31 = Instance.new("Frame")
Frame_31.Size = UDim2.new(0, 270, 1, - 54)
Frame_31.Position = UDim2.new(0, 10, 0, 50)
Frame_31.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame_31.BorderSizePixel = 0
Frame_31.Parent = Frame_13
local UICorner_32 = Instance.new("UICorner")
UICorner_32.CornerRadius = UDim.new(0, 10)
UICorner_32.Parent = Frame_31
local UIStroke_33 = Instance.new("UIStroke")
UIStroke_33.Color = Color3.fromRGB(60, 60, 60)
UIStroke_33.Transparency = 0.5
UIStroke_33.Thickness = 1
UIStroke_33.Parent = Frame_31
local TextLabel_34 = Instance.new("TextLabel")
TextLabel_34.Size = UDim2.new(1, - 20, 0, 30)
TextLabel_34.Position = UDim2.new(0, 10, 0, 0)
TextLabel_34.BackgroundTransparency = 1
TextLabel_34.Font = Enum.Font.GothamBold
TextLabel_34.Text = "ผู้เล่นในเซิร์ฟเวอร์: 0 คน"
TextLabel_34.TextColor3 = Color3.fromRGB(180, 180, 180)
TextLabel_34.TextSize = 11.5
TextLabel_34.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_34.Parent = Frame_31
local ScrollingFrame_35 = Instance.new("ScrollingFrame")
ScrollingFrame_35.Size = UDim2.new(1, - 10, 1, - 35)
ScrollingFrame_35.Position = UDim2.new(0, 5, 0, 30)
ScrollingFrame_35.BackgroundTransparency = 1
ScrollingFrame_35.BorderSizePixel = 0
ScrollingFrame_35.ScrollBarThickness = 3
ScrollingFrame_35.Parent = Frame_31
local UIListLayout_36 = Instance.new("UIListLayout")
UIListLayout_36.Padding = UDim.new(0, 5)
UIListLayout_36.Parent = ScrollingFrame_35
local Frame_37 = Instance.new("Frame")
Frame_37.Size = UDim2.new(1, - 300, 1, - 54)
Frame_37.Position = UDim2.new(0, 290, 0, 50)
Frame_37.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame_37.BorderSizePixel = 0
Frame_37.Parent = Frame_13
local UICorner_38 = Instance.new("UICorner")
UICorner_38.CornerRadius = UDim.new(0, 10)
UICorner_38.Parent = Frame_37
local UIStroke_39 = Instance.new("UIStroke")
UIStroke_39.Color = Color3.fromRGB(60, 60, 60)
UIStroke_39.Transparency = 0.5
UIStroke_39.Thickness = 1
UIStroke_39.Parent = Frame_37
local TextLabel_40 = Instance.new("TextLabel")
TextLabel_40.Name = "PlaceholderText"
TextLabel_40.Size = UDim2.new(1, 0, 1, 0)
TextLabel_40.BackgroundTransparency = 1
TextLabel_40.Font = Enum.Font.GothamMedium
TextLabel_40.Text = "กรุณาคลิกเลือกชื่อผู้เล่นฝั่งซ้ายมือ"
TextLabel_40.TextColor3 = Color3.fromRGB(120, 120, 120)
TextLabel_40.TextSize = 13
TextLabel_40.Parent = Frame_37
local Frame_41 = Instance.new("Frame")
Frame_41.Name = "RightContent"
Frame_41.Size = UDim2.new(1, 0, 1, 0)
Frame_41.BackgroundTransparency = 1
Frame_41.Visible = false
Frame_41.Parent = Frame_37
local Frame_42 = Instance.new("Frame")
Frame_42.Size = UDim2.new(1, - 20, 0, 122)
Frame_42.Position = UDim2.new(0, 10, 0, 10)
Frame_42.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Frame_42.BorderSizePixel = 0
Frame_42.Parent = Frame_41
local UICorner_43 = Instance.new("UICorner")
UICorner_43.CornerRadius = UDim.new(0, 8)
UICorner_43.Parent = Frame_42
local UIStroke_44 = Instance.new("UIStroke")
UIStroke_44.Color = Color3.fromRGB(70, 70, 70)
UIStroke_44.Thickness = 1
UIStroke_44.Parent = Frame_42
local TextLabel_45 = Instance.new("TextLabel")
TextLabel_45.Size = UDim2.new(1, - 12, 0, 20)
TextLabel_45.Position = UDim2.new(0, 8, 0, 4)
TextLabel_45.BackgroundTransparency = 1
TextLabel_45.Font = Enum.Font.GothamBold
TextLabel_45.Text = "คนที่เลือก: -"
TextLabel_45.TextColor3 = Color3.fromRGB(180, 180, 180)
TextLabel_45.TextSize = 10.5
TextLabel_45.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_45.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_45.Parent = Frame_42
local ImageLabel_46 = Instance.new("ImageLabel")
ImageLabel_46.Size = UDim2.new(0, 78, 0, 78)
ImageLabel_46.Position = UDim2.new(0, 8, 0, 32)
ImageLabel_46.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
ImageLabel_46.BorderSizePixel = 0
ImageLabel_46.Image = "rbxassetid://6034281281"
ImageLabel_46.Parent = Frame_42
local UICorner_47 = Instance.new("UICorner")
UICorner_47.CornerRadius = UDim.new(0, 6)
UICorner_47.Parent = ImageLabel_46
local TextLabel_48 = Instance.new("TextLabel")
TextLabel_48.Size = UDim2.new(1, - 195, 0, 18)
TextLabel_48.Position = UDim2.new(0, 94, 0, 32)
TextLabel_48.BackgroundTransparency = 1
TextLabel_48.Font = Enum.Font.GothamBold
TextLabel_48.Text = "ไม่ได้เปิดเพลงอยู่"
TextLabel_48.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_48.TextSize = 11.5
TextLabel_48.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_48.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_48.Parent = Frame_42
local TextLabel_49 = Instance.new("TextLabel")
TextLabel_49.Size = UDim2.new(1, - 195, 0, 16)
TextLabel_49.Position = UDim2.new(0, 94, 0, 52)
TextLabel_49.BackgroundTransparency = 1
TextLabel_49.Font = Enum.Font.GothamMedium
TextLabel_49.Text = "อัปเพลงโดย: -"
TextLabel_49.TextColor3 = Color3.fromRGB(170, 170, 170)
TextLabel_49.TextSize = 10
TextLabel_49.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_49.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_49.Parent = Frame_42
local TextLabel_50 = Instance.new("TextLabel")
TextLabel_50.Size = UDim2.new(1, - 195, 0, 16)
TextLabel_50.Position = UDim2.new(0, 94, 0, 70)
TextLabel_50.BackgroundTransparency = 1
TextLabel_50.Font = Enum.Font.GothamMedium
TextLabel_50.Text = "วันที่อัป: -"
TextLabel_50.TextColor3 = Color3.fromRGB(140, 140, 140)
TextLabel_50.TextSize = 10
TextLabel_50.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_50.Parent = Frame_42
local TextLabel_51 = Instance.new("TextLabel")
TextLabel_51.Size = UDim2.new(1, - 195, 0, 16)
TextLabel_51.Position = UDim2.new(0, 94, 0, 88)
TextLabel_51.BackgroundTransparency = 1
TextLabel_51.Font = Enum.Font.GothamBold
TextLabel_51.Text = "ID: -"
TextLabel_51.TextColor3 = Color3.fromRGB(120, 120, 120)
TextLabel_51.TextSize = 10
TextLabel_51.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_51.Parent = Frame_42
local TextButton_52 = Instance.new("TextButton")
TextButton_52.Size = UDim2.new(0, 85, 0, 32)
TextButton_52.Position = UDim2.new(1, - 95, 0, 55)
TextButton_52.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextButton_52.Font = Enum.Font.FredokaOne
TextButton_52.Text = "คัดลอก"
TextButton_52.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_52.TextSize = 11
TextButton_52.Parent = Frame_42
local UICorner_53 = Instance.new("UICorner")
UICorner_53.CornerRadius = UDim.new(0, 6)
UICorner_53.Parent = TextButton_52
local TextLabel_54 = Instance.new("TextLabel")
TextLabel_54.Size = UDim2.new(1, - 110, 0, 20)
TextLabel_54.Position = UDim2.new(0, 10, 0, 138)
TextLabel_54.BackgroundTransparency = 1
TextLabel_54.Font = Enum.Font.GothamBold
TextLabel_54.Text = "ประวัติที่เคยเปิดทั้งหมด: 0"
TextLabel_54.TextColor3 = Color3.fromRGB(180, 180, 180)
TextLabel_54.TextSize = 10.5
TextLabel_54.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_54.Parent = Frame_41
local TextButton_55 = Instance.new("TextButton")
TextButton_55.Size = UDim2.new(0, 80, 0, 22)
TextButton_55.Position = UDim2.new(1, - 90, 0, 137)
TextButton_55.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextButton_55.Font = Enum.Font.FredokaOne
TextButton_55.Text = "ล้างประวัติ"
TextButton_55.TextColor3 = Color3.fromRGB(200, 200, 200)
TextButton_55.TextSize = 10
TextButton_55.Parent = Frame_41
local UICorner_56 = Instance.new("UICorner")
UICorner_56.CornerRadius = UDim.new(0, 4)
UICorner_56.Parent = TextButton_55
local UIStroke_57 = Instance.new("UIStroke")
UIStroke_57.Color = Color3.fromRGB(70, 70, 70)
UIStroke_57.Thickness = 1
UIStroke_57.Parent = TextButton_55
local ScrollingFrame_58 = Instance.new("ScrollingFrame")
ScrollingFrame_58.Size = UDim2.new(1, - 20, 1, - 168)
ScrollingFrame_58.Position = UDim2.new(0, 10, 0, 162)
ScrollingFrame_58.BackgroundTransparency = 1
ScrollingFrame_58.BorderSizePixel = 0
ScrollingFrame_58.ScrollBarThickness = 3
ScrollingFrame_58.Parent = Frame_41
local UIListLayout_59 = Instance.new("UIListLayout")
UIListLayout_59.Padding = UDim.new(0, 6)
UIListLayout_59.Parent = ScrollingFrame_58
local conn_60 = TextButton_55.MouseButton1Click:Connect(function()
end)
local TextButton_61 = Instance.new("TextButton")
TextButton_61.Name = "PBtn_LocalPlayer"
TextButton_61.Size = UDim2.new(1, - 6, 0, 42)
TextButton_61.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_61.BorderSizePixel = 0
TextButton_61.Text = ""
TextButton_61.Parent = ScrollingFrame_35
local UICorner_62 = Instance.new("UICorner")
UICorner_62.CornerRadius = UDim.new(0, 6)
UICorner_62.Parent = TextButton_61
local TextLabel_63 = Instance.new("TextLabel")
TextLabel_63.Size = UDim2.new(1, - 125, 0, 20)
TextLabel_63.Position = UDim2.new(0, 8, 0, 3)
TextLabel_63.BackgroundTransparency = 1
TextLabel_63.Font = Enum.Font.GothamBold
TextLabel_63.Text = "LocalPlayer"
TextLabel_63.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel_63.TextSize = 11
TextLabel_63.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_63.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_63.Parent = TextButton_61
local TextLabel_64 = Instance.new("TextLabel")
TextLabel_64.Size = UDim2.new(1, - 125, 0, 16)
TextLabel_64.Position = UDim2.new(0, 8, 0, 22)
TextLabel_64.BackgroundTransparency = 1
TextLabel_64.Font = Enum.Font.Gotham
TextLabel_64.Text = "@LocalPlayer"
TextLabel_64.TextColor3 = Color3.fromRGB(150, 150, 150)
TextLabel_64.TextSize = 9.5
TextLabel_64.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_64.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_64.Parent = TextButton_61
local TextLabel_65 = Instance.new("TextLabel")
TextLabel_65.Size = UDim2.new(0, 120, 0, 20)
TextLabel_65.Position = UDim2.new(1, - 123, 0.5, - 10)
TextLabel_65.BackgroundTransparency = 1
TextLabel_65.Font = Enum.Font.GothamBold
TextLabel_65.Text = "ไม่ได้เปิดเพลง"
TextLabel_65.TextColor3 = Color3.fromRGB(130, 130, 130)
TextLabel_65.TextSize = 9
TextLabel_65.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_65.Parent = TextButton_61
local conn_66 = TextButton_61.MouseButton1Click:Connect(function()
for _, child in ipairs(ScrollingFrame_35:GetChildren()) do
    TextButton_61.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end
TextButton_61.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextLabel_40.Visible = false
Frame_41.Visible = true
TextLabel_45.Text = "คนที่เลือก: LocalPlayer (@LocalPlayer)"
TextLabel_54.Text = "ประวัติที่เคยเปิดทั้งหมด: 0"
TextLabel_48.Text = "ไม่ได้เปิดเพลงอยู่"
TextLabel_49.Text = "อัปเพลงโดย: -"
TextLabel_50.Text = "วันที่อัป: -"
TextLabel_51.Text = "ID: -"
ImageLabel_46.Image = "rbxassetid://6034281281"
TextButton_52.Visible = false
for _, child in ipairs(ScrollingFrame_58:GetChildren()) do
end
ScrollingFrame_58.CanvasSize = UDim2.new(0, 0, 0, 0)
end)
ScrollingFrame_35.CanvasSize = UDim2.new(0, 0, 0, 94)
TextLabel_34.Text = "ผู้เล่นในเซิร์ฟเวอร์: 1 คน"
local conn_67 = Players_2.PlayerAdded:Connect(function(player)
local TextButton_68 = Instance.new("TextButton")
TextButton_68.Name = "PBtn_vole7vin"
TextButton_68.Size = UDim2.new(1, - 6, 0, 42)
TextButton_68.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_68.BorderSizePixel = 0
TextButton_68.Text = ""
TextButton_68.Parent = ScrollingFrame_35
local UICorner_69 = Instance.new("UICorner")
UICorner_69.CornerRadius = UDim.new(0, 6)
UICorner_69.Parent = TextButton_68
local TextLabel_70 = Instance.new("TextLabel")
TextLabel_70.Size = UDim2.new(1, - 125, 0, 20)
TextLabel_70.Position = UDim2.new(0, 8, 0, 3)
TextLabel_70.BackgroundTransparency = 1
TextLabel_70.Font = Enum.Font.GothamBold
TextLabel_70.Text = "vole7vin"
TextLabel_70.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel_70.TextSize = 11
TextLabel_70.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_70.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_70.Parent = TextButton_68
local TextLabel_71 = Instance.new("TextLabel")
TextLabel_71.Size = UDim2.new(1, - 125, 0, 16)
TextLabel_71.Position = UDim2.new(0, 8, 0, 22)
TextLabel_71.BackgroundTransparency = 1
TextLabel_71.Font = Enum.Font.Gotham
TextLabel_71.Text = "@vole7vin"
TextLabel_71.TextColor3 = Color3.fromRGB(150, 150, 150)
TextLabel_71.TextSize = 9.5
TextLabel_71.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_71.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel_71.Parent = TextButton_68
local TextLabel_72 = Instance.new("TextLabel")
TextLabel_72.Size = UDim2.new(0, 120, 0, 20)
TextLabel_72.Position = UDim2.new(1, - 123, 0.5, - 10)
TextLabel_72.BackgroundTransparency = 1
TextLabel_72.Font = Enum.Font.GothamBold
TextLabel_72.Text = "ไม่ได้เปิดเพลง"
TextLabel_72.TextColor3 = Color3.fromRGB(130, 130, 130)
TextLabel_72.TextSize = 9
TextLabel_72.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_72.Parent = TextButton_68
local conn_73 = TextButton_68.MouseButton1Click:Connect(function()
for _, child in ipairs(ScrollingFrame_35:GetChildren()) do
    TextButton_61.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end
TextButton_68.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextLabel_40.Visible = false
Frame_41.Visible = true
TextLabel_45.Text = "คนที่เลือก: vole7vin (@vole7vin)"
TextLabel_54.Text = "ประวัติที่เคยเปิดทั้งหมด: 0"
TextLabel_48.Text = "ไม่ได้เปิดเพลงอยู่"
TextLabel_49.Text = "อัปเพลงโดย: -"
TextLabel_50.Text = "วันที่อัป: -"
TextLabel_51.Text = "ID: -"
ImageLabel_46.Image = "rbxassetid://6034281281"
TextButton_52.Visible = false
for _, child in ipairs(ScrollingFrame_58:GetChildren()) do
end
ScrollingFrame_58.CanvasSize = UDim2.new(0, 0, 0, 0)
end)
ScrollingFrame_35.CanvasSize = UDim2.new(0, 0, 0, 94)
TextLabel_34.Text = "ผู้เล่นในเซิร์ฟเวอร์: 1 คน"
end)
local conn_74 = Players_2.PlayerRemoving:Connect(function(player)
TextButton_68:Destroy()
TextLabel_40.Visible = true
Frame_41.Visible = false
TextLabel_34.Text = "ผู้เล่นในเซิร์ฟเวอร์: 1 คน"
end)
for _, desc in pairs(workspace:GetDescendants()) do
    error("IsA is not a valid member of this function")