ModName = "BurnBabyBurn"
Author = "Jackty89"

UnlockableItemTrees = "METADATA\\REALITY\\TABLES\\UNLOCKABLEITEMTREES.MBIN"
TechnologyTablePath = "METADATA\\REALITY\\TABLES\\NMS_REALITY_GCTECHNOLOGYTABLE.MBIN"
PlayerWeaponPropertiesTablePath = "METADATA\\REALITY\\TABLES\\PLAYERWEAPONPROPERTIESTABLE.MBIN"

AddFlame = [[<Property value="GcUnlockableItemTreeNode.xml">
<Property name="Unlockable" value="FLAME" />
<Property name="Children" />
</Property>]]

-- AddMinCharge = [[<Property value="GcStatsBonus.xml">
-- <Property name="Stat" value="GcStatsTypes.xml">
--   <Property name="StatsType" value="Weapon_Projectile_MinimumCharge" />
-- </Property>
-- <Property name="Bonus" value="1" />
-- <Property name="Level" value="1" />
-- </Property>]]

AddDot = [[
	<Property value="GcStatsBonus.xml">
		<Property name="Stat" value="GcStatsTypes.xml">
  			<Property name="StatsType" value="Weapon_FireDOT" />
		</Property>
		<Property name="Bonus" value="100" />
		<Property name="Level" value="1" />
	</Property>
	<Property value="GcStatsBonus.xml">
		<Property name="Stat" value="GcStatsTypes.xml">
  			<Property name="StatsType" value="Weapon_FireDOT_Duration" />
		</Property>
		<Property name="Bonus" value="10" />
		<Property name="Level" value="1" />
	</Property>
	<Property value="GcStatsBonus.xml">
		<Property name="Stat" value="GcStatsTypes.xml">
			<Property name="StatsType" value="Weapon_FireDOT_DPS" />
		</Property>
		<Property name="Bonus" value="500" />
		<Property name="Level" value="3" />
	</Property>]]

AddBounce = [[
	<Property value="GcStatsBonus.xml">
		<Property name="Stat" value="GcStatsTypes.xml">
  			<Property name="StatsType" value="Weapon_Projectile_Bounce" />
		</Property>
		<Property name="Bonus" value="100" />
	<Property name="Level" value="3" />
	</Property>]]

AddProjectile =
[[
	<Property value="GcStatsBonus.xml">
		<Property name="Stat" value="GcStatsTypes.xml">
  			<Property name="StatsType" value="Weapon_Projectile" />
		</Property>
		<Property name="Bonus" value="10" />
		<Property name="Level" value="1" />
	</Property>
]]

AddNade = [[
	<Property value="GcStatsBonus.xml">
          <Property name="Stat" value="GcStatsTypes.xml">
            <Property name="StatsType" value="Weapon_Grenade_Damage" />
          </Property>
          <Property name="Bonus" value="500" />
          <Property name="Level" value="1" />
        </Property>
       
        <Property value="GcStatsBonus.xml">
          <Property name="Stat" value="GcStatsTypes.xml">
            <Property name="StatsType" value="Weapon_Grenade_Radius" />
          </Property>
          <Property name="Bonus" value="2" />
          <Property name="Level" value="1" />
        </Property>
]]

DefaultProjectile =
{
	"MINE_GREN",
	"GRENADE",
	"CANNON",
	"SMG",
	"SHOTGUN",
	"BOLTGUN",
	"STUN_GREN",
	"FLAMETHROW",
}

NMS_MOD_DEFINITION_CONTAINER =
{
	["MOD_FILENAME"] 			= ModName..".pak",
	["MOD_DESCRIPTION"]			= ModName,
	["MOD_AUTHOR"]				= Author,
	["MODIFICATIONS"] 			=
	{
		{
			["MBIN_CHANGE_TABLE"] 	=
			{
				{
					["MBIN_FILE_SOURCE"] 	= UnlockableItemTrees,
					["EXML_CHANGE_TABLE"] 	=
					{
						{
							["SPECIAL_KEY_WORDS"] = {"Title", "UI_WEAP_TECH_TREE", "Title", "UI_TECH_TREE_SUB","Unlockable", "LASER"},
							["LINE_OFFSET"] = "+1",
                            ["ADD"] = AddFlame
						}
                    }
				},
				{
					["MBIN_FILE_SOURCE"] 	= PlayerWeaponPropertiesTablePath,
					["EXML_CHANGE_TABLE"] 	=
					{
						{
							["SPECIAL_KEY_WORDS"] = {"DefaultProjectile", "FLAMETHROW"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"WeaponClass", "Grenade"},
								{"DefaultProjectile", DefaultProjectile[2]}
							}
						}
                    }
				},
				{
					["MBIN_FILE_SOURCE"] 	= TechnologyTablePath,
					["EXML_CHANGE_TABLE"] 	=
					{
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Chargeable", "True"},
								{"SubstanceCategory", "Fuel"},

								{"UsesAmmo", "False"},
								{"AmmoId", ""},
								{"WikiEnabled", "True"},
								{"ChargeMultiplier", "2"},

								{"FragmentCost", "2500"},
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" , "TechShopRarity", "GcTechnologyRarity.xml"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"TechnologyRarity", "Common"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" , "Rarity", "GcTechnologyRarity.xml"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"TechnologyRarity", "Common"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" },
							["PRECEDING_KEY_WORDS"] = {"Weapon_Projectile_Dispersion"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Bonus", "15"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" },
							["PRECEDING_KEY_WORDS"] = {"Weapon_Projectile_Range"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Bonus", "250"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" },
							["PRECEDING_KEY_WORDS"] = {"Weapon_Projectile_BulletsPerShot"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Bonus", "5"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" },
							["PRECEDING_KEY_WORDS"] = {"Weapon_Projectile_Damage"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Bonus", "150"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" },
							["PRECEDING_KEY_WORDS"] = {"Weapon_Projectile_Rate"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Bonus", "12"}
							}
						},
						-- {
						-- {
						-- 	["SPECIAL_KEY_WORDS"] = {"ID", "FLAME" },
						-- 	["PRECEDING_KEY_WORDS"] = {"Weapon_Projectile_Rate"},
						-- 	["VALUE_CHANGE_TABLE"] =
						-- 	{
						-- 		{"Bonus", "100"}
						-- 	}
						-- },
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME"},
							["PRECEDING_KEY_WORDS"] = {"ChargeBy", "NMSString0x10.xml"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Value", "FUEL1"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME"},
							["PRECEDING_KEY_WORDS"] = {"ChargeBy", "NMSString0x10.xml", "NMSString0x10.xml"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Value", "HOT1"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME"},
							["PRECEDING_KEY_WORDS"] = {"ChargeBy", "NMSString0x10.xml", "NMSString0x10.xml" , "NMSString0x10.xml"},
							["VALUE_CHANGE_TABLE"] =
							{
								{"Value", "LAVA1"}
							}
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME"},
							["PRECEDING_KEY_WORDS"] = {"StatBonuses","GcStatsBonus.xml"},
							["REMOVE"] = "SECTION"
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME", "StatsType", "Weapon_Projectile_BulletsPerShot"},
							-- ["PRECEDING_KEY_WORDS"] = {"StatBonuses","GcStatsBonus.xml", "StatsType", "Weapon_Projectile_BulletsPerShot"},
							["LINE_OFFSET"] = "-2",
							["REMOVE"] = "SECTION"
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME", "StatsType", "Weapon_Projectile_MaximumCharge"},
							-- ["PRECEDING_KEY_WORDS"] = {"StatBonuses","GcStatsBonus.xml", "StatsType", "Weapon_Projectile_BulletsPerShot"},
							["LINE_OFFSET"] = "-2",
							["REMOVE"] = "SECTION"
						},
						{
							["SPECIAL_KEY_WORDS"] = {"ID", "FLAME"},
							["PRECEDING_KEY_WORDS"] = {"StatBonuses"},
							["ADD"] = AddDot..AddBounce..AddProjectile..AddNade
						},
                    }
				}
            }
        }
    }
}