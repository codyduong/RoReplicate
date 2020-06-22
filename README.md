# RoReplicate 0.2.5
A set of ModuleScripts for utilization in easier plugin creation, which blends in with the default Roblox Studio look. StudioWidgets is planned to be incorportated for ease of use (Rather than say, developing some classes yourself ontop of RoReplicate to achieve the desired look/functionality).

## Overview
Uses PluginGuis to make your plugin hosted in dockable widgets. Mostly being developed for personal plugin development, however
it is posted here just in case anyone else finds it useful.

#### Using RoReplicate
Currently the only documentation is inside the ModuleScripts themselves. There will be no documentation for usage on this README.md until a later and more complete version.

## Contributions
We are currently not accepting any contributions to this library as it is still being developed, when it is released there will be open contribution available. Any merge requests will be automatically declined as of now.

## Coding Conventions
Class and function names are CamelCase.
Variable and member names are camelCase.
Members and methods of starting with "_" are considered private, and should not be accessed outside the class. This is to prevent any confusion when using dot notation to obtain information (distinguishing between a child of a class, versus a property of a class), and any properties should instead be obtained using any of the appropriate methods.

## Installation
I don't know why'd you want to install an unfinished product, but here you go:

Install through the following steps:

1. Enable HTTP Requests in Game Settings in your Roblox Studio (Home►GameSettings►Options►Allow HTTP Requests)
2. Paste the following command in your commandbar, it will replicate this Repo's src into your game.Workspace
```lua
local http = game:GetService("HttpService")
local req = http:GetAsync("https://api.github.com/repos/Cody-Duong/RoReplicate/contents/src")
local json = http:JSONDecode(req)

local targetFolder = Instance.new("Folder")
targetFolder.Name = "RoReplicate"
targetFolder.Parent = game.Workspace

for i = 1, #json do
	local file = json[i]
	if (file.type == "file") then
		local name = file.name:sub(1, #file.name-4)
		local module = targetFolder:FindFirstChild(name) or Instance.new("ModuleScript")
		module.Name = name
		module.Source = http:GetAsync(file.download_url)
		module.Parent = targetFolder
	end
end
```
3. Disable HTTP Requests (This is highly recommended if you aren't using ```HttpService``` in your own scripts, as malicious scripts  can utilize this to inject their own code.)
