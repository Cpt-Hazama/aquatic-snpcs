AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/sharks/hammerhead_shark.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.CollisionA = 20
ENT.CollisionB = 30
ENT.CollisionC = -20
ENT.HullType = HULL_LARGE
ENT.Aquatic_AnimTbl_Calm = {ACT_IDLE} -- Animations it plays when it's wandering around while idle
ENT.Aquatic_AnimTbl_Alerted = {ACT_RUN} -- Animations it plays when it's moving while alerted
ENT.Aquatic_SwimmingSpeed_Calm = 75 -- The speed it should swim with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aquatic_SwimmingSpeed_Alerted = 190 -- The speed it should swim with, when it's chasing an enemy, moving away quickly, etc. | Basically running campared to ground SNPCs
ENT.VJ_NPC_Class = {"CLASS_AQUATICS_SHARK"} -- NPCs with the same class with be allied to each other

ENT.MeleeAttackDamage = 35
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB -- Type of Damage
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 50 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 120 -- How far does the damage go?
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