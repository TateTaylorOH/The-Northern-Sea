Scriptname EETCArmorHostilityManager extends ReferenceAlias

Actor Property PlayerRef Auto
Faction Property PlayerFaction Auto
Faction Property TG04EastEmpireFactionHostile Auto
Keyword Property EECArmor Auto
Keyword Property EECBoots Auto
Keyword Property EECGauntlets Auto
Keyword Property EECHelmet Auto
Keyword Property EECJewelry Auto
int property minEECitemsForNeutral auto

int neutral = 0
int enemy = 1
int ally = 2
int friend = 3

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	utility.wait(0.1)
	registerForSingleUpdate(0.5)
endEvent
Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	utility.wait(0.1)
	registerForSingleUpdate(0.5)
endEvent

Event OnUpdate()
	int numEECWorn = 0
	if(PlayerRef.wornHasKeyword(EECArmor))
		numEECWorn += 1
	endIf
	if(PlayerRef.wornHasKeyword(EECBoots))
		numEECWorn += 1
	endIf
	if(PlayerRef.wornHasKeyword(EECGauntlets))
		numEECWorn += 1
	endIf
	if(PlayerRef.wornHasKeyword(EECHelmet))
		numEECWorn += 1
	endIf
	if(PlayerRef.wornHasKeyword(EECJewelry))
		numEECWorn += 1
	endIf
	if(numEECWorn >= minEECitemsForNeutral)
		TG04EastEmpireFactionHostile.setReaction(PlayerFaction, neutral)
	else
		TG04EastEmpireFactionHostile.setReaction(PlayerFaction, enemy)
	endIf
endEvent