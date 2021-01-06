name = "荒野求生直连"
description = [[
直连荒野求生服务器
QQ群457300968
Steam组群：饥荒荒野求生
]]
author = "辣椒小皇纸"
version = "1.10.0"
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

priority = -2019

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
        name = "clock_font_size",
        label = "时钟字体大小",
        hover = "仅在开启好看的字体后生效，解决时钟字体过大",
        options =   {
                        {description = "25", data = 25, hover = ""},
                        {description = "30", data = 30, hover = ""},
                        {description = "35", data = 35, hover = ""},
                        {description = "40", data = 40, hover = ""},
                        {description = "45", data = 45, hover = ""},
                        {description = "50", data = 50, hover = ""},
                        {description = "55", data = 55, hover = ""},
                    },
        default = 45,
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