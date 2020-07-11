struct DefaultHero: Hero {
    var race: String  = "Random Race"

    var energy: Int = 5
    var lifePoitns: Int = 7

    var weapon: Weapon?  = nil
    var armor: Armor? = nil
   
    init(){}
    
    init(race: String, energy: Int, lifePoints: Int, weapon: Weapon?, armor: Armor?) {
        self.race = race
        self.energy = energy 
        self.lifePoitns = lifePoints
        self.weapon = weapon
        self.armor = armor
    }
}

struct NoArmor: Armor {
    var attack: Int = 0
    var defence: Int = 0
}

struct WoodenStick: Weapon {
    var attack: Int = 2
    var defence: Int = 1
}
//not done yet
//weapon for DragonBorn
struct AcidBreathWeapon: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}
//weapon for Dwarf
struct DwarvenAxe: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}
//weapon for Elf
struct MaglorKnives: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}

//weapon for Gnome
struct QuickRazor: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}
//weapon for HalfElf
struct SorcererssStaff: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}

//weapon for Halfling
struct LightCrossBow: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}

//weapon for HalfOrc
struct PainOfGodnessSword: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}

//weapon for Human
struct Rapier: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}

//weapon for Tiefling 
struct ThePoisonousRanseur: Weapon{
    var attack: Int = 1
    var defence: Int = 1
}

//armor for DragonBorn 
struct StuddedCuirass: Armor{
   
    var attack: Int = 0
    var defence: Int = 32
}
//armor for Dwarf
struct DwarvenPlate: Armor{
    //padded armour + ring mail 
    var attack: Int = 0
    var defence: Int = 25
}
//armor for Elf
struct ElvenChain: Armor{
    //leather armour + chain mail
    var attack: Int = 0
    var defence: Int = 27
}
//armor for Gnome
struct TwistCloth: Armor{
    var attack: Int = 0
    var defence: Int = 18
}
//armor for HalfElf
struct ClothesOfTheSpirit: Armor{
    var attack: Int = 0
    var defence: Int = 26
}
//armor for Halfling
struct RobeOfCalm: Armor{
    var attack: Int = 0
    var defence: Int = 15
}
//armor for HalfOrc
struct HempClothes: Armor{
    var attack: Int = 0
    var defence: Int = 20
}
//armor for Human
struct MithrilCloak: Armor{
    var attack: Int = 0
    var defence: Int = 30
}
//armor for Tiefling
struct TieflingCraftedArmor: Armor{
    var attack: Int = 0
    var defence: Int = 22
}
//not done ^

class DefaultPlayer: Player {
    var name: String = "Default Player"
    var hero: Hero = DefaultHero()
    var isAlive: Bool  = true
}

struct DefaultPlayerGenerator: PlayerGenerator {
    var heroGenerator: HeroGenerator
    init(heroGenerator: HeroGenerator) {
        self.heroGenerator = heroGenerator
    }
    
    func generatePlayer(name: String) -> Player {
        var player = DefaultPlayer()
        player.name = name
        player.hero = heroGenerator.getRandom()
        return player
    }
}

struct DefaultHeroGenerator: HeroGenerator {
    func getRandom() -> Hero {
        //changing the implemenation 
        //not finished
        let gettingRandomRace = Int.random(in: 1...9)
            var race: String
            var energy: Int
            var lifePoints: Int
            var weapon: Weapon?
            var armor: Armor?

            switch gettingRandomRace{
                case 1:
                    race = "Dragon Born"
                    energy = 1
                    lifePoints = 10
                    weapon = AcidBreathWeapon()
                    armor = StuddedCuirass()
                case 2:
                    race = "Dwarf"
                    energy = 2
                    lifePoints = 20
                    weapon = DwarvenAxe()
                    armor = DwarvenPlate()
                case 3: 
                    race = "Elf"
                    energy = 3
                    lifePoints = 30
                    weapon = MaglorKnives()
                    armor = ElvenChain()
                case 4:
                    race = "Gnome"
                    energy = 4
                    lifePoints = 40
                    weapon = QuickRazor()
                    armor = TwistCloth()
                case 5:
                    race = "Half-Elf"
                    energy = 5
                    lifePoints = 50
                    weapon = SorcererssStaff()
                    armor = ClothesOfTheSpirit()
                case 6:
                    race = "Halfling"
                    energy = 6
                    lifePoints = 60
                    weapon = LightCrossBow()
                    armor = RobeOfCalm()
                case 7:
                    race = "Half-Orc"
                    energy = 7
                    lifePoints = 70
                    weapon = PainOfGodnessSword()
                    armor = HempClothes()
                case 8:
                    race = "Human"
                    energy = 8
                    lifePoints = 80
                    weapon = Rapier()
                    armor = MithrilCloak()
                case 9:
                    race = "Tiefling"
                    energy = 9
                    lifePoints = 90
                    weapon = ThePoisonousRanseur()
                    armor = TieflingCraftedArmor()
                default:
                    race = "No race!"
                    energy = 0
                    lifePoints = 0
                    weapon = WoodenStick()
                    armor = NoArmor()
            }
        //promeni
        return DefaultHero(race: race, energy: energy, lifePoints: lifePoints, weapon: weapon, armor: armor)
    }
}

struct DefaultMapGenerator : MapGenerator {
    func generate(players: [Player]) -> Map {
        return DefaultMap(players: players)
    }
}
class DefaultMapTile: MapTile {
    var type: MapTileType
    var state: String
    
    init(type: MapTileType) {
        self.type = type
        state = ""
    }
}

class DefaultMap : Map {
    required init(players: [Player]) {
        self.players = players
    }

    var players: [Player]
    var maze: [[MapTile]] = [
        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
        
        [DefaultMapTile(type: .wall), DefaultMapTile(type: .empty), DefaultMapTile(type: .wall),DefaultMapTile(type: .rock), DefaultMapTile(type: .chest), DefaultMapTile(type: .empty), DefaultMapTile(type: .wall)],
        
        [DefaultMapTile(type: .wall), DefaultMapTile(type: .empty), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
        
        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
        
        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
        
        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)]
        
    ]

    func availableMoves(player: Player) -> [PlayerMove] {
        return []
    }

    func move(player: Player, move: PlayerMove) {
       //ТОДО: редуцирай енергията на героя на играча с 1
    }
    
}

class DefaultFightGenerator : FightGenerator {
    //TBD
}

class DefaultEquipmentGenerator : EquipmentGenerator {
    var allArmors: [Armor]
    
    var allWeapons: [Weapon]
    
    init() {
        allArmors = [NoArmor()]
        allWeapons = [WoodenStick()]
    }
}

class DefaultMapRenderer: MapRenderer {
    func render(map: Map) {
        for row in map.maze {
            self.renderMapRow(row: row)
        }
        
        renderMapLegend()
    }
    
    private func renderMapRow(row: [MapTile]) {
        var r = ""
        for tile in row {
            switch tile.type {
            case .chest:
                r += "📦"
            case .rock:
                r += "🗿"
            case .teleport:
                r += "💿"
            case .empty:
                r += "  "
            case .wall:
                r += "🧱"
            default:
                //empty
                r += " "
            }
        }
        
        print("\(r)")
    }
    
    private func renderMapLegend() {
        print("No map legend, yet!")
    }
}
