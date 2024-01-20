# Script QB-Back
## This FiveM script is written for an old version QBCore

The first part of the code is a few callbacks to handle the basic things. 
The second part of the code is a simple system for delay in each activation for other scripts. 

## How to use it? 

- Find the script, when you want to add delay system 
- Add `if` with callback `qb-back:delay` in place of initializing action 
- When the activity is started add a trigger `qb-back:Delay:add` or add `true` parameter for callback 
- When the activity is complete add a trigger `qb-back:delay:end` with an optional `time` parameter (minutes)

## Debug comment 

/back-reset - is comment for reset you delay system. It is useful, when you need to test something. 

## Installation

- Download the [latest version](https://github.com/mikoslaf/qb-back/releases/tag/v1.0)
- Add ```qb-back``` directory to the ```resources``` directory on the FiveM server
- Add the following directive to your FiveM ```server.cfg``` file
```
ensure qb-back
```

## P.S:. 

Some useful collbacks have been added to the script to help supervise the scripts.
