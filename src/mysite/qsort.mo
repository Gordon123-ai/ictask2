import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";

actor {
    func swap(arr: [var Int], i: Nat, j: Nat) {
        let temp = arr[i];
        arr[i] := arr[j];
        arr[j] := temp;
    };

    func partition(arr: [var Int], low: Nat, high: Nat): Nat{
    var l =low;
    var h = high;
    let pi = arr[low];
    while(l < h) {
        while(l < h and arr[h] >= pi) {
        h -= 1; 
        };
        while(l < h and arr[l] <= pi) {
        l += 1;
        };
        if(l < h) swap(arr, l, h);
    };
    if(arr[low] > arr[l]) swap(arr, low, l);
    return l;
    };

    func qsort(arr: [var Int], low: Nat, high: Nat){
    if (low < high){
        var p: Nat = partition(arr, low, high);
        if(p > 0) qsort(arr, low, p - 1);
        qsort(arr, p + 1, high);
    };
    };

    public func quicksort(arr: [Int]): async [Int]{
        var arr2: [var Int] = Array.thaw(arr);
        qsort(arr2, 0, arr2.size() - 1);
        Array.freeze(arr2);
    }
}


//let a: [var Int] = [var 1, 6, 3, 7, 2, 30, 30, 50, 9];
//quicksort(a, 0, a.size()-1);
//Debug.print(debug_show(a));