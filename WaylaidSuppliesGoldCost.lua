WaylaidSuppliesGoldCost = {}

local COLOR_RED = "|cffff0000"
local COLOR_GREEN = "|cff45f248"
local COLOR_WHITE = "|cffffffff"
local COLOR_BLUE = "|cff68bbe3"
local GOLD_TEXT = "|cffffd70ag|r"
local SILVER_TEXT = "|cffc7c7cfs|r"
local COPPER_TEXT = "|cffeda55fc|r"

local HUMAN_RACE_ID = 1
local HUMAN_RACE_MULTIPLIER = 1.1

local standingNames = {
    ["Unknown"] = 0,
    ["Hated"] = 1,
    ["Hostile"] = 2,
    ["Unfriendly"] = 3,
    ["Neutral"] = 4,
    ["Friendly"] = 5,
    ["Honored"] = 6,
    ["Revered"] = 7,
    ["Exalted"] = 8,
}

local WaylaidFactionIDs = {
    ["Alliance"] = 2586,
    ["Horde"] = 2587,
}

local WaylaidRewardsInfo = {
    ["UNKNOWN"] = {
        ["reputationAwarded"] = 0,
        ["currencyAwarded"] = 0,
        ["givesRepUntil"] = "Unknown",
    },

    -- https://www.wowhead.com/classic/quest=78612
    [9] = {
        ["reputationAwarded"] = 300,
        ["currencyAwarded"] = 600,
        ["givesRepUntil"] = "Friendly",
    },

    -- https://www.wowhead.com/classic/quest=78872
    [12] = {
        ["reputationAwarded"] = 450,
        ["currencyAwarded"] = 1500,
        ["givesRepUntil"] = "Friendly",
    },

    -- https://www.wowhead.com/classic/quest=79101
    [18] = {
        ["reputationAwarded"] = 500,
        ["currencyAwarded"] = 1500,
        ["givesRepUntil"] = "Honored",
    },

    -- https://www.wowhead.com/classic/quest=79102
    [22] = {
        ["reputationAwarded"] = 650,
        ["currencyAwarded"] = 2000,
        ["givesRepUntil"] = "Honored",
    },

    -- https://www.wowhead.com/classic/quest=79103
    [25] = {
        ["reputationAwarded"] = 800,
        ["currencyAwarded"] = 3000,
        ["givesRepUntil"] = "Honored",
    },

    -- https://www.wowhead.com/classic/quest=80307
    [28] = {
        ["reputationAwarded"] = 700,
        ["currencyAwarded"] = 20000,
        ["givesRepUntil"] = "Revered",
    },

    -- https://www.wowhead.com/classic/quest=80308
    [35] = {
        ["reputationAwarded"] = 850,
        ["currencyAwarded"] = 55000,
        ["givesRepUntil"] = "Revered",
    },

    -- https://www.wowhead.com/classic/quest=80309
    [40] = {
        ["reputationAwarded"] = 1000,
        ["currencyAwarded"] = 120000,
        ["givesRepUntil"] = "Revered",
    }
}

local WaylaidSuppliesInfo = {
    -- [Waylaid Supplies name] = {waylaid supplies item ID, required item ID, quantity required, reputation awarded, currency awarded}
    -- Level Unknown (probably invalid items, datamined from wowhead)
    -- Waylaid Supplies: Lesser Stoneshield Potions
    [215394] = {
        4623,
        20,
        WaylaidRewardsInfo["UNKNOWN"]["reputationAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["currencyAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["givesRepUntil"]
    },
    -- Waylaid Supplies: Gnomish Rocket Boots
    [215405]= {
        10724,
        20,
        WaylaidRewardsInfo["UNKNOWN"]["reputationAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["currencyAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["givesRepUntil"]
    },
    -- Waylaid Supplies: Goblin Mortars
    [215406] = {
        10577,
        20,
        WaylaidRewardsInfo["UNKNOWN"]["reputationAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["currencyAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["givesRepUntil"]
    },
    -- Waylaid Supplies: Dusky Belts
    [215410] = {
        7387,
        4,
        WaylaidRewardsInfo["UNKNOWN"]["reputationAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["currencyAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["givesRepUntil"]
    },
    -- Waylaid Supplies: Shadowskin Gloves
    [215412] = {
        18238,
        20,
        WaylaidRewardsInfo["UNKNOWN"]["reputationAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["currencyAwarded"],
        WaylaidRewardsInfo["UNKNOWN"]["givesRepUntil"]
    },

    -- Level 9
    -- Waylaid Supplies: Peacebloom
    [211316] = {
        2447,
        20,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Copper Bars
    [210771] = {
        2840,
        20,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Rough Stone
    [211933] = {
        2835,
        10,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Brilliant Smallfish
    [211331] = {
        6290,
        20,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Silverleaf
    [211317] = {
        765,
        20,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Heavy Linen Bandages
    [211332] = {
        2581,
        10,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Light Leather
    [211315] = {
        2318,
        14,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Herb Baked Eggs
    [211329] = {
        6888,
        20,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },
    -- Waylaid Supplies: Spiced Wolf Meat
    [211330] = {
        2680,
        20,
        WaylaidRewardsInfo[9]["reputationAwarded"],
        WaylaidRewardsInfo[9]["currencyAwarded"],
        WaylaidRewardsInfo[9]["givesRepUntil"]
    },

    -- Level 12
    -- Waylaid Supplies: Brown Linen Pants
    [211327] = {
        4343,
        6,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Brown Linen Robes
    [211328] = {
        6238,
        4,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Copper Shortswords
    [211319] = {
        2847,
        6,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Embossed Leather Vests
    [211326] = {
        2300,
        3,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Handstitched Leather Belts
    [211325] = {
        4237,
        5,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Healing Potions
    [211934] = {
        929,
        10,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Lesser Magic Wands
    [211321] = {
        11287,
        2,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Minor Healing Potions
    [211318] = {
        118,
        20,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Minor Wizard Oil
    [211322] = {
        20744,
        2,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Rough Boomsticks
    [211324] = {
        4362,
        3,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Rough Copper Bombs
    [211323] = {
        4360,
        12,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },
    -- Waylaid Supplies: Runed Copper Pants
    [211320] = {
        3473,
        3,
        WaylaidRewardsInfo[12]["reputationAwarded"],
        WaylaidRewardsInfo[12]["currencyAwarded"],
        WaylaidRewardsInfo[12]["givesRepUntil"]
    },

    -- Level 18
    -- Waylaid Supplies: Bronze Bars
    [211819] = {
        2841,
        12,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Silver Bars
    [211820] = {
        2842,
        6,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Medium Leather
    [211821] = {
        2319,
        12,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Bruiseweed
    [211822] = {
        2453,
        20,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Swiftthistle
    [211823] = {
        2452,
        20,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Smoked Bear Meat
    [211836] = {
        8607,
        20,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Goblin Deviled Clams
    [211837] = {
        5527,
        8,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Heavy Wool Bandages
    [211838] = {
        3531,
        15,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },
    -- Waylaid Supplies: Smoked Sagefish
    [211835] = {
        21072,
        15,
        WaylaidRewardsInfo[18]["reputationAwarded"],
        WaylaidRewardsInfo[18]["currencyAwarded"],
        WaylaidRewardsInfo[18]["givesRepUntil"]
    },

    -- Level 22
    -- Waylaid Supplies: Dark Leather Cloaks
    [211831] = {
        2316,
        2,
        WaylaidRewardsInfo[22]["reputationAwarded"],
        WaylaidRewardsInfo[22]["currencyAwarded"],
        WaylaidRewardsInfo[22]["givesRepUntil"]
    },
    -- Waylaid Supplies: Gray Woolen Shirts
    [211833] = {
        2587,
        4,
        WaylaidRewardsInfo[22]["reputationAwarded"],
        WaylaidRewardsInfo[22]["currencyAwarded"],
        WaylaidRewardsInfo[22]["givesRepUntil"]
    },
    -- Waylaid Supplies: Lesser Mana Potions
    [211824] = {
        3385,
        20,
        WaylaidRewardsInfo[22]["reputationAwarded"],
        WaylaidRewardsInfo[22]["currencyAwarded"],
        WaylaidRewardsInfo[22]["givesRepUntil"]
    },
    -- Waylaid Supplies: Minor Mana Oil
    [211828] = {
        20745,
        2,
        WaylaidRewardsInfo[22]["reputationAwarded"],
        WaylaidRewardsInfo[22]["currencyAwarded"],
        WaylaidRewardsInfo[22]["givesRepUntil"]
    },
    -- Waylaid Supplies: Rough Bronze Boots
    [211825] = {
        6350,
        3,
        WaylaidRewardsInfo[22]["reputationAwarded"],
        WaylaidRewardsInfo[22]["currencyAwarded"],
        WaylaidRewardsInfo[22]["givesRepUntil"]
    },
    -- Waylaid Supplies: Small Bronze Bombs
    [211829] = {
        4374,
        12,
        WaylaidRewardsInfo[22]["reputationAwarded"],
        WaylaidRewardsInfo[22]["currencyAwarded"],
        WaylaidRewardsInfo[22]["givesRepUntil"]
    },

    -- Level 25
    --["Waylaid Supplies: Hillman's Shoulders"] = {
    [211832] = {
        4251,
        2,
        WaylaidRewardsInfo[25]["reputationAwarded"],
        WaylaidRewardsInfo[25]["currencyAwarded"],
        WaylaidRewardsInfo[25]["givesRepUntil"]
    },
    -- Waylaid Supplies: Elixir of Firepower
    [211935] = {
        6373,
        15,
        WaylaidRewardsInfo[25]["reputationAwarded"],
        WaylaidRewardsInfo[25]["currencyAwarded"],
        WaylaidRewardsInfo[25]["givesRepUntil"]
    },
    -- Waylaid Supplies: Ornate Spyglasses
    [211830] = {
        5507,
        2,
        WaylaidRewardsInfo[25]["reputationAwarded"],
        WaylaidRewardsInfo[25]["currencyAwarded"],
        WaylaidRewardsInfo[25]["givesRepUntil"]
    },
    --["Waylaid Supplies: Pearl-clasped Cloaks"] = {
    [211834] = {
        5542,
        3,
        WaylaidRewardsInfo[25]["reputationAwarded"],
        WaylaidRewardsInfo[25]["currencyAwarded"],
        WaylaidRewardsInfo[25]["givesRepUntil"]
    },
    -- Waylaid Supplies: Runed Silver Rods
    [211827] = {
        6339,
        1,
        WaylaidRewardsInfo[25]["reputationAwarded"],
        WaylaidRewardsInfo[25]["currencyAwarded"],
        WaylaidRewardsInfo[25]["givesRepUntil"]
    },
    -- Waylaid Supplies: Silver Skeleton Keys
    [211826] = {
        15869,
        14,
        WaylaidRewardsInfo[25]["reputationAwarded"],
        WaylaidRewardsInfo[25]["currencyAwarded"],
        WaylaidRewardsInfo[25]["givesRepUntil"]
    },

    -- Level 28
    -- Waylaid Supplies: Fadeleaf
    [215389] = {
        3818,
        16,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Fire Oil
    [215421] = {
        6371,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Formal White Shirts
    [215413] = {
        4334,
        3,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Heavy Hide
    [215387] = {
        4235,
        5,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Heavy Silk Bandages
    [215419] = {
        6451,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    --["Waylaid Supplies: Khadgar's Whisker"] = {
    [215390] = {
        3358,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Mithril Bars
    [215386] = {
        3860,
        6,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Wintersbite
    [215391] = {
        3819,
        8,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Purple Lotus
    [215392] = {
        8831,
        8,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Solid Grinding Stones
    [215400] = {
        7966,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Soothing Turtle Bisque
    [215417] = {
        3729,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Spider Sausages
    [215418] = {
        17222,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Thick Leather
    [215388] = {
        4304,
        10,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },
    -- Waylaid Supplies: Rockscale Cod
    [215420] = {
        6362,
        40,
        WaylaidRewardsInfo[28]["reputationAwarded"],
        WaylaidRewardsInfo[28]["currencyAwarded"],
        WaylaidRewardsInfo[28]["givesRepUntil"]
    },

    -- Level 35
    -- Waylaid Supplies: Barbaric Shoulders
    [215407] = {
        5964,
        4,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Big Iron Bombs
    [215402] = {
        4394,
        8,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Compact Harvest Reaper Kits
    [215401] = {
        4391,
        2,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Crimson Silk Pantaloons
    [215414] = {
        7062,
        4,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Deadly Scopes
    [215403] = {
        10546,
        4,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Elixirs of Agility
    [215395] = {
        8949,
        12,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Frost Leather Cloaks
    [215411] = {
        7377,
        3,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Gold Bars
    [215385] = {
        3577,
        4,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Greater Healing Potions
    [215393] = {
        1710,
        16,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Rich Purple Silk Shirts
    [215415] = {
        4335,
        5,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Guardian Gloves
    [215408] = {
        5966,
        6,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Green Iron Bracers
    [215398] = {
        3835,
        5,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },
    -- Waylaid Supplies: Heavy Mithril Gauntlets
    [215399] = {
        7919,
        4,
        WaylaidRewardsInfo[35]["reputationAwarded"],
        WaylaidRewardsInfo[35]["currencyAwarded"],
        WaylaidRewardsInfo[35]["givesRepUntil"]
    },

    -- Level 40
    -- Waylaid Supplies: Elixirs of Greater Defense
    [215396] = {
        8951,
        14,
        WaylaidRewardsInfo[40]["reputationAwarded"],
        WaylaidRewardsInfo[40]["currencyAwarded"],
        WaylaidRewardsInfo[40]["givesRepUntil"]
    },
    -- Waylaid Supplies: Massive Iron Axes
    [215397] = {
        3855,
        2,
        WaylaidRewardsInfo[40]["reputationAwarded"],
        WaylaidRewardsInfo[40]["currencyAwarded"],
        WaylaidRewardsInfo[40]["givesRepUntil"]
    },
    -- Waylaid Supplies: Mithril Blunderbuss
    [215404] = {
        10508,
        2,
        WaylaidRewardsInfo[40]["reputationAwarded"],
        WaylaidRewardsInfo[40]["currencyAwarded"],
        WaylaidRewardsInfo[40]["givesRepUntil"]
    },
    -- Waylaid Supplies: White Bandit Masks
    [215416] = {
        10008,
        4,
        WaylaidRewardsInfo[40]["reputationAwarded"],
        WaylaidRewardsInfo[40]["currencyAwarded"],
        WaylaidRewardsInfo[40]["givesRepUntil"]
    },
    -- Waylaid Supplies: Turtle Scale Bracers
    [215409] = {
        8198,
        3,
        WaylaidRewardsInfo[40]["reputationAwarded"],
        WaylaidRewardsInfo[40]["currencyAwarded"],
        WaylaidRewardsInfo[40]["givesRepUntil"]
    },

    -- Add more entries here as needed
}

local function IsPlayerRaceHuman()
    local _, _, playerRaceID = UnitRace("player")

    if playerRaceID == HUMAN_RACE_ID then
        return true
    end

    return false
end

local function GetWaylaidSuppliesInfo(itemID)
    return WaylaidSuppliesInfo[itemID]
end

local function GetAuctionatorPricingInformation(itemID)
    return Auctionator.API.v1.GetAuctionPriceByItemID("WaylaidSuppliesGoldCost", itemID)
end

local function GetTsmPricingInformation(itemID)
    local itemInfo = { GetItemInfo(itemID) }
    local bindType = select(14, itemInfo)

    if bindType == 1 then
        return
    end

    local dbmarket = TSM_API.GetCustomPriceValue("dbmarket", "i:" .. itemID)
    local dbminbuyout = TSM_API.GetCustomPriceValue("dbminbuyout", "i:" .. itemID)
    local dbregion = TSM_API.GetCustomPriceValue("dbregionmarketavg", "i:" .. itemID)
    if not dbmarket and not dbminbuyout and not dbregion then
        return
    end

    local string = nil

    if dbmarket and dbminbuyout then
        string = dbminbuyout
    elseif dbmarket and not dbminbuyout then
        string = dbmarket
    else
        string = dbregion
    end

    return string
end

local function AddColoredLine(tooltip, leftText, rightText, leftColor, rightColor)
    local line = leftColor .. leftText .. " " .. rightColor .. rightText
    tooltip:AddLine(line)
end

local function ConvertCurrencyToPrintableString(currency)
    local returnString = ""

    if IsAddOnLoaded("TradeSkillMaster") then
        returnString = TSM_API.FormatMoneyString(currency)

        if currency < 0 then
            returnString = returnString:sub(2)
        end

        return returnString
    end

    currency = tonumber(currency)
    currency = abs(currency)
    local gold = floor(currency / 10000)
    local silver = floor((currency % 10000) / 100)
    local copper = floor(currency % 100)

    if gold and gold > 0 then
        returnString = gold .. GOLD_TEXT .. " "
    end

    if silver and silver > 0 then
        returnString = returnString .. silver .. SILVER_TEXT .. " "
    end

    if copper and copper > 0 then
        returnString = returnString .. copper .. COPPER_TEXT
    end

    return returnString
end

local function DeterminePlayerFaction()
    local faction = UnitFactionGroup("player")

    return faction
end

local function GetWaylaidReputationGroupID(playerFaction)
    return WaylaidFactionIDs[playerFaction]
end

local function GetWaylaidReputationPlayerStanding()
    local _, _, standingID, _, _, _, _, _, _, _, _, _, _, _, _, _ = GetFactionInfoByID(GetWaylaidReputationGroupID(DeterminePlayerFaction()))

    return standingID
end

local function AddEmptyLine(tooltip)
    tooltip:AddLine("   ")
end

local function DisplayDetailedPricingInformation(tooltip, source, totalPrice, currencyAwarded, priceInfo, priceInfoColor)
    AddColoredLine(tooltip, string.format("  Est. Cost (%s): ", source), ConvertCurrencyToPrintableString(totalPrice), COLOR_BLUE, COLOR_RED)
    AddColoredLine(tooltip, "  Gold Reward:   ", ConvertCurrencyToPrintableString(currencyAwarded), COLOR_BLUE, COLOR_GREEN)
    AddColoredLine(tooltip, string.format("  Fill Price (%s): ", source), priceInfo, COLOR_BLUE, priceInfoColor)
    AddEmptyLine(tooltip)
end

local function addPriceLine(price, source, quantityRequired, currencyAwarded, tooltip)
    local totalPrice = quantityRequired * (price or 0)
    local totalCost = totalPrice - (currencyAwarded or 0)
    local priceInfo = ConvertCurrencyToPrintableString(totalPrice)
    local priceInfoColor = COLOR_RED

    if currencyAwarded and currencyAwarded > 0 then
        priceInfo = ConvertCurrencyToPrintableString(totalCost)

        if totalCost > 0 then
            priceInfoColor = COLOR_RED -- You lose money by filling this
        elseif totalCost < 0 then
            priceInfoColor = COLOR_GREEN -- You gain money by filling this
        else
            priceInfoColor = COLOR_WHITE -- Different color for zero, if desired
        end
    end

    if not WaylaidSuppliesGoldCostDB.detailed_tooltip then
        if IsShiftKeyDown() then
            DisplayDetailedPricingInformation(tooltip, source, totalPrice, currencyAwarded, priceInfo, priceInfoColor)
            return
        end
        AddColoredLine(tooltip, string.format("  Fill Price (%s): ", source), priceInfo, COLOR_BLUE, priceInfoColor)
        return
    end

    DisplayDetailedPricingInformation(tooltip, source, totalPrice, currencyAwarded, priceInfo, priceInfoColor)
end

local function HandleReputationNumberOnTooltip(reputationAwarded, givesRepUntil, tooltip)
    if reputationAwarded and reputationAwarded > 0 and WaylaidSuppliesGoldCostDB.show_rep_gain then
        local repValue = 0

        if GetWaylaidReputationPlayerStanding() <= standingNames[givesRepUntil] then
            repValue = reputationAwarded

            if IsPlayerRaceHuman() then
                repValue = repValue * HUMAN_RACE_MULTIPLIER
            end
        end

        AddColoredLine(tooltip, "  Reputation: ", string.format("+%d", repValue), COLOR_BLUE, COLOR_WHITE)
    end
end

local function HandleReputationUntilOnTooltip(givesRepUntil, tooltip)
    if givesRepUntil and WaylaidSuppliesGoldCostDB.show_rep_until then
        local playerStanding = GetWaylaidReputationPlayerStanding()

        local color = COLOR_RED

        if playerStanding < standingNames[givesRepUntil] then
            color = COLOR_GREEN
        end

        AddColoredLine(tooltip, "  Gives rep until: ", givesRepUntil, COLOR_BLUE, color)
    end
end

local function HandlePricingOnTooltip(requiredItemID, quantityRequired, currencyAwarded, tooltip)
    AddEmptyLine(tooltip)
    tooltip:AddLine("|cffc06205WaylaidSupplies|r|cffffbf00Gold|r|cffc06205Cost|r")

    if WaylaidSuppliesGoldCostDB.use_tsm then
        if IsAddOnLoaded("TradeSkillMaster") then
            addPriceLine(GetTsmPricingInformation(requiredItemID), "Tsm", quantityRequired, currencyAwarded, tooltip)
            return
        end

        AddColoredLine(tooltip, "  Fill Price:", "TradeSkillMaster is not loaded.", COLOR_BLUE, COLOR_RED)
    end

    if WaylaidSuppliesGoldCostDB.use_auc then
        if IsAddOnLoaded("Auctionator") then
            addPriceLine(GetAuctionatorPricingInformation(requiredItemID), "Auc", quantityRequired, currencyAwarded, tooltip)
            return
        end

        AddColoredLine(tooltip, "  Fill Price:", "Auctionator is not loaded.", COLOR_BLUE, COLOR_RED)
    end

    if not WaylaidSuppliesGoldCostDB.use_tsm and not WaylaidSuppliesGoldCostDB.use_auc then
        AddColoredLine(tooltip, "  Fill Price:", "No pricing module is enabled.", COLOR_BLUE, COLOR_RED)
    end
end

local function UpdateTooltipWithWaylaidInformation(tooltip, itemID)
    local requiredItemInfo = GetWaylaidSuppliesInfo(itemID)

    if requiredItemInfo then
        local requiredItemID, quantityRequired, reputationAwarded, currencyAwarded, givesRepUntil = unpack(requiredItemInfo)

        HandlePricingOnTooltip(requiredItemID, quantityRequired, currencyAwarded, tooltip)
        HandleReputationNumberOnTooltip(reputationAwarded, givesRepUntil, tooltip)
        HandleReputationUntilOnTooltip(givesRepUntil, tooltip)

        AddEmptyLine(tooltip)
    end
end

local function OnTooltipSetItem(tooltip, ...)
    local _, itemLink = tooltip:GetItem()
    if not itemLink == "" or itemLink == nil then
        return
    end
    local itemID = GetItemInfoFromHyperlink(itemLink)
    if itemID == nil then
        return
    end
    if WaylaidSuppliesInfo[itemID] == nil then
        return
    end
    UpdateTooltipWithWaylaidInformation(tooltip, itemID)
end

GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
ItemRefTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
