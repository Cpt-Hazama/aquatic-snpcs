AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/subnautica/ghost_leviathan.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 1000
ENT.CollisionA = 600
ENT.CollisionB = 750
ENT.CollisionC = -400
ENT.HullType = HULL_LARGE
ENT.Aquatic_AnimTbl_Calm = {ACT_WALK} -- Animations it plays when it's wandering around while idle
ENT.Aquatic_AnimTbl_Alerted = {ACT_RUN} -- Animations it plays when it's moving while alerted
ENT.Aquatic_SwimmingSpeed_Calm = 550 -- The speed it should swim with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aquatic_SwimmingSpeed_Alerted = 950 -- The speed it should swim with, when it's chasing an enemy, moving away quickly, etc. | Basically running campared to ground SNPCs
ENT.VJ_NPC_Class = {"CLASS_AQUATICS_LEVIATHAN"} -- NPCs with the same class with be allied to each other

ENT.MeleeAttackDamage = 300
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB -- Type of Damage
ENT.AnimTbl_MeleeAttack = {"vjges_roar"} -- Melee Attack Animations
ENT.MeleeAttackDistance = 900 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 1650 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = 2

ENT.HungerDrainTime = 1
ENT.HungerGainAmount = 10

ENT.SoundTbl_Idle = {}
ENT.SoundTbl_MeleeAttack = {"vj_aqua/ghostleviathan/bite1.wav","vj_aqua/ghostleviathan/bite2.wav"}
ENT.SoundTbl_Pain = {"vj_aqua/ghostleviathan/pain1.wav","vj_aqua/ghostleviathan/pain2.wav"}
ENT.SoundTbl_Roar = {"vj_aqua/ghostleviathan/roar1.wav","vj_aqua/ghostleviathan/roar2.wav","vj_aqua/ghostleviathan/roar3.wav"}
ENT.SoundTbl_Scream = {"vj_aqua/ghostleviathan/charge1.wav","vj_aqua/ghostleviathan/charge2.wav","vj_aqua/ghostleviathan/charge3.wav","vj_aqua/ghostleviathan/charge4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
	self.NextScreamT = self.NextScreamT or CurTime()
	if CurTime() > self.NextScreamT then
		self:VJ_ACT_PLAYACTIVITY("vjges_scream",false)
		self.NextScreamT = CurTime() +math.Rand(8,15)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "swim" then
		VJ_EmitSound(self,"ambient/water/water_spray" .. math.random(1,3) .. ".wav",90,math.random(60,80))
	end
	if key == "attack" then
		self:MeleeAttackCode()
	end
	if key == "roar" then
		VJ_EmitSound(self,self.SoundTbl_Roar,110,100)
	end
	if key == "scream" then
		VJ_EmitSound(self,self.SoundTbl_Scream,110,100)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/