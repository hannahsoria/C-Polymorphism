/**
 * linkedlist.swift
 * Hannah Soria
 * 4/14/2024
 * 
 * create a linkedlist
 * 
 */

/**
 * swift reminders
 * ? = optional type: represents value that may be a value or nil
 * ! = unwraps the data and allows for nil values and handles it
 * _ = parameter label is omitted when calling function, defines a parameter that is not names
 * T = generic type placeholder which allows for polymorphism
 */

// class is used over structs because classes support inheritence and polymorphism
class LinkedList<T> { // T is a generic type placeholder
    class Node<T> {
        //node variable
        var data: T
        var next: Node<T>? // ? = optional type: represents value that may be a value or nil
    
        // swift equivalent of create function
        init(data: T){
            self.data = data
        }
    }

    // linkedlist variables
    var head: Node<T>?
    var count = 0

    /** adds a node to the front of the list, storing the given data in the node.*/
    func ll_push(_ data: T){ // _ = parameter label is omitted when calling function
        let new_node = Node(data: data)
        new_node.next = head
        head = new_node
        count += 1
    }

    /** removes the node at the front of the list and returns the associated data.*/
    func ll_pop()->T?{ // ->T : returns a T 
        guard let prev_head = head else {return nil} // if the head is not nil set it to prev_head
        head = prev_head.next // set the hew head
        count -= 1
        return prev_head.data
    }

    /** adds a node to the end of the list, storing the given data in the node.*/
    func ll_append(_ data: T){
        let new_node = Node(data:data)
            if head == nil{ // make the append node the head if the list is empty
                head = new_node
            } else {
                var current_node = head
                    while current_node?.next != nil { // iterate through the list, ? checks and accesses next if not nil
                        current_node = current_node?.next // set to the next node
                    }
                    current_node?.next = new_node
            }
            count += 1
    }

    /** removes the first node in the list whose data matches target given the comparison function.*/
    func ll_remove(_ target: T, _ compfunc: (T,T)->Bool)->T?{
        var current_node = head
        var prev_node: Node<T>? = nil // the previous node

        // iterate through all elements of the list
        while current_node != nil{ // it equals nil when it has reached the end of the list
            if compfunc(current_node!.data, target){ // compare the data of current node to the target. the ! unwraps the data

                // if the current node data and the target match

                // case for if the target is the head
                if prev_node == nil { // check if the current node is the head
                    head = current_node?.next //head updated to the next node

                // traget is not the head
                } else {
                    prev_node?.next = current_node?.next //previous ptr updated to current ptr therefore skipping the node removed, no more references to it
                }
                let removed_data = current_node!.data // store the removed data
                current_node = nil // "delete" the current node (target)
                count -= 1 // make the list shorter since one node was removed
                return removed_data 
                
            }
            prev_node = current_node // reassign previous node to the current (iterating)
            current_node = current_node?.next // reassign current node to the next node (iterating)
            
        }
        return nil
    }

    /** finds the first node in the list whose data matches target given the comparison function. */
    func ll_find(_ target: T, _ compfunc: (T,T) -> Bool)-> T? {
        var current_node = head

        // iterate through the list
        while current_node != nil {
            // if the current node matched the target
            if compfunc(current_node!.data, target) {
                return current_node?.data // return the targeted memory
            }
            // update current to go to the next node (iterate)
            current_node = current_node?.next
        }
        return nil
    }

    /** returns the size of the list */
    func ll_size() -> Int {
        return count
    }

    /** removes all of the nodes from the list, freeing the associated data using the given function.*/
    func ll_clear(_ freefunc: (T)-> Void) {
        var current_node = head
        // iterate through the whole list
        while current_node != nil {
            let next_node = current_node?.next // set a next node
            freefunc(current_node!.data) // release the node
            current_node = next_node // iterate forward
        }
        head = nil // clearing the list
        count = 0 // clearing the list
    }

    /** traverses the list and applies the given function to the data at each node. */
    func ll_map(_ mapfunc: (T) -> T) {
    var current_node = head
    // iterate through the list
    while current_node != nil {
        current_node!.data = mapfunc(current_node!.data) // Update the data with the transformed value
        current_node = current_node?.next // go to the next node (iterate)
        }
    }
}

/*---------------------------------------------------------------------------------------------------------------------------------*/
// functions for manipulating the data for testing

// function that prints an integer
func print_val<T>(_ value: T)-> T{
    let a = value
    print("value:", a)
    return a
}

// function that squares an integer
func square<T: Numeric>(_ value: T)-> T{
    return value * value
}

// function that compares two integers and returns 1 if they are equal
func comp<T: Equatable>(_ i: T, _ j: T) -> Bool { // equatable means that the two things being compared are able to be compared
    return i == j // compare the two
}

/*---------------------------------------------------------------------------------------------------------------------------------*/
// Testing the LinkedList with INTERGERS 
print("TESTING FOR INTEGERS\n")

let l = LinkedList<Int>()

// populate the linked list by using push
for i in stride(from: 0, to: 20, by: 2) { // stride lets you move by increments
    l.ll_push(i)
}
print("List size: \(l.ll_size())\n")
l.ll_map(print_val)
print("\n")

// squaring the list
l.ll_map{square($0)} // trailing closure syntax to pass the square function
l.ll_map(print_val)

// target to be removed
let target = 16

// testing remove
if let removed = l.ll_remove(target, comp) {
        print("\nAfter removing \(target):\n")
        print("removed:  \(removed)")
        print("\nList size: \(l.ll_size())")
} else {
    print("No instance of \(target)")
}

// target for found
let found = l.ll_find(11, comp)

// testing for found
if let foundValue = found {
    print("Found: \(foundValue)")
} else {
    print("\nNo instance of the target found for ll_find")
}

// append 
l.ll_append(16)

print("\nAfter appending 16:")
l.ll_map(print_val(_:))

// Test clearing
print("\nClearing the values:")
l.ll_clear{ value in
    print("Cleared value: \(value)")
}

// Test size after clearing
print("\nList size: \(l.ll_size())")

// remake populate the list by appending
for i in stride(from: 0, to: 5, by: 1) {
    l.ll_append(i)
}

print("\nAfter appending")
l.ll_map(print_val)

// testing pop
if let popped = l.ll_pop() {
    print("\nPopped: \(popped)")
}

// print the list after popping
print("\nAfter popping")
l.ll_map(print_val)

// printing the final size
print("\nList size: \(l.ll_size())")

/*---------------------------------------------------------------------------------------------------------------------------------*/
// Testing the LinkedList with DOUBLES 
print("\n-----------------------------")
print("\nTESTING FOR DOUBLES\n")

let ll = LinkedList<Double>()

// populate the linked list by using push
for i in stride(from: 0.0, to: 20.0, by: 2.0) { // stride lets you move by increments
    ll.ll_push(i)
}
print("List size: \(ll.ll_size())\n")
ll.ll_map(print_val)
print("\n")

// squaring the list
ll.ll_map{square($0)} // trailing closure syntax to pass the square function
ll.ll_map(print_val)

// target to be removed
let target2 = 16.0

// testing remove
if let removed2 = ll.ll_remove(target2, comp) {
        print("\nAfter removing \(target2):\n")
        print("removed2:  \(removed2)")
        print("\nList size: \(ll.ll_size())")
} else {
    print("No instance of \(target2)")
}

// target for found
let found2 = ll.ll_find(11.0, comp)

// testing for found
if let foundValue2 = found2 {
    print("Found: \(foundValue2)")
} else {
    print("\nNo instance of the target found for ll_find")
}

// append 
ll.ll_append(16.0)

print("\nAfter appending 16:")
ll.ll_map(print_val(_:))

// Test clearing
print("\nClearing the values:")
ll.ll_clear{ value in
    print("Cleared value: \(value)")
}

// Test size after clearing
print("\nList size: \(ll.ll_size())")

// remake populate the list by appending
for i in stride(from: 0.0, to: 5.0, by: 1.0) {
    ll.ll_append(i)
}

print("\nAfter appending")
ll.ll_map(print_val)

// testing pop
if let popped2 = l.ll_pop() {
    print("\nPopped: \(popped2)")
}

// print the list after popping
print("\nAfter popping")
ll.ll_map(print_val)

// printing the final size
print("\nList size: \(ll.ll_size())")