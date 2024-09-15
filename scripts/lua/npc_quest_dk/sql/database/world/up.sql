SET @ENTRY := 200004;
SET @NAME:= "The Lich King";

INSERT INTO creature_template (entry, difficulty_entry_1,
                               difficulty_entry_2,
                               difficulty_entry_3, KillCredit1,
                               KillCredit2, modelid1, modelid2,
                               modelid3, modelid4, name, subname,
                               IconName, gossip_menu_id, minlevel,
                               maxlevel, exp, faction, npcflag,
                               speed_walk, speed_run, speed_swim,
                               speed_flight, detection_range, scale,
                               `rank`, dmgschool, DamageModifier,
                               BaseAttackTime, RangeAttackTime,
                               BaseVariance, RangeVariance,
                               unit_class, unit_flags, unit_flags2,
                               dynamicflags, family, trainer_type,
                               trainer_spell, trainer_class,
                               trainer_race, type, type_flags,
                               lootid, pickpocketloot, skinloot,
                               PetSpellDataId, VehicleId, mingold,
                               maxgold, AIName, MovementType,
                               HoverHeight, HealthModifier,
                               ManaModifier, ArmorModifier,
                               ExperienceModifier, RacialLeader,
                               movementId, RegenHealth,
                               mechanic_immune_mask,
                               spell_school_immune_mask,
                               flags_extra, ScriptName,
                               VerifiedBuild)
VALUES (@ENTRY, 0, 0, 0, 0, 0, 18718, 0, 0, 0, @NAME, 'Quest Completion', 'Speak', 0,
        80, 80, 2, 35, 1, 1, 1.14286, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1, 1, 1,
        1, 0, 0, 1, 0, 0, 2, '', 12340);

INSERT INTO creature (id1, id2, id3, map, zoneId, areaId,
                      spawnMask, phaseMask, equipment_id,
                      position_x, position_y, position_z,
                      orientation, spawntimesecs, wander_distance,
                      currentwaypoint, curhealth, curmana,
                      MovementType, npcflag, unit_flags,
                      dynamicflags, ScriptName, VerifiedBuild)
VALUES (@ENTRY, 0, 0, 609, 0, 0, 1, 1, 0, 2376, -5650.18, 425.996,
        3.703166, 300, 0, 0, 27890000, 0, 0, 0, 0, 0, '', null);

