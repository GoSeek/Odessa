#Double quotes search locally, single quotes look in libs
require "./playername.rb"

def introscreen
		puts """
		\tOdessa v.2 by Corey Morrison
		\tNeon Llama Interactive
		\t      (C) 2015
		\n
		\n
		\t PRESS ENTER TO BEGIN
		"""
		gets
end

class Engine

	def initialize(scene_map)
	@scene_map = scene_map
	end
	
	def play()
	current_scene = @scene_map.opening_scene()
	last_scene = @scene_map.next_scene('finished')
	
		while current_scene != last_scene
			next_scene_name = current_scene.enter()
			current_scene = @scene_map.next_scene(next_scene_name)
		end
	
	# Be sure to print out the last scene
	current_scene.enter()
	end
end

class Scene
#time not utilized
@@time = Time.now
	def enter()
		puts " "
	exit(1)
	end
end

class Death < Scene

	@@quips = [
		"You're terrible. Like...really bad.",
		"Your mom would be proud...if she were smarter.",
		"Maybe you should stick to FPS games.",
		"Try again...if you dare."
	]

	def enter()
	puts @@quips[rand(0..(@@quips.length - 1))]
	exit(1)
	end
end

class CentralCorridor < Scene
	
	def enter()
	
	msg = "DEPLOYING ORBITAL SPECIALIST #{PlayerName.callplayer}!"
	
		5.times do
		print "\r\t\t#{ msg }"
		sleep 0.25
		print "\r#{ '    ' * msg.length }"
		sleep 0.25
		end
		
	#puts "\nKeep your head down, Orbital Specialist #{PlayerName.callplayer}" 
	puts "\n"
	puts "The gothons of Planet Percal #25 have invaded your ship and destroyed"
	puts "your entire crew. You are the last surviving member and your last"
	puts "mission is to get the neutron destruct bomb from the weapons Armory,"
	puts "put it in the bridge, and blow the ship up after getting into an"
	puts "escape pod."
	puts "\n"
	puts "You're running down the central corridor to the weapons Armory when"
	puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
	puts "flowing around his hate filled body. He's blocking the door to the"
	puts "Armory and about to pull a weapon to blast you."
	puts "OPTIONS: 'dodge!', 'shoot!', 'tell a joke', 'use cloaking device'"
	print ">>>> "
	
	action = $stdin.gets.chomp
	
		if action == "shoot!"
			puts "Quick on the draw, you yank out your blaster and fire it at the"
			puts "Gothon. His clown costume is flowing and moving around his body, which"
			puts "throws off your aim, causing you to miss him entirely."
			puts "You've caused him to go into a furious rage. He blasts you repeatedly"
			puts "in the face. You are dead. But he started eating you before you died."
			return 'death'
		
		elsif action == "dodge!"
			puts "Like a world class boxer, you dodge, weave, slip and slide right"
			puts "as a Gothon Face Scraper Rifle blasts rounds past your head."
			puts "In the middle of you artful dodge, your foot slips and you"
			puts "bang your head on the metal wall and pass out."
			puts "You wake up in excruciating pain, only to realize you're being eaten and most of your lower body is"
			puts "already Gothon lunch."
			return 'death'
			
		elsif action == "tell a joke"
			puts "Lucky for you they made you learn Gothon Humor Tactics in the academy"
			puts "You tell the one Gothon joke you know:\n\n"
			puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf, nebhaq gu ubhfr\n\n"
			puts "The gothon stops, tries not to laugh, thern bursts into a hysterical fit."
			puts "While he's laughing, you run up and put some lead into his brain."
			puts "You jump through the Armory door"
			return 'escape_pod'
		
		elsif action == "use cloaking device"
			puts "Good thing you charged the cloaking device at the space station before you deployed."
			puts "It flickers to life just in time, hiding you from sight as you make a run for it."
			puts "You realize you need to get off of this doomed ship!"
			return 'laser_weapon_armory'
				
		else
			puts "DOES NOT COMPUTE!"
			return 'central_corridor'
		end		
	end
end

class LaserWeaponArmory < Scene

	def enter()
		puts "You do a barrel roll into the weapons Armory, crouch and scan the room"
		puts "for more Gothons that might be hiding. It's dead quiet, toooooo quiet."
		puts "You stand up and run to the far side of the room and find the"
		puts "neutron bomb in its container. There's a keypad lock on the box"
		puts "and you need the code to get the bomb out. If you get the code"
		puts "wrong 10 times then the lock closes forever and you can't get the bomb"
		puts "the code is 2 digits but someone left a fingerprint on the first digit."
		puts "revealing a 1...guess the second digit"
		code = "#{rand(1..6)}"
		print "[keypad]>"
		guess = $stdin.gets.chomp
		guesses = 0
		
		while guess != code && guesses < 10
			puts "BZZZZZZZZZDD!"
			guesses += 1
			print "[keypad]> "
			guess = $stdin.gets.chomp
			end
		if guess == code
			puts "BEEP BEEP! WHOOOOSSHH!"
			puts "The container clicks open and the seal breaks, letting gas out."
			puts "You grab the neutron bomb and run as fast as you can to the"
			puts "bridge where you must place it in the right spot."
			return 'the_bridge'
		else
			puts "The lock buzzes one last time and then you hear a sickening"
			puts "melting sound, as the mechanism is fused together."
			puts "You decide to sit there, and finally pissed off Gothons blow you up."
			return 'death'
		end
	end
end

class TheBridge < Scene

	def enter()
		puts "You burst onto the Bridge with nuetron destruct bomb"
		puts "under your arm and surprise 5 Gothons who are playing Uno."
		puts "Each of their clown costumes is uglier than the last."
		puts "They haven't pulled their weapons out yet, as they see the active bomb under your arm"
		puts "and don't want you to set it off."
		puts "OPTIONS: 'throw the bomb', 'place the bomb'"
		
		action = $stdin.gets.chomp
		
		if action == "throw the bomb"
			puts "In a panic, you throw the bomb at the card game."
			puts "and make a lead for the door. Right as you drop it a"
			puts "Gothon shoots you right in the back, killing you instantly"
			puts "As you die, you see another Gothon frantically try to disarm"
			puts "the bomb. You fade out knowing they're all going to die"
			puts "and that you're better at Uno than any damn Alien."
			return 'death'
		elsif action == "place the bomb"
			puts "You point your blaster at the bomb under your arm."
			puts "and the Gothons put up their hands and start to sweat."
			puts "You inch backward to the door, open it, and then carefully"
			puts "place the bomb on the floor, pointing your blaster at it."
			puts "You then jump back through the door, punch the close button"
			puts "and blast the lock so the Gothons can't get out."
			puts "Now that the bomb is placed, you run for the escape pods."
			puts "to get off this tin can."
			return 'escape_pod'
		else
			puts "DOES NOT COMPUTE"
			return 'the_bridge'
		end
	end
end

class EscapePod < Scene

	def enter()
		puts "You rush through the ship desperately trying to make it to"
		puts "the escape pod before the whole ship explodes. It seems like"
		puts "hardly any Gothons are on the ship, so your run is clear of"
		puts "interference. You get to the chamber with the escape pods, and"
		puts "now you need to pick one to take. Some of them could be damaged."
		puts "but it's impossible to tell from your vantage point. There are 3"
		puts "Which one do you take?"
		
		good_pod = rand(1..3)
		print "[POD #]> "
		guess = $stdin.gets.chomp.to_i
		
		if guess != good_pod
			puts "You jump into POD %s and hit the eject button." % guess
			puts "The pod escape out into the void of space, then"
			puts "implodes as the hull ruptures, crushing your body into jelly."
			return 'death'
		else
			puts "You jump into POD %s and hit the eject button." % guess
			puts "The pod easily slides out into space heading to"
			puts "the planet below. As it flies to the planet, you look"
			puts "back and see your ship implode then explode like a"
			puts "bright star, taking out the Gothon ship at the same"
			puts "time."
			
			return 'finished'
		end
	end
end

class Finished < Scene
	def enter()
		puts "You won! Good job."
	end
end

class Map

	@@scenes = {
		'central_corridor' 			=> CentralCorridor.new(),
		'laser_weapon_armory' 		=> LaserWeaponArmory.new(),
		'the_bridge' 				=> TheBridge.new(),
		'escape_pod' 				=> EscapePod.new(),
		'death' 					=> Death.new(),
		'finished' 					=> Finished.new(),
	}

	def initialize(start_scene)
		@start_scene = start_scene
	end
	
	def next_scene(scene_name)
		val = @@scenes[scene_name]
		return val
	end
	
	def opening_scene()
		return next_scene(@start_scene)
	end
end

introscreen
PlayerName.initialize
a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()