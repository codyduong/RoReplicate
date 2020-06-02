# RoReplicate
A set of ModuleScripts for utilization in easier plugin creation, which blends in with the default Roblox Studio look.

## Overview
Uses PluginGuis to make your plugin hosted in dockable widgets. Mostly being developed for personal plugin development, however
it is posted here just in case anyone else finds it useful.

## Contributions
We are currently not accepting any contributions to this library as it is still being developed, when it is released there will be open contribution available. Any merge requests will be automatically declined as of now.

## Coding Conventions
Class and function names are CamelCase.
Variable and member names are camelCase.
Members and methods of starting with "_" are considered private, and should not be accessed outside the class. This is to prevent any confusion when using dot notation to obtain information (distinguishing between a child of a class, versus a property of a class), and any properties should instead be obtained using any of the appropriate methods.
