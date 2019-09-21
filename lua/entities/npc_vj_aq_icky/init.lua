AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/ichthyosaur.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.CollisionA = 40
ENT.CollisionB = 40
ENT.CollisionC = -35
ENT.HullType = HULL_LARGE
ENT.Aquatic_SwimmingSpeed_Calm = 350 -- The speed it should swim with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aquatic_SwimmingSpeed_Alerted = 350 -- The speed it should swim with, when it's chasing an enemy, moving away quickly, etc. | Basically running campared to ground SNPCs
ENT.Aquatic_AnimTbl_Calm = {ACT_RUN} -- Animations it plays when it's wandering around while idle
ENT.Aquatic_AnimTbl_Alerted = {ACT_RUN} -- Animations it plays when it's moving while alerted
ENT.VJ_NPC_Class = {"CLASS_XEN"} -- NPCs with the same class with be allied to each other
ENT.Bleeds = false
ENT.BloodEfColor = Color(100,0,0)
ENT.BloodScale = 40

ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDamage = 48
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB -- Type of Damage
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 50 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 120 -- How far does the damage go?
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.TurningUseAllAxis = true -- If set to true, angles will not be restricted to y-axis, it will change all axes (plural axis)
ENT.MovementType = VJ_MOVETYPE_AQUATIC -- How does the SNPC move?
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.GeneralSoundPitch1 = 100
ENT.IdleAlwaysWander = true
ENT.AA_ConstantlyMove = true
ENT.HungerDrainTime = 5
ENT.HungerGainAmount = 15
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Collision()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(self.CollisionA,self.CollisionA,self.CollisionB), Vector(-self.CollisionA,-self.CollisionA,self.CollisionC))
	self.HungerLevel = 100
	self.IsAngered = false
	self.NextAngerT = CurTime()
	self.NextHungerT = CurTime() +self.HungerDrainTime
	self.OriginalClass = self.VJ_NPC_Class
	if self:GetModel() == "models/ichthyosaur.mdl" then
		self.SoundTbl_Idle = {"vj_hlr/hl1_npc/ichy/ichy_idle1.wav","vj_hlr/hl1_npc/ichy/ichy_idle2.wav","vj_hlr/hl1_npc/ichy/ichy_idle3.wav","vj_hlr/hl1_npc/ichy/ichy_idle4.wav"}
		self.SoundTbl_Alert = {"vj_hlr/hl1_npc/ichy/ichy_alert1.wav","vj_hlr/hl1_npc/ichy/ichy_alert2.wav","vj_hlr/hl1_npc/ichy/ichy_alert3.wav"}
		self.SoundTbl_CombatIdle = {"vj_hlr/hl1_npc/ichy/ichy_alert1.wav","vj_hlr/hl1_npc/ichy/ichy_alert2.wav","vj_hlr/hl1_npc/ichy/ichy_alert3.wav"}
		self.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hl1_npc/ichy/ichy_attack1.wav","vj_hlr/hl1_npc/ichy/ichy_attack2.wav"}
		self.SoundTbl_MeleeAttack = {"vj_hlr/hl1_npc/ichy/ichy_bite1.wav","vj_hlr/hl1_npc/ichy/ichy_bite2.wav"}
		self.SoundTbl_Pain = {"vj_hlr/hl1_npc/ichy/ichy_pain1.wav","vj_hlr/hl1_npc/ichy/ichy_pain2.wav","vj_hlr/hl1_npc/ichy/ichy_pain3.wav","vj_hlr/hl1_npc/ichy/ichy_pain5.wav"}
		self.SoundTbl_Death = {"vj_hlr/hl1_npc/ichy/ichy_die1.wav","vj_hlr/hl1_npc/ichy/ichy_die2.wav","vj_hlr/hl1_npc/ichy/ichy_die3.wav","vj_hlr/hl1_npc/ichy/ichy_die4.wav"}
		self.TimeUntilMeleeAttackDamage = 1
		self.HungerGainAmount = 8
		self.HungerDrainTime = 3
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoKilledEnemy(argent,attacker,inflictor)
	self.HungerLevel = self.HungerLevel +math.random(self.HungerGainAmount -3,self.HungerGainAmount +3)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimalBehavior(beh)
	if self.IsAngered then
		self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
		return
	end
	self.Behavior = beh
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if CurTime() > self.NextHungerT then
		self.HungerLevel = self.HungerLevel -1
		if self.HungerLevel < 0 then
			self.HungerLevel = 0
		end
		self.NextHungerT = CurTime() +self.HungerDrainTime
	end
	if self.HungerLevel >= 50 then
		self:SetAnimalBehavior(VJ_BEHAVIOR_PASSIVE_NATURE)
	else
		self:SetAnimalBehavior(VJ_BEHAVIOR_AGGRESSIVE)
		if self.HungerLevel <= 10 then
			self.VJ_NPC_Class = {"CLASS_AQUATIC_STARVED_" .. math.random(1,999999999)}
		else
			self.VJ_NPC_Class = self.OriginalClass
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	local bloodeffect = EffectData()
	bloodeffect:SetOrigin(dmginfo:GetDamagePosition())
	bloodeffect:SetColor(VJ_Color2Byte(self.BloodEfColor))
	bloodeffect:SetScale(self.BloodScale)
	util.Effect("VJ_Blood1",bloodeffect)
	
	if self:Health() > math.Round(self:GetMaxHealth() *0.35) then
		if !self.IsAngered && CurTime() > self.NextAngerT && self.Behavior != VJ_BEHAVIOR_AGGRESSIVE then
			self.IsAngered = true
			self:SetAnimalBehavior(VJ_BEHAVIOR_AGGRESSIVE)
			timer.Simple(10,function() if IsValid(self) then self.NextAngerT = CurTime() +math.Rand(4,6); self.IsAngered = false; self:SetAnimalBehavior(VJ_BEHAVIOR_PASSIVE_NATURE) end end)
		end
	else
		// Run away
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/