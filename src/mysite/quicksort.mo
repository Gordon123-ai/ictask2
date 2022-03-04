import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Int "mo:base/Int";

func swap(arr: [var Int], i: Nat, j: Nat) {
    let temp = arr[i];
    arr[i] := arr[j];
    arr[j] := temp;
};

func quicksort(arr: [var Int], low: Nat, high: Nat): (){
    if(low < high){
        var l = low;
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
        if (l > 0)
        quicksort(arr, low, l - 1);
        quicksort(arr, l + 1, high);
    };
};
 
let a: [var Int] = [var 1, 10, 3, 7, 2, 2, 3, 30, 9];
quicksort(a, 0, a.size()-1);
Debug.print(debug_show(a));