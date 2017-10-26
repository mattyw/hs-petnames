module Lib
    ( generate
    , lengthFilter
    , ubuntu
    , allNames
    , firstLetterFilter
    , randomIdx
    , adjectives
    , adverbs
    , names
    , randomName
    , randomAdverb
    , randomAdjective
    , test
    , newGen
    ) where

import System.Random
import System.Random.Shuffle

adjectives = ["able", "above", "absolute", "accepted", "accurate", "ace", "active", "actual", "adapted", "adapting", "adequate", "adjusted", "advanced", "alert", "alive", "allowed", "allowing", "amazed", "amazing", "ample", "amused", "amusing", "apparent", "apt", "arriving", "artistic", "assured", "assuring", "awaited", "awake", "aware", "balanced", "becoming", "beloved", "better", "big", "blessed", "bold", "boss", "brave", "brief", "bright", "bursting", "busy", "calm", "capable", "capital", "careful", "caring", "casual", "causal", "central", "certain", "champion", "charmed", "charming", "cheerful", "chief", "choice", "civil", "classic", "clean", "clear", "clever", "climbing", "close", "closing", "coherent", "comic", "communal", "complete", "composed", "concise", "concrete", "content", "cool", "correct", "cosmic", "crack", "creative", "credible", "crisp", "crucial", "cuddly", "cunning", "curious", "current", "cute", "daring", "darling", "dashing", "dear", "decent", "deciding", "deep", "definite", "delicate", "desired", "destined", "devoted", "direct", "discrete", "distinct", "diverse", "divine", "dominant", "driven", "driving", "dynamic", "eager", "easy", "electric", "elegant", "emerging", "eminent", "enabled", "enabling", "endless", "engaged", "engaging", "enhanced", "enjoyed", "enormous", "enough", "epic", "equal", "equipped", "eternal", "ethical", "evident", "evolved", "evolving", "exact", "excited", "exciting", "exotic", "expert", "factual", "fair", "faithful", "famous", "fancy", "fast", "feasible", "fine", "finer", "firm", "first", "fit", "fitting", "fleet", "flexible", "flowing", "fluent", "flying", "fond", "frank", "free", "fresh", "full", "fun", "funky", "funny", "game", "generous", "gentle", "genuine", "giving", "glad", "glorious", "glowing", "golden", "good", "gorgeous", "grand", "grateful", "great", "growing", "grown", "guided", "guiding", "handy", "happy", "hardy", "harmless", "healthy", "helped", "helpful", "helping", "heroic", "hip", "holy", "honest", "hopeful", "hot", "huge", "humane", "humble", "humorous", "ideal", "immense", "immortal", "immune", "improved", "in", "included", "infinite", "informed", "innocent", "inspired", "integral", "intense", "intent", "internal", "intimate", "inviting", "joint", "just", "keen", "key", "kind", "knowing", "known", "large", "lasting", "leading", "learning", "legal", "legible", "lenient", "liberal", "light", "liked", "literate", "live", "living", "logical", "loved", "loving", "loyal", "lucky", "magical", "magnetic", "main", "major", "many", "massive", "master", "mature", "maximum", "measured", "meet", "merry", "mighty", "mint", "model", "modern", "modest", "moral", "more", "moved", "moving", "musical", "mutual", "national", "native", "natural", "nearby", "neat", "needed", "neutral", "new", "next", "nice", "noble", "normal", "notable", "noted", "novel", "obliging", "on", "one", "open", "optimal", "optimum", "organic", "oriented", "outgoing", "patient", "peaceful", "perfect", "pet", "picked", "pleasant", "pleased", "pleasing", "poetic", "polished", "polite", "popular", "positive", "possible", "powerful", "precious", "precise", "premium", "prepared", "present", "pretty", "primary", "prime", "pro", "probable", "profound", "promoted", "prompt", "proper", "proud", "proven", "pumped", "pure", "quality", "quick", "quiet", "rapid", "rare", "rational", "ready", "real", "refined", "regular", "related", "relative", "relaxed", "relaxing", "relevant", "relieved", "renewed", "renewing", "resolved", "rested", "rich", "right", "robust", "romantic", "ruling", "sacred", "safe", "saved", "saving", "secure", "select", "selected", "sensible", "set", "settled", "settling", "sharing", "sharp", "shining", "simple", "sincere", "singular", "skilled", "smart", "smashing", "smiling", "smooth", "social", "solid", "sought", "sound", "special", "splendid", "square", "stable", "star", "steady", "sterling", "still", "stirred", "stirring", "striking", "strong", "stunning", "subtle", "suitable", "suited", "summary", "sunny", "super", "superb", "supreme", "sure", "sweeping", "sweet", "talented", "teaching", "tender", "thankful", "thorough", "tidy", "tight", "together", "tolerant", "top", "topical", "tops", "touched", "touching", "tough", "true", "trusted", "trusting", "trusty", "ultimate", "unbiased", "uncommon", "unified", "unique", "united", "up", "upright", "upward", "usable", "useful", "valid", "valued", "vast", "verified", "viable", "vital", "vocal", "wanted", "warm", "wealthy", "welcome", "welcomed", "well", "whole", "willing", "winning", "wired", "wise", "witty", "wondrous", "workable", "working", "worthy"]
adverbs    = ["abnormally", "absolutely", "accurately", "actively", "actually", "adequately", "admittedly", "adversely", "allegedly", "amazingly", "annually", "apparently", "arguably", "awfully", "badly", "barely", "basically", "blatantly", "blindly", "briefly", "brightly", "broadly", "carefully", "centrally", "certainly", "cheaply", "cleanly", "clearly", "closely", "commonly", "completely", "constantly", "conversely", "correctly", "curiously", "currently", "daily", "deadly", "deeply", "definitely", "directly", "distinctly", "duly", "eagerly", "early", "easily", "eminently", "endlessly", "enormously", "entirely", "equally", "especially", "evenly", "evidently", "exactly", "explicitly", "externally", "extremely", "factually", "fairly", "finally", "firmly", "firstly", "forcibly", "formally", "formerly", "frankly", "freely", "frequently", "friendly", "fully", "generally", "gently", "genuinely", "ghastly", "gladly", "globally", "gradually", "gratefully", "greatly", "grossly", "happily", "hardly", "heartily", "heavily", "hideously", "highly", "honestly", "hopefully", "hopelessly", "horribly", "hugely", "humbly", "ideally", "illegally", "immensely", "implicitly", "incredibly", "indirectly", "infinitely", "informally", "inherently", "initially", "instantly", "intensely", "internally", "jointly", "jolly", "kindly", "largely", "lately", "legally", "lightly", "likely", "literally", "lively", "locally", "logically", "loosely", "loudly", "lovely", "luckily", "mainly", "manually", "marginally", "mentally", "merely", "mildly", "miserably", "mistakenly", "moderately", "monthly", "morally", "mostly", "multiply", "mutually", "namely", "nationally", "naturally", "nearly", "neatly", "needlessly", "newly", "nicely", "nominally", "normally", "notably", "noticeably", "obviously", "oddly", "officially", "only", "openly", "optionally", "overly", "painfully", "partially", "partly", "perfectly", "personally", "physically", "plainly", "pleasantly", "poorly", "positively", "possibly", "precisely", "preferably", "presently", "presumably", "previously", "primarily", "privately", "probably", "promptly", "properly", "publicly", "purely", "quickly", "quietly", "radically", "randomly", "rapidly", "rarely", "rationally", "readily", "really", "reasonably", "recently", "regularly", "reliably", "remarkably", "remotely", "repeatedly", "rightly", "roughly", "routinely", "sadly", "safely", "scarcely", "secondly", "secretly", "seemingly", "sensibly", "separately", "seriously", "severely", "sharply", "shortly", "similarly", "simply", "sincerely", "singularly", "slightly", "slowly", "smoothly", "socially", "solely", "specially", "steadily", "strangely", "strictly", "strongly", "subtly", "suddenly", "suitably", "supposedly", "surely", "terminally", "terribly", "thankfully", "thoroughly", "tightly", "totally", "trivially", "truly", "typically", "ultimately", "unduly", "uniformly", "uniquely", "unlikely", "urgently", "usefully", "usually", "utterly", "vaguely", "vastly", "verbally", "vertically", "vigorously", "violently", "virtually", "visually", "weekly", "wholly", "widely", "wildly", "willingly", "wrongly", "yearly"]
names      = ["ox", "ant", "ape", "asp", "bat", "bee", "boa", "bug", "cat", "cod", "cow", "cub", "doe", "dog", "eel", "eft", "elf", "elk", "emu", "ewe", "fly", "fox", "gar", "gnu", "hen", "hog", "imp", "jay", "kid", "kit", "koi", "lab", "man", "owl", "pig", "pug", "pup", "ram", "rat", "ray", "yak", "bass", "bear", "bird", "boar", "buck", "bull", "calf", "chow", "clam", "colt", "crab", "crow", "dane", "deer", "dodo", "dory", "dove", "drum", "duck", "fawn", "fish", "flea", "foal", "fowl", "frog", "gnat", "goat", "grub", "gull", "hare", "hawk", "ibex", "joey", "kite", "kiwi", "lamb", "lark", "lion", "loon", "lynx", "mako", "mink", "mite", "mole", "moth", "mule", "mutt", "newt", "orca", "oryx", "pika", "pony", "puma", "seal", "shad", "slug", "sole", "stag", "stud", "swan", "tahr", "teal", "tick", "toad", "tuna", "wasp", "wolf", "worm", "wren", "yeti", "adder", "akita", "alien", "aphid", "bison", "boxer", "bream", "bunny", "burro", "camel", "chimp", "civet", "cobra", "coral", "corgi", "crane", "dingo", "drake", "eagle", "egret", "filly", "finch", "gator", "gecko", "ghost", "ghoul", "goose", "guppy", "heron", "hippo", "horse", "hound", "husky", "hyena", "koala", "krill", "leech", "lemur", "liger", "llama", "louse", "macaw", "midge", "molly", "moose", "moray", "mouse", "panda", "perch", "prawn", "quail", "racer", "raven", "rhino", "robin", "satyr", "shark", "sheep", "shrew", "skink", "skunk", "sloth", "snail", "snake", "snipe", "squid", "stork", "swift", "swine", "tapir", "tetra", "tiger", "troll", "trout", "viper", "wahoo", "whale", "zebra", "alpaca", "amoeba", "baboon", "badger", "beagle", "bedbug", "beetle", "bengal", "bobcat", "caiman", "cattle", "cicada", "collie", "condor", "cougar", "coyote", "dassie", "donkey", "dragon", "earwig", "falcon", "feline", "ferret", "gannet", "gibbon", "glider", "goblin", "gopher", "grouse", "guinea", "hermit", "hornet", "iguana", "impala", "insect", "jackal", "jaguar", "jennet", "kitten", "kodiak", "lizard", "locust", "maggot", "magpie", "mammal", "mantis", "marlin", "marmot", "marten", "martin", "mayfly", "minnow", "monkey", "mullet", "muskox", "ocelot", "oriole", "osprey", "oyster", "parrot", "pigeon", "piglet", "poodle", "possum", "python", "quagga", "rabbit", "raptor", "rodent", "roughy", "salmon", "sawfly", "serval", "shiner", "shrimp", "spider", "sponge", "tarpon", "thrush", "tomcat", "toucan", "turkey", "turtle", "urchin", "vervet", "walrus", "weasel", "weevil", "wombat", "anchovy", "anemone", "bluejay", "buffalo", "bulldog", "buzzard", "caribou", "catfish", "chamois", "cheetah", "chicken", "chigger", "cowbird", "crappie", "crawdad", "cricket", "dogfish", "dolphin", "firefly", "garfish", "gazelle", "gelding", "giraffe", "gobbler", "gorilla", "goshawk", "grackle", "griffon", "grizzly", "grouper", "haddock", "hagfish", "halibut", "hamster", "herring", "jackass", "javelin", "jawfish", "jaybird", "katydid", "ladybug", "lamprey", "lemming", "leopard", "lioness", "lobster", "macaque", "mallard", "mammoth", "manatee", "mastiff", "meerkat", "mollusk", "monarch", "mongrel", "monitor", "monster", "mudfish", "muskrat", "mustang", "narwhal", "oarfish", "octopus", "opossum", "ostrich", "panther", "peacock", "pegasus", "pelican", "penguin", "phoenix", "piranha", "polecat", "primate", "quetzal", "raccoon", "rattler", "redbird", "redfish", "reptile", "rooster", "sawfish", "sculpin", "seagull", "skylark", "snapper", "spaniel", "sparrow", "sunbeam", "sunbird", "sunfish", "tadpole", "termite", "terrier", "unicorn", "vulture", "wallaby", "walleye", "warthog", "whippet", "wildcat", "aardvark", "airedale", "albacore", "anteater", "antelope", "arachnid", "barnacle", "basilisk", "blowfish", "bluebird", "bluegill", "bonefish", "bullfrog", "cardinal", "chipmunk", "cockatoo", "crayfish", "dinosaur", "doberman", "duckling", "elephant", "escargot", "flamingo", "flounder", "foxhound", "glowworm", "goldfish", "grubworm", "hedgehog", "honeybee", "hookworm", "humpback", "kangaroo", "killdeer", "kingfish", "labrador", "lacewing", "ladybird", "lionfish", "longhorn", "mackerel", "malamute", "marmoset", "mastodon", "moccasin", "mongoose", "monkfish", "mosquito", "pangolin", "parakeet", "pheasant", "pipefish", "platypus", "polliwog", "porpoise", "reindeer", "ringtail", "sailfish", "scorpion", "seahorse", "seasnail", "sheepdog", "shepherd", "silkworm", "squirrel", "stallion", "starfish", "starling", "stingray", "stinkbug", "sturgeon", "terrapin", "titmouse", "tortoise", "treefrog", "werewolf", "woodcock"]
    

type RandomReturn a = (a, StdGen)

-- from https://bartoszmilewski.com/2014/12/23/kleisli-categories/
m1 >=> m2 = \g ->
    let (b, g') = m1 g
        (c, g'') = m2 g'
    in (b++c, g'')

rand':: RandomGen g => [a] -> g -> (a, g)
rand' [] g = error "rand empty list"
rand' ls g = randomIdx g ls

randomName :: RandomGen g => g -> (String, g)
randomName = rand' names

randomAdverb :: RandomGen g => g -> (String, g)
randomAdverb = rand' adverbs

randomAdjective :: RandomGen g => g -> (String, g)
randomAdjective = rand' adjectives

-- sep is implemented just to confirm to the above interface
sep :: RandomGen g => String -> g -> (String, g)
sep str g = (str, g)

newGen :: RandomGen g => Int -> String -> g -> (String, g)
newGen 0 _ = sep ""
newGen 1 _ = randomName
newGen 2 s = randomAdjective >=> sep s >=> randomName
newGen n s = randomAdverb >=> sep s >=> newGen (n-1) s

test :: RandomGen g => g -> (String, g)
test = randomName >=> sep ":" >=> randomAdverb

-- Rewrite based on composition above here


randomIdx :: RandomGen g => g -> [a] -> (a, g)
randomIdx g [] = error "empty list"
randomIdx g ls = (ls !! idx, g')
    where (idx, g') = randomR (0, length ls) g

rand :: RandomGen g => g -> [a] -> (a, g)
rand g [] = error "rand empty list"
rand g ls = randomIdx g ls

allNames :: RandomGen g => g -> String -> [String]
allNames g sep =  shuffle' randomZip (length randomZip) g
    where
        randomNames = shuffle' names (length names) g 
        randomAdv = shuffle' adverbs (length adverbs) g 
        randomAdj = shuffle' adjectives (length adjectives) g 
        randomZip = zipWith3 (\a b c -> a ++ sep ++ b ++ sep ++ c) randomAdv randomAdj randomNames

generate :: RandomGen g => g -> Int -> String -> ([String] -> [String]) -> (String, g)
generate g 0 _ _ = ("", g)
generate g 1 _ f = rand g $ f names
generate g 2 sep f = (adj ++ sep ++ name, g'')
    where
        (adj, g') = rand g $ f adjectives
        (name, g'') = rand g' $ f names
generate g n sep f = gen g n sep f

gen :: RandomGen g => g -> Int -> String -> ([String] -> [String]) -> (String, g)
gen g 2 sep f = (adj ++ sep ++ name, g'')
    where
        (adj, g') = rand g $ f adjectives
        (name, g'') = rand g' $ f names
gen g n sep f = (adv ++ sep ++ t, g'')
    where
        (adv, g') = rand g $ f adverbs
        (t, g'') = gen g' (n-1) sep f

lengthFilter :: Int -> [String] -> [String]
lengthFilter 0 xs = xs
lengthFilter limit xs = filter (\x -> length x <= limit) xs

firstLetterFilter :: Char -> [String] -> [String]
firstLetterFilter c ls = filter (\x -> c == head x) ls

ubuntu :: RandomGen g => g -> String -> ([String] -> [String]) -> (String, g)
ubuntu g sep fltr = generate g' 2 sep (firstLetterFilter letter)
    where
        (letter, g') = randomIdx g "abcdefghijklmnopqrstuvwxyz"
