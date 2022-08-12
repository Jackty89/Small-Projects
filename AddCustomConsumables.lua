-- Choose one of these fe. english would be Languages[1], french Languages[2] ...
Languages =
{
    ["English"]               = "English",
    ["French"]                = "French",
    ["Italian"]               = "Italian",
    ["German"]                = "German",
    ["Spanish"]               = "Spanish",
    ["Russian"]               = "Russian",
    ["Polish"]                = "Polish",
    ["Dutch"]                 = "Dutch",
    ["Portuguese"]            = "Portuguese",
    ["LatinAmeraicanSpanish"] = "LatinAmericanSpanish", --this is not a typo
    ["BrazilianPortuguese"]   = "BrazilianPortuguese",
    ["SimplifiedChinese"]     = "SimplifiedChinese",
    ["TraditionalChinese"]    = "TraditionalChinese",
    ["TencentChinese"]        = "TencentChinese",
    ["Korean"]                = "Korean",
    ["Japanese"]              = "Japanese",
    ["USEnglish"]             = "USEnglish"
}

-- SubstanceOrProduct[1] = Substance, ...[2] = Product
SubstanceOrProduct = { ["Substance"] = "Substance", ["Product"] =  "Product"}

AddNewConsumableProducts =
{
    {
        ["ProductID"]           = "BLUNITS",
        ["Requirements"]        =
        {
            --product/subsid, amount, prod/subs identifier
            {"LAUNCHSUB",      "5", SubstanceOrProduct["Substance"]},
            {"TECH_COMP",      "2", SubstanceOrProduct["Product"]},
        },
        ["Stacksize"]           = "10", --how many can fit in a stack
        ["Price"]               = "1",  --price as how much thsi product sells for
        ["NewProductIcon"]      = "TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.COMMUNITY.OFF.DDS", -- your path to custom or existing texture
        ["RewardData"]          =
        {

            "R_BLUNTIS", --Reward ID
            "GiveAll",   --RewardChoice - not sure how it works but well, look it up and test it
            {
                --reward chance, minvalu, maxval, currency type (there are only 3 reward types), so technically you could add 10 rewards of unit with different %'s and use SelectOne or wahtever its called as rewardchoice
                {"100", "1000", "5000", "Units"},    --units
                {"50", "1000", "5000", "Nanites"},  --nanites
                {"10", "1000", "5000", "Specials"}, --quicksilver
            }
        },
        ["Languages"] =
        {   
            --language identifier, name, substitle, description
            {Languages["English"], "Credit card", "no idea what subtitle does", "This credit card gives you units, nanites and quicksilver"}
        }
    }
}

ModName                  = "AddCustomConsumables"
Author                   = "jackty89"
ModDescription           = "template mod for consumable products that offer currency rewards"
CustomLanguageTag        = "CustomConsumables"

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"]         = ModName..".pak",
    ["MOD_DESCRIPTION"]      = ModDescription,
    ["MOD_AUTHOR"]           = Author,
    ["ADD_FILES"]            =
    {
    },
    ["MODIFICATIONS"] 			=
    {
        {
            ["MBIN_CHANGE_TABLE"] 	=
            {
                {
                    ["MBIN_FILE_SOURCE"] 	= "METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] 	=
                    {
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] 	= "METADATA/REALITY/TABLES/CONSUMABLEITEMTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] 	=
                    {
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] 	= "METADATA/REALITY/TABLES/REWARDTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] 	=
                    {
                    }
                },                
                {
                    ["MBIN_FILE_SOURCE"] 	= "METADATA/GAMESTATE/DEFAULTSAVEDATA.MBIN",
                    ["EXML_CHANGE_TABLE"] 	=
                    {
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] 	= "GCDEBUGOPTIONS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["PRECEDING_KEY_WORDS"] = {"LocTableList"},
                            ["ADD"] 	=
                            [[
                                <Property value="NMSString0x20.xml">
                                    <Property name="Value" value="NMS_]]..CustomLanguageTag..[[" />
                                </Property>
                            ]]
                        }
                    }
                }
            }
        }
    }
}

function CreateNewProduct(NewProductID, NewProductName, NewProductNameLc, NewProductSub, NewProductDesc, NewProductStackSize, NewProductValue, NewProductIcon, NewProductRequirements)
    local result =
    [[
        <Property value="GcProductData.xml">
            <Property name="Id" value="]]..NewProductID..[[" />
            <Property name="Name" value="]]..NewProductName..[[" />
            <Property name="NameLower" value="]]..NewProductNameLc..[[" />
            <Property name="Subtitle" value="VariableSizeString.xml">
                <Property name="Value" value="]]..NewProductSub..[[" />
            </Property>
            <Property name="Description" value="VariableSizeString.xml">
                <Property name="Value" value="]]..NewProductDesc..[[" />
            </Property>
            <Property name="Hint" value="" />
            <Property name="GroupID" value="" />
            <Property name="DebrisFile" value="TkModelResource.xml">
                <Property name="Filename" value="MODELS/EFFECTS/DEBRIS/TERRAINDEBRIS/TERRAINDEBRIS4.SCENE.MBIN" />
            </Property>
            <Property name="BaseValue" value="]]..NewProductValue..[[" />
            <Property name="Level" value="0" />
            <Property name="Icon" value="TkTextureResource.xml">
                <Property name="Filename" value="]]..NewProductIcon..[[" />
            </Property>
            <Property name="HeroIcon" value="TkTextureResource.xml">
                <Property name="Filename" value="" />
            </Property>
            <Property name="Colour" value="Colour.xml">
            <Property name="R" value="0.101960786" />
            <Property name="G" value="0.15294118" />
            <Property name="B" value="0.2" />
            <Property name="A" value="1" />
            </Property>
            <Property name="Category" value="GcRealitySubstanceCategory.xml">
                <Property name="SubstanceCategory" value="Exotic" />
            </Property>
            <Property name="Type" value="GcProductCategory.xml">
                <Property name="ProductCategory" value="Curiosity" />
            </Property>
            <Property name="Rarity" value="GcRarity.xml">
                <Property name="Rarity" value="Rare" />
            </Property>
            <Property name="Legality" value="GcLegality.xml">
                <Property name="Legality" value="Legal" />
            </Property>
            <Property name="Consumable" value="True" />
            <Property name="ChargeValue" value="0" />
            <Property name="StackMultiplier" value="]]..NewProductStackSize..[[" />
            <Property name="DefaultCraftAmount" value="1" />
            <Property name="CraftAmountStepSize" value="1" />
            <Property name="CraftAmountMultiplier" value="1" />
            <Property name="Requirements">
            ]]..NewProductRequirements..[[
            </Property>
            <Property name="AltRequirements" />
            <Property name="Cost" value="GcItemPriceModifiers.xml">
                <Property name="SpaceStationMarkup" value="0" />
                <Property name="LowPriceMod" value="-0.1" />
                <Property name="HighPriceMod" value="0.1" />
                <Property name="BuyBaseMarkup" value="0.2" />
                <Property name="BuyMarkupMod" value="0" />
            </Property>
            <Property name="RecipeCost" value="1" />
            <Property name="SpecificChargeOnly" value="False" />
            <Property name="NormalisedValueOnWorld" value="0.008012757" />
            <Property name="NormalisedValueOffWorld" value="0.008012757" />
            <Property name="TradeCategory" value="GcTradeCategory.xml">
                <Property name="TradeCategory" value="None" />
            </Property>
            <Property name="WikiCategory" value="Tech" />
            <Property name="IsCraftable" value="True" />
            <Property name="DeploysInto" value="" />
            <Property name="EconomyInfluenceMultiplier" value="0.25" />
            <Property name="PinObjective" value="UI_FIND_OBJ" />
            <Property name="PinObjectiveTip" value="" />
            <Property name="CookingIngredient" value="False" />
            <Property name="CookingValue" value="0" />
            <Property name="GoodForSelling" value="False" />
            <Property name="GiveRewardOnSpecialPurchase" value="" />
            <Property name="EggModifierIngredient" value="False" />
            <Property name="IsTechBox" value="False" />
        </Property>
    ]]

    return result
end

function CreateProductRequirement(IngedientID, IngredientType, IngredientAmount)
    return
    [[
        <Property value="GcTechnologyRequirement.xml">
            <Property name="ID" value="]]..IngedientID..[[" />
            <Property name="InventoryType" value="GcInventoryType.xml">
                <Property name="InventoryType" value="]]..IngredientType..[[" />
            </Property>
        <Property name="Amount" value="]]..IngredientAmount..[[" />
        </Property>
    ]]
end

function CreateNewConsumable(NewProductID, NewProductConsumeRewardID)
    return
    [[
        <Property value="GcConsumableItem.xml">
            <Property name="ID" value="]]..NewProductID..[[" />
            <Property name="RewardID" value="]]..NewProductConsumeRewardID..[[" />
            <Property name="TutorialRewardID" value="" />
            <Property name="ButtonLocID" value="UI_OPEN_SENT" />
            <Property name="ButtonSubLocID" value="UI_OPEN_SENT_SUB" />
            <Property name="CloseInventoryWhenUsed" value="True" />
            <Property name="AudioEventOnOpen" value="GcAudioWwiseEvents.xml">
                <Property name="AkEvent" value="INVALID_EVENT" />
            </Property>
            <Property name="RewardFailedLocID" value="INTRCT_NOROOM_L" />
            <Property name="DestroyItemWhenConsumed" value="True" />
            <Property name="AddCommunityTierClassIcon" value="False" />
            <Property name="SuppressResourceMessage" value="False" />
            <Property name="CustomOSD" value="" />
        </Property>
    ]]
end

function CreateRewardEntry(NewId, RewardChoice, Rewards)
    return [[
        <Property value="GcGenericRewardTableEntry.xml">
            <Property name="Id" value="]]..NewId..[[" />
            <Property name="List" value="GcRewardTableItemList.xml">
                <Property name="RewardChoice" value="]]..RewardChoice..[[" />
                <Property name="OverrideZeroSeed" value="False" />
                <Property name="List">
                    ]]..Rewards..[[
                </Property>
            </Property>
        </Property>
    ]]
end

function CreateCurrecyRewardItem(PercentageChance, AmountMin, AmountMax, CurrencyType)
    return [[
        <Property value="GcRewardTableItem.xml">
            <Property name="PercentageChance" value="]]..PercentageChance..[[" />
            <Property name="Reward" value="GcRewardMoney.xml">
            <Property name="AmountMin" value="]]..AmountMin..[[" />
            <Property name="AmountMax" value="]]..AmountMax..[[" />
            <Property name="RoundNumber" value="False" />
            <Property name="Currency" value="GcCurrency.xml">
                <Property name="Currency" value="]]..CurrencyType..[[" />
            </Property>
            </Property>
            <Property name="LabelID" value="" />
        </Property>
    ]]
end

function CreateKnowProduct(ProductID)
    return [[
        <Property value="NMSString0x10.xml">
            <Property name="Value" value="]]..ProductID..[[" />
        </Property>
    ]]
end

--Add New Products to the product table
local AddToProductTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
for i = 1, #AddNewConsumableProducts do
    local Requirements        = {}
    local ProductRequirements = ""
    local ProductID           = string.upper(AddNewConsumableProducts[i]["ProductID"])
    local ProductName         = string.upper(ProductID).."_NAME"
    local ProductNameLC       = string.upper(ProductID).."_NAME_L"
    local ProductDesc         = string.upper(ProductID).."_DESC"
    local ProductSub          = string.upper(ProductID).."_SUB"

    local ProductStackSize    = AddNewConsumableProducts[i]["Stacksize"]
    local ProductValue        = AddNewConsumableProducts[i]["Price"]
    local ProductIcon         = AddNewConsumableProducts[i]["NewProductIcon"]

	local RequirementsList    = AddNewConsumableProducts[i]["Requirements"]

    for k = 1, #RequirementsList  do
        local RequirementID     = ""
        local RequirementType   = ""
        local RequirementAmount = ""

        RequirementID           = RequirementsList[k][1]
        RequirementType         = RequirementsList[k][3]
        RequirementAmount       = RequirementsList[k][2]
        table.insert(Requirements, CreateProductRequirement(RequirementID, RequirementType, RequirementAmount))
    end
    ProductRequirements = table.concat(Requirements)

    AddToProductTable[#AddToProductTable + 1]  =
    {
        ["PRECEDING_KEY_WORDS"] = {"Table"},
        ["ADD"] = CreateNewProduct(ProductID, ProductName, ProductNameLC, ProductSub, ProductDesc, ProductStackSize, ProductValue, ProductIcon, ProductRequirements)
    }
end


--Adds the new Product as a consumable to consumable table
local AddToConsumableTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][2]["EXML_CHANGE_TABLE"]
local AddToRewardTable        = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][3]["EXML_CHANGE_TABLE"]
local AddToDefaultSaveData    = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][4]["EXML_CHANGE_TABLE"]
for i = 1, #AddNewConsumableProducts do
    local ProductID         = string.upper(AddNewConsumableProducts[i]["ProductID"])
    local ProductRewardData = AddNewConsumableProducts[i]["RewardData"]

    local RewardId          = string.upper(ProductRewardData[1])
    local RewardChoice      = ProductRewardData[2]
    local RewardData        = ProductRewardData[3]
    local Rewards           = {}

    for k = 1, #RewardData  do
        local PercentageChance = ""
        local AmountMin        = ""
        local AmountMax        = ""
        local CurrencyType     = ""

        PercentageChance       = RewardData[k][1]
        AmountMin              = RewardData[k][2]
        AmountMax              = RewardData[k][3]
        CurrencyType           = RewardData[k][4]

        table.insert(Rewards, CreateCurrecyRewardItem(PercentageChance, AmountMin, AmountMax, CurrencyType))
    end

    AddToRewardTable[#AddToRewardTable + 1] =
    {
        ["PRECEDING_KEY_WORDS"] = {"GenericTable"},
        ["ADD"] = CreateRewardEntry(RewardId, RewardChoice,  table.concat(Rewards))
    }

    AddToDefaultSaveData[#AddToDefaultSaveData + 1] =
    {
        ["PRECEDING_KEY_WORDS"] = {"KnownProducts"},
        ["ADD"] = CreateKnowProduct(ProductID)
    }

    AddToConsumableTable[#AddToConsumableTable + 1] =
    {
        ["PRECEDING_KEY_WORDS"] = {"Table"},
        ["ADD"] = CreateNewConsumable(ProductID, RewardId)
    }
end

--language file creation
function NewLanguagueFile(DescriptionEntries)
    return
    [[<?xml version="1.0" encoding="utf-8"?>
        <Data template="TkLocalisationTable">
            <Property name="Table">]]
            ..DescriptionEntries..
            [[
            </Property>
        </Data>
    ]]
end

function NewLanguageEntry(Language, NewDescription)
    return
    [[
        <Property name="]]..Language..[[" value="VariableSizeString.xml">
            <Property name="Value" value="]]..NewDescription..[[" />
        </Property>
    ]]
end

function NewDescriptionText(newDescId, LanguageEntries)
    return
    [[
        <Property value="TkLocalisationEntry.xml">
            <Property name="Id" value="]]..newDescId..[[" />
            ]]..LanguageEntries..[[
        </Property>
    ]]
end

function FillCustomlangFile()
    local NewProductLangEntries = {}

    for i = 1, #AddNewConsumableProducts do
        local ProductID = string.upper(AddNewConsumableProducts[i]["ProductID"])
        local DescriptionEntries = {}
        local SubtitleEntries = {}
        local NameLCEntries = {}
        local NameEntries = {}

        local Languages = AddNewConsumableProducts[i]["Languages"]

        local NameID = ProductID.."_NAME"
        local NameLCID = ProductID.."_NAME_L"
        local SubID = ProductID.."_SUB"
        local DescID = ProductID.."_DESC"

        for j = 1, #Languages do
            local Language = Languages[j][1]

            local NameLC = Languages[j][2]
            table.insert(NameLCEntries, NewLanguageEntry(Language, NameLC))

            local Name = string.upper(NameLC)
            table.insert(NameEntries, NewLanguageEntry(Language, Name))

            local NewSubTitle = Languages[j][3]
            table.insert(SubtitleEntries, NewLanguageEntry(Language, NewSubTitle))

            local NewDescription = Languages[j][4]
            table.insert(DescriptionEntries, NewLanguageEntry(Language, NewDescription))
        end

        table.insert(NewProductLangEntries, NewDescriptionText(NameLCID, table.concat(NameLCEntries)))
        table.insert(NewProductLangEntries, NewDescriptionText(NameID, table.concat(NameEntries)))
        table.insert(NewProductLangEntries, NewDescriptionText(SubID, table.concat(SubtitleEntries)))
        table.insert(NewProductLangEntries, NewDescriptionText(DescID, table.concat(DescriptionEntries)))

    end
    return NewLanguagueFile(table.concat(NewProductLangEntries))
end

local AddCsutomLanguageFiles = NMS_MOD_DEFINITION_CONTAINER["ADD_FILES"]
for Key , Language in pairs(Languages) do
    AddCsutomLanguageFiles[#AddCsutomLanguageFiles +1] =
    {
        ["FILE_DESTINATION"] 	=	"LANGUAGE\\NMS_"..CustomLanguageTag.."_"..Key..".EXML",
        ["FILE_CONTENT"] 		=	FillCustomlangFile()
    }
end