DROP TABLE IF EXISTS `mod_ptrtemplate_achievements`;
DROP TABLE IF EXISTS `mod_ptrtemplate_action`;
DROP TABLE IF EXISTS `mod_ptrtemplate_index`;
DROP TABLE IF EXISTS `mod_ptrtemplate_inventory`;
DROP TABLE IF EXISTS `mod_ptrtemplate_quests`;
DROP TABLE IF EXISTS `mod_ptrtemplate_reputations`;
DROP TABLE IF EXISTS `mod_ptrtemplate_skills`;
DROP TABLE IF EXISTS `mod_ptrtemplate_spells`;

DELETE FROM `command` WHERE `name` IN ('template apply', 'template disable', 'template enable', 'template list');
DELETE FROM `npc_vendor` WHERE `entry` IN (32753, 32754, 32755, 32756, 32757, 32758, 32759, 32760, 32761, 32762, 199387);

SET
@entry = 184320, -- Blizzlike
@guid = 4000000, -- ¯\_(ツ)_/¯
@text = 64000, -- ¯\_(ツ)_/¯
@menu = 27525; -- Blizzlike (I think)

DELETE FROM `creature_template` WHERE `entry` = @entry;

SET
@entry = 184320;

DELETE FROM `npc_vendor` WHERE `entry` = @entry;

SET @string = 40000;

DELETE FROM `acore_string` WHERE `entry` BETWEEN @string AND @string+15;

SET
@guid = 4000002;

DELETE FROM `creature_template` WHERE `entry` IN (32753, 32754, 32755, 32756, 32757, 32758, 32759, 32760, 32761, 32762, 199387);
DELETE FROM `creature` WHERE `id1` IN (32753, 32754, 32755, 32756, 32757, 32758, 32759, 32760, 32761, 32762, 199387);

