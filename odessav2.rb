
#To be implemented:
#-----------------------
###Create flashing function in Support
#Scoreboard functionality


module Tracking

	attr_accessor :name, :score
	@score = []
	
	def Tracking.initialize
		puts "\t\tWhat is your last name, Specialist?"
		name = $stdin.gets.chomp
		@playername = name
	end
	
	
	def Tracking.callplayer
		@playername.upcase
	end
	
	
	def Tracking.addpoint(n)
		@score.push(n)
	end
	
	def Tracking.total
		if @score.empty?
			return 0
		else
			@score.inject(:+)
		end
	end
end

module Support

	#This is to keep the script clean. It sleeps 'str', 'n' seconds.
	def Support.z(n, str)
		puts "#{str}"
		sleep n
	end
	
	#This is to keep the script clean. It blinks 'msg', 'n' times, at 'i' seconds each.
	def Support.bl(i, n, msg)
		msg = msg
		n.times do
		print "\r\t\t#{ msg }"
		sleep i
		print "\r#{ '    ' * msg.length }"
		sleep i
		end
	end
	
end

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
	Support.z(1.5, @@quips[rand(0..(@@quips.length - 1))])
	Support.bl(0.35, 4, "TOTAL POINTS = #{Tracking.total}")
	exit(1)
	end
end

class CentralCorridor < Scene
	
	def enter()
	
	Support.bl(0.25, 5, "DEPLOYING ORBITAL SPECIALIST #{Tracking.callplayer}!")
	puts "\n"
	Support.z(2.5, "The Wraiths of Planet Scaldroon have invaded your ship and destroyed")
	Support.z(3.5,"your entire crew. You are the last surviving member and your mission")
	Support.z(3, "is to utilize the last nuclear bomb from the weapons Armory,")
	Support.z(1, "to destroy the ship.")
	puts "\n"
	Support.z(2.5, "You're running to the weapons Armory when")
	Support.z(3.5, "a Wraith jumps out, red scaly skin, dark grimy teeth, and evil clown costume")
	Support.z(3, "He's blocking the door to the Armory and reaching for his Brain Shredder Rifle.\n\n")
	Support.z(0.5, "OPTIONS: 'dodge!', 'shoot!', 'tell a joke', 'use cloaking device'")
	print ">>>> "
	
	action = $stdin.gets.chomp
	
		if action == "shoot!"
			Support.z(3, "Quick on the draw, you yank out your Pulsar Rifle and fire it at the")
			Support.z(3, "Wraith. His clown costume is flowing and moving around his body, which")
			Support.z(2, "throws off your aim and you miss.")
			Support.z(2.25, "He's now in a furious rage. He blasts you repeatedly")
			Support.z(2, "in the face. You are dead. But he started eating you before you died.")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'finished'
		
		elsif action == "dodge!"
			Support.z(2.6, "You dodge as a Wraith Face Scraper Round blasts past your head.")
			Support.z(2.25, "The ship keels, causing you to fall over and you")
			Support.z(2.25, "bang your head on the metal wall; passing out.")
			Support.z(3, "You wake up in excruciating pain, only to realize you're being eaten.")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'death'
			
		elsif action == "tell a joke"
			Support.z(3.5, "Lucky for you they made you learn Wraith Humor Tactics in the academy")
			Support.z(2.5, "You tell the one Wraith joke you know:\n\n")
			Support.z(3.25, "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf, nebhaq gu ubhfr\n\n")
			Support.z(3.5, "The Wraith stops, tries not to laugh, then bursts into a hysterical fit.")
			Support.z(3, "While he's laughing, you run up and put some lead into his brain.")
			Support.z(2, "You then jump through the Armory door")
			Tracking.addpoint(3)
			Support.z(1, "3 POINTS GAINED")
			puts "-" * 10
			Support.z(2.5, "\n\n")
			return 'escape_pod'
		
		elsif action == "use cloaking device"
			Support.z(4, "Good thing you charged the cloaking device at the space station before you deployed.")
			Support.z(3.5, "It flickers to life just in time, hiding you from sight as you make a run for it.")
			Support.z(3, "You realize you need to get off of this doomed ship!")
			Tracking.addpoint(5)
			Support.z(1, "5 POINTS GAINED")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'laser_weapon_armory'
				
		else
			puts "DOES NOT COMPUTE!"
			return 'central_corridor'
		end		
	end
end

class LaserWeaponArmory < Scene

	def enter()
		Support.z(4, "You do a barrel roll into the weapons Armory, then crouch and scan the room")
		Support.z(4, "for more Wraiths that might be hiding. It's dead quiet, toooooo quiet.\n\n")
		Support.z(3.5, "You stand up and run to the far side of the room and find the")
		Support.z(3.5, "nuclear bomb in its container. There's a keypad lock on the box...")
		Support.z(3.5, "If you get the code wrong 10 times then the lock seals forever.")
		Support.z(3.5, "the code is 2 digits but someone left a fingerprint on the first digit.")
		Support.z(3, "revealing a 1...guess the second digit")
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
			Support.z(3, "The container clicks open and the seal breaks, letting gas out.")
			Support.z(3, "You grab the nuclear bomb and run as fast as you can to the bridge.")
			Support.z(1, "5 POINTS GAINED")
			Tracking.addpoint(5)
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'the_bridge'
		elsif guess == code && guesses > 3
			puts "BEEP BEEP! WHOOOOSSHH!"
			Support.z(3, "The container clicks open and the seal breaks, letting gas out.")
			Support.z(3, "You've wasted valuable time incorrectly guessing the lock code.")
			Support.z(2.5, "Now, you can hear Wraiths nearby, taunting you.")
			Support.z(3, "You grab the nuclear bomb and run as fast as you can to the bridge.")
			Support.z(1, "3 POINTS GAINED")
			Tracking.addpoint(3)
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'the_bridge'
		else
			Support.z(2.5, "The lock buzzes one last time and then you hear a sickening")
			Support.z(2.5, "melting sound, as the mechanism is fused together.")
			Support.z(2, "You decide to sit there, and finally pissed off Wraiths blow you up.")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'death'
		end
	end
end

class TheBridge < Scene

	def enter()
		Support.z(2, "You burst onto the Bridge with nuclear bomb")
		Support.z(2.5, "under your arm and surprise 5 Wraiths who are playing Uno.")
		Support.z(3, "Each of their clown costumes is uglier than the last.")
		Support.z(4, "They haven't pulled their weapons out yet, as they see the active bomb under your arm")
		Support.z(2, "and don't want you to set it off.")
		puts "OPTIONS: 'throw the bomb', 'place the bomb'"
		
		action = $stdin.gets.chomp
		
		if action == "throw the bomb"
			Support.z(3.5, "In a panic, you throw the bomb at the card game.")
			Support.z(3.5, "and make a lead for the door. Right as you drop it a")
			Support.z(3.5, "Wraith shoots you right in the back, killing you instantly!")
			Support.z(3.5, "As you die, you see another Wraith frantically try to disarm")
			Support.z(3.5, "the bomb. You fade out knowing they're all going to die")
			Support.z(3, "and that you're better at Uno than any damn Alien.")
			Tracking.addpoint(7)
			puts "\n"
			puts "*" * 10
			Support.bl(0.25, 3, "'NUMERO UNO' ACHIEVMENT")
			puts "*" * 10
			puts "\n"
			Support.z(1, "7 POINTS GAINED")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'death'
		elsif action == "place the bomb"
			Support.z(4, "You point your blaster at the bomb under your arm.")
			Support.z(4, "and the Wraiths put up their hands and start to sweat.")
			Support.z(3, "You inch backward to the door, open it, and then carefully")
			Support.z(4, "place the bomb on the floor, pointing your blaster at it.")
			Support.z(4, "You then jump back through the door, punch the close button")
			Support.z(4, "and blast the lock so the Wraiths can't get out.")
			Support.z(4, "Now that the bomb is placed, you run for the escape pods.")
			Support.z(2, "to get off this tin can.")
			Tracking.addpoint(3)
			Support.z(1, "3 POINTS GAINED")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'escape_pod'
		else
			puts "DOES NOT COMPUTE"
			return 'the_bridge'
		end
	end
end

class EscapePod < Scene

	def enter()
		Support.z(3, "You rush through the ship desperately trying to make it to")
		Support.z(3, "the escape pod before the whole ship explodes. It seems like")
		Support.z(3, "hardly any Wraiths are on the ship, so your run is clear of")
		Support.z(3, "interference. You get to the chamber with the escape pods, and")
		Support.z(3, "now you need to pick one to take. Some of them could be damaged.")
		Support.z(3, "but it's impossible to tell from your vantage point. There are 3")
		Support.z(1, "Which one do you take?")
		
		good_pod = rand(1..3)
		print "[POD #]> "
		guess = $stdin.gets.chomp.to_i
		
		if guess != good_pod
			Support.z(3, "You jump into POD %s and hit the eject button." % guess)
			Support.z(3, "The pod shoots out into the void of space, then")
			Support.z(3, "implodes and as the hull ruptures, it crushes your body into jelly.")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'death'
		else
			Support.z(3, "You jump into POD %s and hit the eject button." % guess)
			Support.z(3, "The pod easily slides out into space heading to")
			Support.z(3, "the planet below. As it flies to the planet, you look")
			Support.z(3, "back and see your ship implode then explode like a")
			Support.z(3.5, "bright star, taking out the Wraiths on the ship at the same time")
			Tracking.addpoint(4)
			Support.z(1, "4 POINTS GAINED")
			puts "-" * 10
			Support.z(2, "\n\n")
			return 'finished'
		end
	end
end

class Finished < Scene
	def enter()
		puts "You won! Good job."
		sleep 1
		Support.bl(0.35, 4, "TOTAL POINTS = #{Tracking.total}")
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
Tracking.initialize
a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()