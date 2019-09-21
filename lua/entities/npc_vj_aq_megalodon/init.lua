AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/sharks/megalodon.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.CollisionA = 100
ENT.CollisionB = 200
ENT.CollisionC = -100
ENT.HullType = HULL_LARGE
ENT.Aquatic_AnimTbl_Calm = {ACT_IDLE} -- Animations it plays when it's wandering around while idle
ENT.Aquatic_AnimTbl_Alerted = {ACT_RUN} -- Animations it plays when it's moving while alerted
ENT.Aquatic_SwimmingSpeed_Calm = 80 -- The speed it should swim with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aquatic_SwimmingSpeed_Alerted = 500 -- The speed it should swim with, when it's chasing an enemy, moving away quickly, etc. | Basically running campared to ground SNPCs
ENT.VJ_NPC_Class = {"CLASS_AQUATICS_SHARK"} -- NPCs with the same class with be allied to each other

ENT.MeleeAttackDamage = 35
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB -- Type of Damage
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 500 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 600 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = false

ENT.SoundTbl_Idle = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {}
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/