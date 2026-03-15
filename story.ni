"Sample" by "Claude Code"

The story headline is "An Interactive Fiction".
The story genre is "Fantasy".
The release number is 1.
The story creation year is 2026.
The story description is "A practice game for learning Inform 7: rooms, objects, and interactions."

Use American dialect.
Use scoring.
The maximum score is 10.

Part 1 - Configuration

Chapter 1 - Bibliographic and Settings

When play begins:
	now the left hand status line is "[the player's surroundings]   Score: [score]/[turn count]";
	now the right hand status line is "".

After printing the banner text:
	say "A practice game for learning Inform 7.[paragraph break]".

Chapter 2 - Score Ranks

Table of Rankings
score	ranking
0	"Beginner"
5	"Explorer"
10	"Winner"

Chapter 3 - Test Commands

[Master test: runs all sub-tests in order, wins the game at the end]
Test me with "test help / test examine / test use / test errors / test synonyms".

[HELP and VERBS commands]
Test help with "help / verbs".

[All examination synonyms on the same object (repeatable)]
Test examine with "examine chandelier / x chandelier / inspect chandelier / study chandelier / view chandelier / peruse chandelier / look at chandelier".

[USE verb handler: redirect message + lockable attempt]
Test use with "use brass key / use brass key on chandelier".

[Improved parser errors: unrecognized verb, missing noun, nonexistent object]
Test errors with "flurble / examine dragon".

[Full walkthrough using ONLY synonym verbs — no standard take/go/look/open/etc.]
Test synonyms with "grab brass key / proceed north / gaze / force journal / lift journal / head south / head east / peer / snag bread / obtain mug / consume bread / toss mug / shove table / yank table / head west / head south / collect rusty coin / head south / prod flat stones / fetch golden ring / head north / head north / proceed north / proceed up / use brass key on wooden cabinet / pry cabinet / steal silver locket".

Part 2 - The World

Chapter 1 - The Entrance Hall

The Entrance Hall is a room. "A grand hall with marble floors and high ceilings. A crystal chandelier hangs overhead. Exits lead north to a library, east to a kitchen, and south to a garden."

The crystal chandelier is scenery in the Entrance Hall. The description is "An ornate chandelier with dozens of sparkling crystals."

A brass key is in the Entrance Hall. The description is "A small brass key with an intricate pattern etched into its handle."

Chapter 2 - The Library

The Library is north of the Entrance Hall. "Tall bookshelves line every wall, crammed with leather-bound volumes. A reading desk sits in the center of the room. A narrow staircase leads up."

The bookshelves are scenery in the Library. The description is "Rows upon rows of old books. Most are too faded to read."

The reading desk is a supporter in the Library. The description is "A sturdy oak desk with a green leather writing surface." It is fixed in place.

A dusty journal is on the reading desk. The description is "A leather-bound journal. The pages are yellowed with age."

Instead of opening the dusty journal:
	say "You flip through the journal. Most entries are illegible, but one page reads: 'The treasure is hidden where water meets stone.'";
	if the dusty journal is not handled:
		increase the score by 2;
		now the dusty journal is handled.

A thing can be handled or unhandled. A thing is usually unhandled.

Chapter 3 - The Study

The Study is up from the Library. "A cozy room at the top of the narrow staircase. A wooden cabinet stands against one wall. The only exit is back down."

The wooden cabinet is a closed openable container in the Study. The description is "A tall cabinet made of dark walnut. It has a small brass lock." It is fixed in place and locked. The brass key unlocks the wooden cabinet.

A silver locket is in the wooden cabinet. The description is "A delicate silver locket on a fine chain. It feels warm to the touch."

After taking the silver locket for the first time:
	say "As you pick up the locket, it glows faintly. You feel a sense of accomplishment.";
	increase the score by 3.

Chapter 4 - The Kitchen

The Kitchen is east of the Entrance Hall. "A rustic kitchen with a stone hearth and a heavy wooden table. The smell of old spices lingers in the air. A doorway leads west back to the hall."

The stone hearth is scenery in the Kitchen. The description is "A large hearth, cold now, with a few charred logs inside."

The wooden table is a supporter in the Kitchen. The description is "A rough-hewn table scarred by years of use." It is fixed in place.

A loaf of bread is on the wooden table. The description is "A somewhat stale loaf of bread. Still edible, probably."
The loaf of bread is edible.

A ceramic mug is on the wooden table. The description is "A plain ceramic mug. It's empty."
The ceramic mug is a container. The carrying capacity of the ceramic mug is 1.

Chapter 5 - The Garden

The Garden is south of the Entrance Hall. "A walled garden overgrown with ivy and wildflowers. A stone fountain stands in the center, dry and cracked. A path continues south to a pond."

The stone fountain is scenery in the Garden. The description is "An old fountain carved with fish and waves. No water flows here anymore."

The ivy is scenery in the Garden. The description is "Thick green ivy covers much of the garden walls."

A rusty coin is in the Garden. The description is "An old coin, green with age. Some kind of face is stamped on one side."

After taking the rusty coin for the first time:
	say "You brush off the grime. Despite its age, the coin has a satisfying weight.";
	increase the score by 2.

Chapter 6 - The Pond

The Pond is south of the Garden. "A small, murky pond surrounded by reeds and flat stones. The water is still and dark. The garden lies back to the north."

The reeds are scenery in the Pond. The description is "Tall reeds swaying slightly, even though there is no wind."

The flat stones are scenery in the Pond. The description is "Smooth, flat stones line the edge of the pond. One of them looks loose."

Understand "stone" and "stones" and "rock" and "rocks" as the flat stones.

A golden ring is nowhere. The description is "A simple gold band that gleams even in dim light."

Instead of pushing the flat stones:
	if the golden ring is nowhere:
		now the golden ring is in the Pond;
		say "You push aside one of the loose stones and discover a golden ring hidden beneath it!";
		increase the score by 3;
	otherwise:
		say "You already found what was hidden here."

Part 3 - Verb Help System

Chapter 1 - Enhanced Parser Errors

Rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	say "I don[apostrophe]t know that command. Type VERBS for a list, or try simpler phrasing like VERB NOUN."

Rule for printing a parser error when the latest parser error is the didn't understand error:
	say "I understood some words but not the whole command. Try: VERB NOUN (e.g., TAKE KEY, OPEN DOOR)."

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "You don[apostrophe]t see that here. Try LOOK to see what[apostrophe]s around, or INVENTORY to check what you carry."

Rule for printing a parser error when the latest parser error is the said too little error:
	say "That command needs more detail. Try VERB NOUN (e.g., EXAMINE TABLE, not just EXAMINE)."

Rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "I only understood part of that. Try rephrasing with a simpler command."

Chapter 2 - Help and Verbs Commands

Requesting the verb list is an action out of world applying to nothing.
Understand "verbs" and "commands" as requesting the verb list.

Carry out requesting the verb list:
	say "Movement:  NORTH (N), SOUTH (S), EAST (E), WEST (W), UP (U), DOWN (D), IN, OUT[line break]";
	say "Looking:   LOOK (L), EXAMINE (X) thing, SEARCH thing, LOOK IN/UNDER thing[line break]";
	say "Taking:    TAKE thing, DROP thing, PUT thing IN/ON thing, GIVE thing TO person[line break]";
	say "Using:     OPEN, CLOSE, LOCK/UNLOCK thing WITH key, PUSH, PULL, TURN ON/OFF[line break]";
	say "Talking:   ASK person ABOUT topic, TELL person ABOUT topic, SAY [quotation mark]text[quotation mark][line break]";
	say "Self:      INVENTORY (I), WAIT (Z), WEAR thing, EAT/DRINK thing[line break]";
	say "Meta:      SAVE, RESTORE, UNDO, SCORE, HELP, VERBS, RESTART, QUIT".

Requesting help is an action out of world applying to nothing.
Understand "help" and "hint" and "hints" as requesting help.

Carry out requesting help:
	say "This is a text adventure. Type commands in plain English.[line break]";
	say "Most puzzles can be solved with simple two-word commands: VERB NOUN.[line break]";
	say "Type VERBS for a full list of available commands.[line break]";
	say "Type LOOK to see your surroundings. Type INVENTORY (or I) to check what you carry."

Chapter 3 - Common Synonyms

[Examination — standard has: examine, x, look at, read, watch]
Understand the command "inspect" as "examine".
Understand the command "study" as "examine".
Understand the command "view" as "examine".
Understand the command "peruse" as "examine".

[Taking — standard has: take, get, pick up, carry]
Understand the command "grab" as "take".
Understand the command "collect" as "take".
Understand the command "acquire" as "take".
Understand the command "snag" as "take".
Understand the command "fetch" as "take".
Understand the command "obtain" as "take".
Understand the command "steal" as "take".
Understand the command "nab" as "take".
Understand the command "lift" as "take".

[Combat — standard has: attack, hit, fight, punch, kill, smash, break, etc.]
Understand the command "strike" as "attack".
Understand the command "stab" as "attack".
Understand the command "slash" as "attack".
Understand the command "kick" as "attack".

[Looking — standard has: look, l]
Understand the command "peek" as "look".
Understand the command "peer" as "look".
Understand the command "gaze" as "look".

[Going — standard has: go + compass directions]
Understand the command "proceed" as "go".
Understand the command "head" as "go".

[Opening — standard has: open, uncover, unwrap]
Understand the command "pry" as "open".
Understand the command "force" as "open".

[Dropping — standard has: drop, throw, discard]
Understand the command "toss" as "drop".

[Putting — standard has: put, insert]
Understand the command "place" as "put".

[Pushing — standard has: push, move, shift, clear, press]
Understand the command "shove" as "push".
Understand the command "prod" as "push".

[Pulling — standard has: pull, drag]
Understand the command "yank" as "pull".

[Eating — standard has: eat]
Understand the command "consume" as "eat".
Understand the command "devour" as "eat".

[Communication — specific patterns for natural phrasing]
Understand "talk to [someone] about [text]" as asking it about.
Understand "speak to [someone] about [text]" as asking it about.
Understand "chat with [someone] about [text]" as asking it about.
Understand "talk to [someone]" as a mistake ("To talk, try ASK person ABOUT topic or TELL person ABOUT topic.").
Understand "speak to [someone]" as a mistake ("To talk, try ASK person ABOUT topic or TELL person ABOUT topic.").
Understand "chat with [someone]" as a mistake ("To talk, try ASK person ABOUT topic or TELL person ABOUT topic.").

Chapter 4 - USE Verb Handler

[USE is the most common unrecognized verb in parser IF.]
[Players from point-and-click games instinctively type USE.]

Generically-using is an action applying to one thing.
Understand "use [something]" as generically-using.

Check generically-using:
	say "How do you want to use [the noun]? Try a specific verb: OPEN, PUSH, PULL, TURN, EAT, WEAR, etc." instead.

Generically-using it with is an action applying to two things.
Understand "use [something] on [something]" as generically-using it with.
Understand "use [something] with [something]" as generically-using it with.

Carry out generically-using it with:
	if the second noun is lockable:
		try unlocking the second noun with the noun;
	otherwise:
		say "Try a specific command, such as PUT [the noun] ON [the second noun] or GIVE [the noun] TO [the second noun]."

Part 4 - Winning

Every turn:
	if the score is 10:
		say "[line break][bold type]Congratulations![roman type] You have found all the secrets of this place. You win!";
		end the story finally saying "You have won".
