```Swift
protocol SpellCombinable {
  associatedtype CombinableType
  static func spellCombine(lhs: CombinableType, rhs: CombinableType) -> String
}

protocol Spell {
  associatedtype SpellType: SpellCombinable
  static var word: SpellType { get }
}

extension String: SpellCombinable {
  static func spellCombine(lhs: String, rhs: String) -> String {
    "\(lhs) \(rhs)"
  }
}

struct Fireball: Spell {
  static var word: String {
    "Go FireBall!!"
  }
}

struct Spear: Spell {
  static var word: String {
    "Spear!!"
  }
}

struct FireSpear: Spell {
  static var word: String {
    String.spellCombine(lhs: Fireball.word, rhs: Spear.word)
  }
}


struct Dimension3: SpellCombinable {
  var x: Double
  var y: Double
  var z: Double
  
  var combineword: String {
    "\(self.x), \(self.y), \(self.z)"
  }
  
  static func spellCombine(lhs: String, rhs: String) -> String {
    "\(lhs) \(rhs)"
  }
  
}

struct Teleport: Spell {
  static var word: Dimension3 {
    Dimension3(x: 0.2, y: 0.3, z: 0.4)
  }
}

struct TeleportFireball: Spell {
  static var word: String {
    String.spellCombine(lhs: Fireball.word, rhs: Teleport.word.combineword)
  }
}
```