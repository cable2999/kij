# KItem Journal Project

## KIJ by Krunk

This is a Mudlet project using muddler to create an installable package.

The KIJ uses data from https://carrionfields.net/itemsearch, any pre-existing data you have from the CFGUI's item journal functionality, and the identify command to build an item database for use in Mudlet.
It can also use area data from Mudlet's map functionality if you have that available.

***The included kitemdb.json file is data from itemsearch only and is intended only as a backup in case the fetch from web functionality becomes broken at some point.***



## Installation

The following command should install the pre-release version.  Will need to update to latest at some point.

`lua uninstallPackage("kij") installPackage("https://github.com/cable2999/kij/releases/download/v0.9.0/kij.zip")`

## Usage

Brief introduction to the overall usage. Then break it down to specifics

### Aliases

* `alias1 <param1>`
  * description of what the alias does, and what param1 is if it exists
    * example usage1
    * optional example usage2, etc
* `alias 2`
  * and so on, and so forth

### API

* `functionName(param1, param2)
  * Then, do the same thing for any Lua API which you want them to be able to use.
  * This part can be skipped if you have separate API documentation, but keep in mind the README.md file is accessible from the package manage in Mudlet, so this allows you to provide documentation within Mudlet, to a degree.

## Final thoughts, how to contribute, thanks, things like that

I like to put anything which doesn't fit with the above stuff here, at the end. It keeps the documentation like stuff at the top.
