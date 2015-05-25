#Double quotes search locally, single quotes look in libs
require "./playername.rb"
require "./points.rb"
#To be implemented
#require "./scoreboard.rb"

def introscreen
		puts """
		\tOdessa by Corey Morrison
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
	sleep 1.5
	puts "TOTAL POINTS = #{Points.total}"
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
	puts "The Wraiths of Planet Scaldroon have invaded your ship and destroyed"
	sleep 2.5
	puts "your entire crew. You are the last surviving member and your mission"
	sleep 3.5
	puts "is to utilize the last nuclear bomb from the weapons Armory,"
	sleep 3
	puts "to destroy the ship."
	sleep 1
	puts "\n"
	puts "You're running to the weapons Armory when"
	sleep 2.5
	puts "a Wraith jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
	sleep 3.5
	puts "He's blocking the door to the Armory and reaching for his Brain SHredder Rifle.\n\n"
	sleep 3
	puts "OPTIONS: 'dodge!', 'shoot!', 'tell a joke', 'use cloaking device'"
	print ">>>> "
	
	action = $stdin.gets.chomp
	
		if action == "shoot!"
			puts "Quick on the draw, you yank out your Pulsar Rifle and fire it at the"
			sleep 2.5
			puts "Wraith. His clown costume is flowing and moving around his body, which"
			sleep 2.5
			puts "throws off your aim and you miss."
			sleep 2
			puts "He's now in a furious rage. He blasts you repeatedly"
			sleep 2.25
			puts "in the face. You are dead. But he started eating you before you died."
			sleep 2
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'death'
		
		elsif action == "dodge!"
			puts "You dodge as a Wraith Face Scraper Round blasts past your head."
			sleep 2.5
			puts "The ship keels, causing you to fall over and you"
			sleep 2
			puts "bang your head on the metal wall; passing out."
			sleep 2.25
			puts "You wake up in excruciating pain, only to realize you're being eaten."
			sleep 3
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'death'
			
		elsif action == "tell a joke"
			puts "Lucky for you they made you learn Wraith Humor Tactics in the academy"
			sleep 3.5
			puts "You tell the one Wraith joke you know:\n\n"
			sleep 2.5
			puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf, nebhaq gu ubhfr\n\n"
			sleep 3
			puts "The Wraith stops, tries not to laugh, then bursts into a hysterical fit."
			sleep 3.5
			puts "While he's laughing, you run up and put some lead into his brain."
			sleep 3
			puts "You then jump through the Armory door"
			sleep 2
				3.times do Points.addpoint
				end
			puts "3 POINTS GAINED"
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'escape_pod'
		
		elsif action == "use cloaking device"
			puts "Good thing you charged the cloaking device at the space station before you deployed."
			sleep 4
			puts "It flickers to life just in time, hiding you from sight as you make a run for it."
			sleep 3.5
			puts "You realize you need to get off of this doomed ship!"
			sleep 3
				5.times do Points.addpoint
				end
			puts "5 POINTS GAINED"
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'laser_weapon_armory'
				
		else
			puts "DOES NOT COMPUTE!"
			return 'central_corridor'
		end		
	end
end

class LaserWeaponArmory < Scene

	def enter()
		puts "You do a barrel roll into the weapons Armory, then crouch and scan the room"
		sleep 4
		puts "for more Wraiths that might be hiding. It's dead quiet, toooooo quiet.\n\n"
		sleep 4
		puts "You stand up and run to the far side of the room and find the"
		sleep 3.5
		puts "nuclear bomb in its container. There's a keypad lock on the box..."
		sleep 3.5
		puts "If you get the code wrong 10 times then the lock seals forever."
		sleep 3.5
		puts "the code is 2 digits but someone left a fingerprint on the first digit."
		sleep 3.5
		puts "revealing a 1...guess the second digit"
		sleep 3
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
		if guess == code && guesses < 3
			puts "BEEP BEEP! WHOOOOSSHH!"
			sleep 0.5
			puts "The container clicks open and the seal breaks, letting gas out."
			sleep 3
			puts "You grab the nuclear bomb and run as fast as you can to the bridge."
			sleep 3
			puts "5 POINTS GAINED"
				5.times do Points.addpoint
				end
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'the_bridge'
		elsif guess == code && guesses > 3
			puts "BEEP BEEP! WHOOOOSSHH!"
			sleep 0.5
			puts "The container clicks open and the seal breaks, letting gas out."
			sleep 3
			puts "You've wasted valuable time incorrectly guessing the lock code."
			sleep 3
			puts "Now, you can hear Wraiths nearby, taunting you."
			sleep 2.5
			puts "You grab the nuclear bomb and run as fast as you can to the bridge."
			sleep 3
			puts "3 POINTS GAINED"
				3.times do Points.addpoint
				end
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'the_bridge'
		else
			puts "The lock buzzes one last time and then you hear a sickening"
			sleep 2.5
			puts "melting sound, as the mechanism is fused together."
			sleep 2.5
			puts "You decide to sit there, and finally pissed off Wraiths blow you up."
			sleep 2
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'death'
		end
	end
end

class TheBridge < Scene

	def enter()
		puts "You burst onto the Bridge with nuclear bomb"
		sleep 2
		puts "under your arm and surprise 5 Wraiths who are playing Uno."
		sleep 2.5
		puts "Each of their clown costumes is uglier than the last."
		sleep 2
		puts "They haven't pulled their weapons out yet, as they see the active bomb under your arm"
		sleep 4
		puts "and don't want you to set it off."
		sleep 2
		puts "OPTIONS: 'throw the bomb', 'place the bomb'"
		
		action = $stdin.gets.chomp
		
		if action == "throw the bomb"
			puts "In a panic, you throw the bomb at the card game."
			sleep 3.5
			puts "and make a lead for the door. Right as you drop it a"
			sleep 3.5
			puts "Wraith shoots you right in the back, killing you instantly!"
			sleep 3.5
			puts "As you die, you see another Wraith frantically try to disarm"
			sleep 3.5
			puts "the bomb. You fade out knowing they're all going to die"
			sleep 3.5
			puts "and that you're better at Uno than any damn Alien."
			sleep 3
				7.times do Points.addpoint
				end
			puts "\n"
			puts "*" * 10
			puts "'NUMERO UNO' ACHIEVMENT"
			puts "*" * 10
			puts "\n"
			puts "7 POINTS GAINED"
			puts "-" * 10
			puts "\n\n"
			sleep 2
			return 'death'
		elsif action == "place the bomb"
			puts "You point your blaster at the bomb under your arm."
			sleep 4
			puts "and the Wraiths put up their hands and start to sweat."
			sleep 4
			puts "You inch backward to the door, open it, and then carefully"
			sleep 3
			puts "place the bomb on the floor, pointing your blaster at it."
			sleep 4
			puts "You then jump back through the door, punch the close button"
			sleep 4
			puts "and blast the lock so the Wraiths can't get out."
			sleep 4
			puts "Now that the bomb is placed, you run for the escape pods."
			sleep 4
			puts "to get off this tin can."
			sleep 2
				3.times do Points.addpoint
				end
			puts "3 POINTS GAINED"
			puts "-" * 10
			puts "\n\n"
			sleep 2
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
		sleep 3
		puts "the escape pod before the whole ship explodes. It seems like"
		sleep 3
		puts "hardly any Wraiths are on the ship, so your run is clear of"
		sleep 3
		puts "interference. You get to the chamber with the escape pods, and"
		sleep 3
		puts "now you need to pick one to take. Some of them could be damaged."
		sleep 3
		puts "but it's impossible to tell from your vantage point. There are 3"
		sleep 3
		puts "Which one do you take?"
		sleep 1
		
		good_pod = rand(1..3)
		print "[POD #]> "
		guess = $stdin.gets.chomp.to_i
		
		if guess != good_pod
			puts "You jump into POD %s and hit the eject button." % guess
			sleep 3
			puts "The pod shoots out into the void of space, then"
			sleep 3
			puts "implodes and as the hull ruptures, it crushes your body into jelly."
			sleep 3
			puts "-" * 10
			sleep 2
			puts "\n\n"
			return 'death'
		else
			puts "You jump into POD %s and hit the eject button." % guess
			sleep 3
			puts "The pod easily slides out into space heading to"
			sleep 3
			puts "the planet below. As it flies to the planet, you look"
			sleep 3
			puts "back and see your ship implode then explode like a"
			sleep 3
			puts "bright star, taking out the Wraiths on the ship at the same time"
			sleep 3.5
				4.times do Points.addpoint
				end
			puts "4 POINTS GAINED"
			puts "-" * 10
			sleep 2
			puts "\n\n"
			return 'finished'
		end
	end
end

class Finished < Scene
	def enter()
		puts "You won! Good job."
		sleep 1
		puts "TOTAL POINTS = #{Points.total}"
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