// By Foxwells
// Amarok, a big ass wolf from Inuit mythology. Idek. Glacial Rift is depressingly empty
// Since it's a big ass god wolf, it's pretty hard to beat
// Herm, since there's no set gender for it in its mythology
// Comes with a unique bad end if you lose to it too many times, kinda like the Phoenix
// Also: Wolf TF! :D Because like, really, why hasn't that been implemented yet? It could be sooo coool <3

package classes.Scenes.Areas.GlacialRift 
{
	import classes.*;
	import classes.internals.WeightedDrop;
	
	public class Amarok extends Monster
	{
		
		protected function amarokClaw():void {
			//Blind
			if(findStatusEffect(StatusEffects.Blind) >= 0) {
				outputText("The Amarok lunges for you, attempting to slash you with one of its paws, but misses completely due to its blindness.", false);
				combatRoundOver();
				return;
			}
			//Too many things for evasion...
			if(player.findPerk(PerkLib.Evade) >= 0 && player.spe >= 35 && rand(3) != 0) {
				outputText("The Amarok lunges for you, paw ready to strike, but you easily roll out of the way thanks to your talents in evasion.", false);
			}
			else if(player.findPerk(PerkLib.Misdirection) >= 0 && rand(100) < 20 && player.armorName == "red, high-society bodysuit") {
				outputText("Using Raphael's teachings and the movement afforded by your bodysuit, you anticipate and sidestep the Amarok's attempt to claw you.", false);
			}
			else if(player.findPerk(PerkLib.Flexibility) >= 0 && player.spe > 30 && rand(10) != 0) {
				outputText("The Amarok charges at you, attempting to claw you with one of its massive paws. You dodge, using your incredible flexibility to twist out of the way.", false);
			}
			else if (player.getEvasionRoll()) {
				outputText("The Amarok throws itself at you, attempting to slash you with its claws. Luckily, you manage to leap out of the way.");
				combatRoundOver();
				return;
			}
			else {
				//Damage roll
				outputText("The Amarok throws itself at you and rakes one of its hefty paws across you. Its claws slice you open and draw blood.");
				var damage:int = ((str + 50) + rand(100));
				damage = player.reduceDamage(damage)
				player.takeDamage(damage, true);
				if(player.HP <= 0) {
					doNext(game.combat.endHpLoss);
					return;
				}
			}
			combatRoundOver();
		}
		protected function amarokTail():void {
			//AMAROK used TAIL SLAP!
			outputText("The Amarok rushes up to you and immediately turns heel, attempting to crash its tail into you. ");
			//Blind check...
			if(findStatusEffect(StatusEffects.Blind) >= 0) {
				outputText("Luckily, though, its blindness causes it to misjudge your location and it misses entirely.", false);
				combatRoundOver();
				return;
			}
			//Evasion stuffs
			if(player.findPerk(PerkLib.Evade) >= 0 && player.spe >= 35 && rand(3) != 0) {
				outputText("You manage easily jump out of the way due to your talents in evasion.", false);
			}
			else if(player.findPerk(PerkLib.Misdirection) >= 0 && rand(100) < 20 && player.armorName == "red, high-society bodysuit") {
				outputText("However, Raphael's teachings and your bodysuit's flexibility let you get out of the way before it can connect.", false);
			}
			else if(player.findPerk(PerkLib.Flexibility) >= 0 && player.spe > 30 && rand(10) != 0) {
				outputText("You use your incredibly flexibility and twist out of the way of the attack.", false);
			}
			else if (player.getEvasionRoll()) {
				outputText("You jump out of the way before it can hit.");
				combatRoundOver();
				return;
			}
			else {
				//Damageeee + stun! Reference to the legend of it slapping a kid with its tail, except minus the bone breaking.
				outputText("The hit sends you stumbling back");
				if (player.findPerk(PerkLib.Resolute) < 0 && rand(2) == 0) 
				{
					outputText(", stunning you.", false)
					player.createStatusEffect(StatusEffects.Stunned, 0, 0, 0, 0);
				}
				else outputText(".");
				var damage:int = ((str + 100) + rand(75));
				damage = player.reduceDamage(damage)
				player.takeDamage(damage, true);
				if(player.HP <= 0) {
					doNext(game.combat.endHpLoss);
					return;
				}
			}
			combatRoundOver();
		}
		
		override public function defeated(hpVictory:Boolean):void
		{
			game.glacialRift.amarokScene.winAgainstAmarok();
		}
		
		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if(pcCameWorms){
				outputText("\n\nThe Amarok looks down at the worms you came, sniffs them, then snarls and walks away. It must consider you tainted meat.", false);
				doNext(game.combat.cleanupAfterCombat);
			} else {
				game.glacialRift.amarokScene.amarokChowTime();
			}
		}
		
		public function Amarok() 
		{
			this.a = "the ";
			this.short = "Amarok";
			this.imageName = "amarok";
			this.long = "You are fighting an Amarok, a massive wolf that seems set on hunting you. The buffeting snow does nothing to hide its thick, black fur, and hardly manages to even ruffle it. It has golden, hungry eyes that watch your every move and sharp teeth capable of crushing bones. It looms over you in both height and width, with well-defined muscles, long legs, and bulky paws with deadly claws only adding to its intimidating stature. Even its tail looks capable of knocking you down. It's the most normal animal-like creature you've seen here yet, a normal wolf despite its size, but is no less terrifying. You get the feeling this won't be an easy fight, especially considering it's not about to let you run away.";
			this.createCock(8, 1.5, CockTypesEnum.WOLF);
			this.balls = 2;
			this.ballSize = 2;
			this.cumMultiplier = 1;
			this.createVagina(false, 1, 1);
			this.gender = genderless;
			this.pronoun1 = "it";
			this.pronoun2 = "it";
			this.pronoun3 = "its";
			createBreastRow();
			createBreastRow();
			createBreastRow();
			this.ass.analLooseness = ANAL_LOOSENESS_TIGHT;
			this.ass.analWetness = ANAL_WETNESS_DRY;
			this.tallness = 8*12;
			this.hipRating = HIP_RATING_AVERAGE;
			this.buttRating = BUTT_RATING_AVERAGE;
			this.lowerBody = LOWER_BODY_TYPE_WOLF;
			this.skinTone = "black";
			this.skinType = SKIN_TYPE_FUR;
			this.hairColor = "black";
			this.faceType = FACE_WOLF;
			this.earType = EARS_WOLF;
			initStrTouSpeInte(110, 80, 85, 95);
			initLibSensCor(15, 15, 25);
			this.weaponName = "teeth";
			this.weaponVerb="bite";
			this.weaponAttack = 20;
			this.armorName = "thick fur";
			this.armorDef = 15;
			this.bonusHP = 400;
			this.lust = 0;
			this.lustVuln = 0;
			this.temperment = TEMPERMENT_AVOID_GRAPPLES;
			this.level = 22;
			this.gems = 40 + rand(25);
			this.drop = new WeightedDrop(consumables.WOLF_PP);
			this.special1 = amarokClaw;
			this.special2 = amarokTail;
			this.tailType = TAIL_TYPE_WOLF;
			this.createStatusEffect(StatusEffects.GenericRunDisabled, 0, 0, 0, 0);
			//"Watching your movements" alluded to this. Its lore is stalking and hunting people, so I imagine you can't get away.
			//Otherwise I'd suggest doing a hellhound knock-off of the scent tracking.
			checkMonster();
		}
		
	}

}
