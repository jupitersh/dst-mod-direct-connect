local ANCHOR_MIDDLE = GLOBAL.ANCHOR_MIDDLE
local SCALEMODE_PROPORTIONAL = GLOBAL.SCALEMODE_PROPORTIONAL
local SCALEMODE_FILLSCREEN = GLOBAL.SCALEMODE_FILLSCREEN
local FRONTEND_TITLE_COLOUR = GLOBAL.FRONTEND_TITLE_COLOUR
local RESOLUTION_X = GLOBAL.RESOLUTION_X
local RESOLUTION_Y = GLOBAL.RESOLUTION_Y
local BACK_BUTTON_Y = GLOBAL.BACK_BUTTON_Y
local STRINGS = GLOBAL.STRINGS
local GOLD = GLOBAL.GOLD
local MOVE_DOWN = GLOBAL.MOVE_DOWN
local MOVE_UP = GLOBAL.MOVE_UP

local title_x = 20
local title_y = 10
local subtitle_offset_x = 20
local subtitle_offset_y = -260
local rcol = RESOLUTION_X/2 -200
local lcol = -RESOLUTION_X/2 + 280

local Image = GLOBAL.require("widgets/image")
local Widget = GLOBAL.require("widgets/widget")
local TEMPLATES = GLOBAL.require("widgets/templates")
local OnlineStatus = GLOBAL.require("widgets/onlinestatus")
local Countdown = GLOBAL.require("widgets/countdown")
local ImageButton = GLOBAL.require("widgets/imagebutton")

local function mainscreen_modify(self)
    local btn_profile = {
        {name = "duocheng", title = "󰀁多层档󰀡", fn = function()
            self.duocheng_button:Disable()
            GLOBAL.TheSim:QueryServer("https://gitee.com/jupitersh/dstgriefer/raw/master/ip",
            function(result, isSuccessful, resultCode)
                if isSuccessful and resultCode == 200 then
                    GLOBAL.c_connect(result, 10999)
                end
            end, "GET")
        end},
        {name = "reforged", title = "󰀊熔炉档󰀭", fn = function()
            self.reforged_button:Disable()
            GLOBAL.TheSim:QueryServer("https://gitee.com/jupitersh/dstgriefer/raw/master/ip",
            function(result, isSuccessful, resultCode)
                if isSuccessful and resultCode == 200 then
                    GLOBAL.c_connect(result, 11999)
                end
            end, "GET")
        end},
    }

    for k, v in pairs(btn_profile) do
        local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))
        btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
        btn.bg:SetScale(.345, .265) --btn.bg:SetScale(.69, .53) --ontline size
        btn.bg:MoveToBack()
        btn.bg:Hide()
        btn.image:SetPosition(0,1.5)  --btn.image:SetPosition(0,3) --background position
        btn.bg:SetPosition(0,1.5) --btn.bg:SetPosition(0,3) --background position
        btn:SetPosition(-RESOLUTION_X * .40, -45 * k -20) --btn:SetPosition(-RESOLUTION_X * .35, -75 * k) --coodinate
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.325, .25) --btn:SetNormalScale(.65, .5) --image size losing focus
        btn:SetFocusScale(.35, .275) --btn:SetFocusScale(.7, .55) image size on focus
        btn:SetTextSize(55) --btn:SetTextSize(55)
        btn:SetFont(GLOBAL.TITLEFONT)
        btn:SetDisabledFont(GLOBAL.TITLEFONT)
        btn:SetText(v.title, true, {2,-3})
        local playgainfocusfn = btn.OnGainFocus
        local playlosefocusfn = btn.OnLoseFocus
        btn.OnGainFocus = function()
            playgainfocusfn(btn)
            btn:SetTextSize(29) --btn:SetTextSize(58) --text size on focus
            btn.image:SetTint(1,1,1,1) --btn.image:SetTint(1,1,1,1) image tranparency on focus
            btn.bg:Show()
        end
        btn.OnLoseFocus = function()
            playlosefocusfn(btn)
            btn:SetTextSize(27.5) --btn:SetTextSize(55) --text size losing focus
            btn.image:SetTint(1,1,1,.6) --btn.image:SetTint(1,1,1,.6) --image transparency losing focus
            btn.bg:Hide()
        end
        btn:SetOnClick(v.fn)

        self[v.name .. "_button"] = btn
    end

    local old_OnBecomeActive = self.OnBecomeActive
    function self:OnBecomeActive()
        old_OnBecomeActive(self)
        for k, v in pairs(btn_profile) do
            self[v.name .. "_button"]:Enable()
        end
    end
end

local function mainscreen_modify2(self)
    local btn_profile = {
        {name = "guaji", title = "󰀊开荒档󰀭", fn = function()
            self.guaji_button:Disable()
            GLOBAL.TheSim:QueryServer("https://gitee.com/jupitersh/dstgriefer/raw/master/ip",
            function(result, isSuccessful, resultCode)
                if isSuccessful and resultCode == 200 then
                    GLOBAL.c_connect(result, 11999)
                end
            end, "GET")
        end},
    }

    for k, v in pairs(btn_profile) do
        local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))
        btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
        btn.bg:SetScale(.345, .265) --btn.bg:SetScale(.69, .53) --ontline size
        btn.bg:MoveToBack()
        btn.bg:Hide()
        btn.image:SetPosition(0,1.5)  --btn.image:SetPosition(0,3) --background position
        btn.bg:SetPosition(0,1.5) --btn.bg:SetPosition(0,3) --background position
        btn:SetPosition(-RESOLUTION_X * .30, -45 * k -20) --btn:SetPosition(-RESOLUTION_X * .35, -75 * k) --coodinate
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.325, .25) --btn:SetNormalScale(.65, .5) --image size losing focus
        btn:SetFocusScale(.35, .275) --btn:SetFocusScale(.7, .55) image size on focus
        btn:SetTextSize(55) --btn:SetTextSize(55)
        btn:SetFont(GLOBAL.TITLEFONT)
        btn:SetDisabledFont(GLOBAL.TITLEFONT)
        btn:SetText(v.title, true, {2,-3})
        local playgainfocusfn = btn.OnGainFocus
        local playlosefocusfn = btn.OnLoseFocus
        btn.OnGainFocus = function()
            playgainfocusfn(btn)
            btn:SetTextSize(29) --btn:SetTextSize(58) --text size on focus
            btn.image:SetTint(1,1,1,1) --btn.image:SetTint(1,1,1,1) image tranparency on focus
            btn.bg:Show()
        end
        btn.OnLoseFocus = function()
            playlosefocusfn(btn)
            btn:SetTextSize(27.5) --btn:SetTextSize(55) --text size losing focus
            btn.image:SetTint(1,1,1,.6) --btn.image:SetTint(1,1,1,.6) --image transparency losing focus
            btn.bg:Hide()
        end
        btn:SetOnClick(v.fn)

        self[v.name .. "_button"] = btn
    end

    local old_OnBecomeActive = self.OnBecomeActive
    function self:OnBecomeActive()
        old_OnBecomeActive(self)
        for k, v in pairs(btn_profile) do
            self[v.name .. "_button"]:Enable()
        end
    end
end

local function multiplayermainscreen_modify(self)
    local btn_profile = {
        {name = "duocheng", title = "󰀁多层档󰀡", fn = function()
            self.duocheng_button:Disable()
            GLOBAL.TheSim:QueryServer("https://gitee.com/jupitersh/dstgriefer/raw/master/ip",
            function(result, isSuccessful, resultCode)
                if isSuccessful and resultCode == 200 then
                    GLOBAL.c_connect(result, 10999)
                end
            end, "GET")
        end},
        {name = "reforged", title = "󰀊熔炉档󰀭", fn = function()
            self.reforged_button:Disable()
            GLOBAL.TheSim:QueryServer("https://gitee.com/jupitersh/dstgriefer/raw/master/ip",
            function(result, isSuccessful, resultCode)
                if isSuccessful and resultCode == 200 then
                    GLOBAL.c_connect(result, 11999)
                end
            end, "GET")
        end},
    }

    for k, v in pairs(btn_profile) do
        local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))
        btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
        btn.bg:SetScale(.345, .265) --btn.bg:SetScale(.69, .53) --ontline size
        btn.bg:MoveToBack()
        btn.bg:Hide()
        btn.image:SetPosition(0,1.5)  --btn.image:SetPosition(0,3) --background position
        btn.bg:SetPosition(0,1.5) --btn.bg:SetPosition(0,3) --background position
        btn:SetPosition(-RESOLUTION_X * .15, -45 * k + 300) --btn:SetPosition(-RESOLUTION_X * .35, -75 * k) --coodinate
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.325, .25) --btn:SetNormalScale(.65, .5) --image size losing focus
        btn:SetFocusScale(.35, .275) --btn:SetFocusScale(.7, .55) --image size on focus
        btn:SetTextSize(55) --btn:SetTextSize(55)
        btn:SetFont(GLOBAL.TITLEFONT)
        btn:SetDisabledFont(GLOBAL.TITLEFONT)
        btn:SetText(v.title, true, {2,-3})
        local playgainfocusfn = btn.OnGainFocus
        local playlosefocusfn = btn.OnLoseFocus
        btn.OnGainFocus = function()
            playgainfocusfn(btn)
            btn:SetTextSize(29) --btn:SetTextSize(58) --text size on focus
            btn.image:SetTint(1,1,1,1) --btn.image:SetTint(1,1,1,1) --image tranparency on focus
            btn.bg:Show()
        end
        btn.OnLoseFocus = function()
            playlosefocusfn(btn)
            btn:SetTextSize(27.5) --btn:SetTextSize(55) --text size losing focus
            btn.image:SetTint(1,1,1,.6) --btn.image:SetTint(1,1,1,.6) --image transparency losing focus
            btn.bg:Hide()
        end
        btn:SetOnClick(v.fn)

        self[v.name .. "_button"] = btn
    end

    local old_OnBecomeActive = self.OnBecomeActive
    function self:OnBecomeActive()
        old_OnBecomeActive(self)
        for k, v in pairs(btn_profile) do
            self[v.name .. "_button"]:Enable()
        end
    end
end

local function multiplayermainscreen_modify2(self)
    local btn_profile = {
        {name = "guaji", title = "󰀊开荒档󰀭", fn = function()
            self.guaji_button:Disable()
            GLOBAL.TheSim:QueryServer("https://gitee.com/jupitersh/dstgriefer/raw/master/ip",
            function(result, isSuccessful, resultCode)
                if isSuccessful and resultCode == 200 then
                    GLOBAL.c_connect(result, 11999)
                end
            end, "GET")
        end},
    }

    for k, v in pairs(btn_profile) do
        local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))
        btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
        btn.bg:SetScale(.345, .265) --btn.bg:SetScale(.69, .53) --ontline size
        btn.bg:MoveToBack()
        btn.bg:Hide()
        btn.image:SetPosition(0,1.5)  --btn.image:SetPosition(0,3) --background position
        btn.bg:SetPosition(0,1.5) --btn.bg:SetPosition(0,3) --background position
        btn:SetPosition(-RESOLUTION_X * .05, -45 * k + 300) --btn:SetPosition(-RESOLUTION_X * .35, -75 * k) --coodinate
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.325, .25) --btn:SetNormalScale(.65, .5) --image size losing focus
        btn:SetFocusScale(.35, .275) --btn:SetFocusScale(.7, .55) image size on focus
        btn:SetTextSize(55) --btn:SetTextSize(55)
        btn:SetFont(GLOBAL.TITLEFONT)
        btn:SetDisabledFont(GLOBAL.TITLEFONT)
        btn:SetText(v.title, true, {2,-3})
        local playgainfocusfn = btn.OnGainFocus
        local playlosefocusfn = btn.OnLoseFocus
        btn.OnGainFocus = function()
            playgainfocusfn(btn)
            btn:SetTextSize(29) --btn:SetTextSize(58) --text size on focus
            btn.image:SetTint(1,1,1,1) --btn.image:SetTint(1,1,1,1) image tranparency on focus
            btn.bg:Show()
        end
        btn.OnLoseFocus = function()
            playlosefocusfn(btn)
            btn:SetTextSize(27.5) --btn:SetTextSize(55) --text size losing focus
            btn.image:SetTint(1,1,1,.6) --btn.image:SetTint(1,1,1,.6) --image transparency losing focus
            btn.bg:Hide()
        end
        btn:SetOnClick(v.fn)

        self[v.name .. "_button"] = btn
    end

    local old_OnBecomeActive = self.OnBecomeActive
    function self:OnBecomeActive()
        old_OnBecomeActive(self)
        for k, v in pairs(btn_profile) do
            self[v.name .. "_button"]:Enable()
        end
    end
end

if GetModConfigData("show_mainscreen_button") then
    AddClassPostConstruct("screens/redux/mainscreen", mainscreen_modify)
    -- AddClassPostConstruct("screens/redux/mainscreen", mainscreen_modify2)
end

if GetModConfigData("show_multiplayermainscreen_button") then
    AddClassPostConstruct("screens/redux/multiplayermainscreen", multiplayermainscreen_modify)
    -- AddClassPostConstruct("screens/redux/multiplayermainscreen", multiplayermainscreen_modify2)
end

modimport("scripts/fonts.lua")