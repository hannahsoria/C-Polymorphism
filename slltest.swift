import Foundation


func printInt(_ i: void?){
    if let value = a.pointee {
        print("value: \(value)")
    } else {
        print("unable to access value")
    }
}

func squareInt(_ i: void?){
    if let value = a.pointee{
        a.pointee = value * value
    }
}

func compInt(_ i: void?, _ j: void?)->Int{
    let result = memcmp(i,j, MemoryLayout<Int>.size(ofValue: Int))
    return (result == 0) ? 1 : 0
}

func main() {
    let l = LinkedList<Int>()
    for i in stride(from: 0, to: 20, by: 2) {
        let a = void<Int>.allocate(capacity: 1)
        a.pointee = 1
        l.push(a)
    }
}

printf("after iitialixzation")
ll_map(l,printInt)
ll_map(l,squareInt)

print("\nAfter Squaring")
ll_map(l, printInt)

let target = void<Int>.allocate(capacity: 1)
target.pointee = 16
if let a = ll_remove(l, target, compInt) {
    print("\nremoved: \(a.pointee)")
} else {
    print("\nNo instance of \(target.pointee)")
}

target.pointee = 11
if let a = ll_find(l, target, compInt) {
    print("\nFound: \(a.pointee)")
} else {
    print("\nNo instance of \(target.pointee)")
}
if let a = ll_remove(l, target, compInt) {
    print("\nremoved: \(a.pointee)")
} else {
    print("\nNo instance of \(target.pointee)")
}

print("\nAfter removals")
ll_map(l, printInt)

// Testing appending data
ll_append(l, target)

print("\nAfter append")
ll_map(l, printInt)

// Test clearing
ll_clear(l, free)

print("\nAfter clear")
ll_map(l, printInt)

// Rebuild and test append and pop
for i in 0..<5 {
    let a = void<Int>.allocate(capacity: 1)
    a.pointee = i
    ll_append(l, a)
}

print("\nAfter appending")
ll_map(l, printInt)

if let a = ll_pop(l) {
    print("\npopped: \(a.pointee)")
    free(a)
}

if let a = ll_pop(l) {
    print("popped: \(a.pointee)")
    free(a)
}

print("\nAfter popping")
ll_map(l, printInt)

print("\nList size: \(ll_size(l))")