import Foundation

class OldHashable: Hashable {
    let value1 = UUID()
    let value2 = UUID()
    let value3 = UUID()
    let value4 = UUID()
    let value5 = UUID()
    
    init() {
        hashValue = value1.hashValue ^ value2.hashValue ^ value3.hashValue ^ value4.hashValue ^ value5.hashValue
    }
    
    static func == (lhs: OldHashable, rhs: OldHashable) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    let hashValue: Int
}

class NewHashable: Hashable {
    let value1 = UUID()
    let value2 = UUID()
    let value3 = UUID()
    let value4 = UUID()
    let value5 = UUID()
    
    init() {}
    
    static func == (lhs: NewHashable, rhs: NewHashable) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value1)
        hasher.combine(value2)
        hasher.combine(value3)
        hasher.combine(value4)
        hasher.combine(value5)
    }
}

class TweakedHashable: Hashable {
    let value1 = UUID()
    let value2 = UUID()
    let value3 = UUID()
    let value4 = UUID()
    let value5 = UUID()
    let hashableValue: Int
        
    init() {
        hashableValue = value1.hashValue ^ value2.hashValue ^ value3.hashValue ^ value4.hashValue ^ value5.hashValue
    }
    
    static func == (lhs: TweakedHashable, rhs: TweakedHashable) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashableValue)
    }
}
