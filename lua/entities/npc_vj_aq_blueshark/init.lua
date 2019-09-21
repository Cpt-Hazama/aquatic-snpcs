AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/sharks/blue_shark.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50
ENT.CollisionA = 40
ENT.CollisionB = 20
ENT.CollisionC = -20
ENT.HullType = HULL_LARGE
ENT.Aquatic_AnimTbl_Calm = {ACT_IDLE} -- Animations it plays when it's wandering around while idle
ENT.Aquatic_AnimTbl_Alerted = {ACT_RUN} -- Animations it plays when it's moving while alerted
ENT.Aquatic_SwimmingSpeed_Calm = 80 -- The speed it should swim with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aquatic_SwimmingSpeed_Alerted = 280 -- The speed it should swim with, when it's chasing an enemy, moving away quickly, etc. | Basically running campared to ground SNPCs
ENT.VJ_NPC_Class = {"CLASS_AQUATICS_SHARK"} -- NPCs with the same class with be allied to each other

ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB -- Type of Damage
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 100 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 150 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = false

ENT.SoundTbl_Idle = {"common/null.wav"}
ENT.SoundTbl_Alert = {"common/null.wav"}
ENT.SoundTbl_CombatIdle = {"common/null.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"common/null.wav"}
ENT.SoundTbl_Pain = {"common/null.wav"}
ENT.SoundTbl_Death = {"common/null.wav"}
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/