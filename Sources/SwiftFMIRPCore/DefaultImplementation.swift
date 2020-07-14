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

enum Race: String, CaseIterable{
    case DragonBorn = "Dragon Born"
    case Dwarf = "Dwarf"
    case Elf = "Elf"
    case Gnome = "Gnome" 
    case HalfElf = "Half-Elf" 
    case Halfling = "Halfling"
    case HalfOrc = "Half-Orc"
    case Human = "Human"
    case Tiefling = "Tiefling"
}

struct NoArmor: Armor {
    var attack: Int = 0
    var defence: Int = 0
}

struct WoodenStick: Weapon {
    var attack: Int = 2
    var defence: Int = 1
}

enum WeaponNames: CaseIterable{
    case AcidBreathWeapon, DwarvenAxe, MaglorKnives, QuickRazor, SorcererssStaff, 
    LightCrossBow, PainOfGodnessSword, Rapier, ThePoisonousRanseur
}
class Weapons: Weapon{
    var attack: Int
    var defence: Int
    init(number: Int){
        print("Your weapon is the \(WeaponNames.allCases[number])")
        switch number{
            case 0:
                self.attack = 4
                self.defence = 2
            case 1: 
                self.attack = 2
                self.defence = 2
            case 2: 
                self.attack = 2
                self.defence = 1
            case 3: 
                self.attack = 4
                self.defence = 3
            case 4: 
                self.attack = 3
                self.defence = 3
            case 5: 
                self.attack = 4
                self.defence = 4
            case 6: 
                self.attack = 3
                self.defence = 2
            case 7: 
                self.attack = 2
                self.defence = 2
            case 8: 
                self.attack = 3
                self.defence = 1
            default:
                self.attack = 0
                self.defence = 0
        }
    }
}

enum ArmorsNames: CaseIterable{
    case StuddedCuirass, DwarvenPlate, ElvenChain, TwistCloth, ClothesOfTheSpirit, 
        RobeOfCalm, HempClothes, MithrilCloak, TieflingCraftedArmor
}

class Armors: Armor {
    var attack: Int
    var defence: Int

    init(number: Int){
        self.attack = Int.random(in: 1...4)
        print("Your armor is the \(ArmorsNames.allCases[number])")
        switch number{
            case 0:
                self.defence = 8
            case 1: 
                self.defence = 6
            case 2: 
                self.defence = 7
            case 3: 
                self.defence = 5
            case 4: 
                self.defence = 6
            case 5: 
                self.defence = 4
            case 6: 
                self.defence = 5
            case 7: 
                self.defence = 8
            case 8: 
                self.defence = 5
            default:
                self.defence = 0
        }
    }
}


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
            let gettingRandomRace = Int.random(in: 1...9)
            var race: String
            var energy: Int = 5
            var lifePoints: Int = 7
            var weapon: Weapon?
            var armor: Armor?
        
            race = Race.allCases[gettingRandomRace].rawValue
            weapon = Weapons(number: gettingRandomRace)
            armor = Armors(number: gettingRandomRace)

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
        allArmors = [NoArmor(), StuddedCuirass(), DwarvenPlate(),
                    ElvenChain(), TwistCloth(), ClothesOfTheSpirit(), 
                    RobeOfCalm(), HempClothes(), MithrilCloak(), TieflingCraftedArmor()]
        allWeapons = [WoodenStick(), AcidBreathWeapon(), DwarvenAxe(),
                     MaglorKnives(), QuickRazor(), SorcererssStaff(),
                     LightCrossBow(), PainOfGodnessSword(), Rapier(), ThePoisonousRanseur()]
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
