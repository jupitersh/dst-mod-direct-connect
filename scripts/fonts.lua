local Ratio = 0.8

_G = GLOBAL

-- 备份原字体的名子。
local FontNames = {
	DEFAULTFONT = _G.DEFAULTFONT,
	DIALOGFONT = _G.DIALOGFONT,
	TITLEFONT = _G.TITLEFONT,
	UIFONT = _G.UIFONT,
	BUTTONFONT = _G.BUTTONFONT,
	NEWFONT = _G.NEWFONT,
	NEWFONT_SMALL = _G.NEWFONT_SMALL,
	NEWFONT_OUTLINE = _G.NEWFONT_OUTLINE,
	NEWFONT_OUTLINE_SMALL = _G.NEWFONT_OUTLINE_SMALL,
	NUMBERFONT = _G.NUMBERFONT,
	TALKINGFONT = _G.TALKINGFONT,
	SMALLNUMBERFONT = _G.SMALLNUMBERFONT,
	BODYTEXTFONT = _G.BODYTEXTFONT,
	CODEFONT = _G.CODEFONT,
}

function ApplyLocalizedFonts()

	_G.DEFAULTFONT = FontNames.DEFAULTFONT
	_G.DIALOGFONT = FontNames.DIALOGFONT
	_G.TITLEFONT = FontNames.TITLEFONT
	_G.UIFONT = FontNames.UIFONT
	_G.BUTTONFONT = FontNames.BUTTONFONT
	_G.NEWFONT = FontNames.NEWFONT
	_G.NEWFONT_SMALL = FontNames.NEWFONT_SMALL
	_G.NEWFONT_OUTLINE = FontNames.NEWFONT_OUTLINE
	_G.NEWFONT_OUTLINE_SMALL = FontNames.NEWFONT_OUTLINE_SMALL
	_G.NUMBERFONT = FontNames.NUMBERFONT
	_G.TALKINGFONT = FontNames.TALKINGFONT
	_G.SMALLNUMBERFONT = FontNames.SMALLNUMBERFONT
	_G.BODYTEXTFONT = FontNames.BODYTEXTFONT
	_G.CODEFONT = FontNames.CODEFONT


	_G.TheSim:UnloadFont("normalfont")
	_G.TheSim:UnloadFont("normalfont_outline")
	_G.TheSim:UnloadPrefabs({"cn".."_fonts_"..modname})

	local LocalizedFontAssets = {}
	table.insert(LocalizedFontAssets, _G.Asset("FONT", MODROOT.."fonts/normal.zip"))
	table.insert(LocalizedFontAssets, _G.Asset("FONT", MODROOT.."fonts/normal_outline.zip"))

	local LocalizedFontsPrefab = _G.Prefab("common/".."cn".."_fonts_"..modname, nil, LocalizedFontAssets)
	_G.RegisterPrefabs(LocalizedFontsPrefab)
	_G.TheSim:LoadPrefabs({"cn".."_fonts_"..modname})

	_G.TheSim:LoadFont(MODROOT.."fonts/normal.zip", "normalfont")
	_G.TheSim:LoadFont(MODROOT.."fonts/normal_outline.zip", "normalfont_outline")

	_G.TheSim:SetupFontFallbacks("normalfont", _G.DEFAULT_FALLBACK_TABLE)
	_G.TheSim:SetupFontFallbacks("normalfont_outline", _G.DEFAULT_FALLBACK_TABLE_OUTLINE)

	_G.DEFAULTFONT = "normalfont_outline"
	_G.DIALOGFONT = "normalfont_outline"
	_G.TITLEFONT = "normalfont_outline"
	_G.UIFONT = "normalfont_outline"
	_G.BUTTONFONT = "normalfont"
	_G.NEWFONT = "normalfont"
	_G.NEWFONT_SMALL = "normalfont"
	_G.NEWFONT_OUTLINE = "normalfont_outline"
	_G.NEWFONT_OUTLINE_SMALL = "normalfont_outline"
	_G.NUMBERFONT = "normalfont_outline"
	_G.TALKINGFONT = "normalfont_outline"
	_G.SMALLNUMBERFONT = "normalfont_outline"
	_G.BODYTEXTFONT = "normalfont_outline"
	_G.CODEFONT = "normalfont"

end


_G.getmetatable( _G.TheSim).__index.UnregisterAllPrefabs = (function()
	local oldUnregisterAllPrefabs = _G.getmetatable( _G.TheSim).__index.UnregisterAllPrefabs
	return function(self, ...)
		oldUnregisterAllPrefabs(self, ...)
		ApplyLocalizedFonts()
	end
end)()

local OldRegisterPrefabs = _G.ModManager.RegisterPrefabs
local function NewRegisterPrefabs(self)
	OldRegisterPrefabs(self)
	ApplyLocalizedFonts()
end
_G.ModManager.RegisterPrefabs=NewRegisterPrefabs

local OldStart = _G.Start
function _G.Start()
	ApplyLocalizedFonts()
	OldStart()
end

-- 以下调节一些较小的字体
AddClassPostConstruct("screens/redeemdialog", function(self)
	if self.fineprint then
		self.fineprint:SetSize(24)
	end
end)

AddClassPostConstruct("widgets/uiclock", function(self)
	if self._text then
		self._text:SetSize(45)
	end
	if self._moonanim and self._moonanim.moontext then
		self._moonanim.moontext:SetFont(FontNames.NUMBERFONT)
		self._moonanim.moontext:SetSize( self._moonanim.moontext.size / Ratio / Ratio )
	end
end)

AddClassPostConstruct("widgets/controls", function(self)
	if self.seasonclock and self.seasonclock._text then
		self.seasonclock._text:SetSize(36)
	end

	if _G.TheFrontEnd and _G.TheFrontEnd.consoletext then
		_G.TheFrontEnd.consoletext:SetSize( _G.TheFrontEnd.consoletext.size / Ratio / Ratio )
	end
end)

AddClassPostConstruct("widgets/badge", function(self)
	if self.num then
		self.num:SetFont(FontNames.NUMBERFONT)
		self.num:SetSize( self.num.size / Ratio / Ratio )
	end
	if self.maxnum then
		self.maxnum:SetFont(FontNames.NUMBERFONT)
		self.maxnum:SetSize( self.maxnum.size / Ratio / Ratio )
	end
end)

AddClassPostConstruct("screens/pausescreen", function(self)
	if self.subtitle then
		self.subtitle:SetSize(24)
	end
end)

AddClassPostConstruct("widgets/itemtile", function(self)
	if self.quantity then
		self.quantity:SetFont(FontNames.NUMBERFONT)
		self.quantity:SetSize( self.quantity.size / Ratio / Ratio )
	end
	if self.percent then
		self.percent:SetFont(FontNames.NUMBERFONT)
		self.percent:SetSize( self.percent.size / Ratio / Ratio )
	end
end)

AddClassPostConstruct("widgets/recipepopup", function(self)
	if self.desc then
		if _G.JapaneseOnPS4() then
			self.desc:SetSize(30 * 0.8)
			self.desc:SetRegionSize(64*3+30,110)
		else
			self.desc:SetSize(30)
			self.desc:SetRegionSize(64*3+30,90)
		end
	end
end)

AddClassPostConstruct("widgets/skincollector", function(self)
	if self.text then
		self.text:SetSize(34)
	end
end)

AddClassPostConstruct("screens/serverlistingscreen", function(self)
	if self.ViewServerTags then
		local TextListPopupDialogScreen = _G.require "screens/textlistpopupdialog"
		function self:ViewServerTags()
			if self.selected_server ~= nil and self.selected_server.tags ~= nil then
				--force the item to use the fallback font so that language tags don't look broken
				_G.TheFrontEnd:PushScreen(TextListPopupDialogScreen(_G.STRINGS.UI.SERVERLISTINGSCREEN.TAGSTITLE, self.selected_server.tags, nil, nil, nil, _G.NEWFONT))
			end
		end
	end
end)

AddClassPostConstruct("widgets/text", function(self)
	if self.size then
		self:SetSize( (self.size * Ratio) )
	end
	function self:SetSize(sz)
		local sz_ = sz * Ratio
		self.inst.TextWidget:SetSize(sz_)
		self.size = sz_
	end
end)
