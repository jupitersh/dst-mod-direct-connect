name = "荒野求生直连"
description = [[
直连荒野求生服务器
QQ群457300968
Steam组群：饥荒荒野求生
]]
author = "Jupiter"
version = "1.5.1"
forumthread = ""
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = false
dst_compatible = true
client_only_mod = true
all_clients_require_mod = false

priority = -99

----------------------
-- General settings --
----------------------

configuration_options =
{
    {
        name = "diy_font",
        label = "好看的字体",
        hover = "",
        options =   {
                        {description = "是", data = true, hover = ""},
                        {description = "否", data = false, hover = ""},
                    },
        default = true,
    },
    {
        name = "show_mainscreen_button",
        label = "开始界面按钮",
        hover = "",
        options =   {
                        {description = "是", data = true, hover = ""},
                        {description = "否", data = false, hover = ""},
                    },
        default = true,
    },
    {
        name = "show_multiplayermainscreen_button",
        label = "主界面按钮",
        hover = "",
        options =   {
                        {description = "是", data = true, hover = ""},
                        {description = "否", data = false, hover = ""},
                    },
        default = true,
    },
}