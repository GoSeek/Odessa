
def intro_screen
	puts '~*' * 40
	puts "\t\t\tODESSA 9-1"
	puts "\t\tThe intergalactic war on alien terrorism!"
	puts "\n\n\t\t(C) 2015 Neon Llama Interactive"
	puts '~*' * 40
	puts "\n\t\t\tPress [ENTER]"
	gets
end

def felix
	puts "O_o <---- FELIX: I am FELIX, your computer-aided combat system."
	puts "    <---- FELIX: Let's kick some Alien butt!"
	puts "\n\t\t\tPress [ENTER]"
	gets
end


def start
	puts "You awaken in a dark corridor. Greasy smoke fills your lungs."
	puts "\nFELIX: SYSTEMS CHECK: ARMOR 0%"
	puts "FELIX: VITALS  CHECK: HEALTH 42%"
	puts "FELIX: YOU ARE BADLY WOUNDED\n\n"
	puts "Through the terrifying haze you see two giant doors."
	puts "One is 'RED'. The other is 'BLACK' and has 'Black Hole' written on it."
	puts " \n* ALIENS SWARMING IN THE DISTANCE * "
	puts "The aliens are coming! Which door do you make your escape from!?"
	print "> "
	choice = $stdin.gets.chomp
	
	if choice.include?("r")
		puts "You drag yourself to the RED door, leaving behind a bloody trail of Alien bait."
		puts "Maybe if you bang on the keypad frantically the door will open!"
		puts "Press enter to bang on the keypad"
		print "> "
		gets
		puts "BEEP"
		puts "FELIX: KEEP TRYING, SPECIALIST!"
		gets
		gets
		puts "FELIX: The systems are going haywire! Keep it up!"
		gets
		gets
		puts "PUT SOME DAMN MUSCLE INTO IT, SPECIALIST!"
		gets
		gets
		gets
		gets
		puts " *BEEP* " * 5
		puts "WHOOSH!"
		armory
	elsif
		choice.include?("b")
		dead("FELIX: That door lead to a black hole...")
	else
		dead("You succumb to ALIEN INSANITY! Next time bring your gas mask.")
	end
end

def dead(why)
	puts why, "\n\nRIP Orbital Specialist."
	puts "GAME OVER"
	points(5)
	exit(0)
end

def dark_room
	puts "Without warning, everything around you disintegrates."
	puts "You re-materialize in a strange dark room.\n"
	puts "-----"
	puts "FELIX: SYSTEMS CHECK: ARMOR 0%"
	puts "FELIX: VITALS  CHECK: 23%"
	puts "FELIX: YOU ARE INCHES FROM DEATH"
	puts "-----\n"
	puts "There are two escape hatches."
	puts "1. Round hatch"
	puts "2. Square hatch"
	choice = $stdin.gets.chomp.to_i
		if choice == 1
			puts "The hatch opens, revealing the dusty alien landscape beyond."
			puts "The familiar sound of Galactic Gunships in the distance fills your ears."
			puts "You pop smoke. You made it, Specialist."
			puts "FELIX: I've sent an HTTP request to the rescue servers with your location."
			puts '~*' * 40
			puts "You saved the world!\n" * 10
			puts '~*' * 40
			points(10)
		else
			dead("The hatch closed on you as you were going through it. You're cut in half.")
		end
end

def armory
	
	shredder = "Alien 'Brain Shredder' Rifle"
	weapon = "standard issue Pulsar Rifle"
	melee = "Brass knuckles"
	puts "This room is long and dark. Along the walls are racks of Alien weaponry"
	puts "Lights flicker, illuminating the other side of the corridor."
	puts "An Alien stands guard in front of the only way out."
	puts "-----"
	puts "1. Arm yourself with #{shredder}."
	puts "2. Arm with your #{weapon}."
	puts "3. You'll take him out with #{melee}."
	puts "-----"
	choice = $stdin.gets.chomp.to_i
		if choice == 1
			shredder_scenario
		elsif choice == 2
			weapon_scenario
		elsif choice == 3
			melee_scenario
		else
			dead("The Alien sees you as you're grabbing for a weapon!")
		end
end


def shredder_scenario
	puts "You reach up for the Brain Shredder. It's much heavier than expected."
	puts "The Alien Neo-Steel is cold to the touch."
	puts "* THUMP THUMP THUMP *"
	puts "FELIX: Specialist, the Alien guard is sensing your movement!"
	puts "FELIX: You need to 'FLEE' or 'FIRE' right now!"
	print "> "
	choice = $stdin.gets.chomp
		if choice.include?("l")
			dead("You cannot take the shame and kill yourself.")
		elsif choice.include?("r")
			shredder_firefight
		else
			dead("An untrained Orbital Soldier. Shameful.")
		end
end

def shredder_firefight
	puts "ZAP! ZAP! ZAP!\n"
	puts "\nThe Brain Shredder rounds tear through the room and cut through the Alien's skull."
	puts "\nYou can smell the burned flesh from your end of the corridor."
	dark_room
end

def weapon_scenario
	puts "You grab for your Pulsar Rifle.\n"
	print "BLAST HIM AWAY! [ENTER]\n"
	print"> "
	gets
	print "BWAP!"
	print"> "
	gets
	print "BWAP!"
	print"> "
	gets
	puts "BWAP!"
	puts "Three rounds, center mass!"
	puts "FELIX: He won't be home for dinner!\n"
	dark_room
end

def melee_scenario
	puts "* HYTERICAL ALIEN LAUGHTER *"
	puts "FELIX: This was a terrible idea, Specialist!"
	puts "ALIEN INSANITY\n" * 30
	dead("You stumble around inside your own mind until you trip on a knife and die.")
end

def points(num)
	points = []
	points.push(num)
		for number in points
		puts "TOTAL POINTS: #{number}"
		end
end

intro_screen
felix
start


