// Two Number Sum
function twoNumberSum(array, targetSum) {
    for (let i = 0; i < array.length; i++) {
        for (let j = i + 1; j <= array.length; j++) {
            if (array[i] + array[j] === targetSum) {
                return [array[i], array[j]]
            }
        }
    }
    return [];
}

// Palindrome Check (bad time)
function isPalindrome(string) {
    let revString = string.split('').reverse().join('');
    return string === revString;
}

// Palindrome Check 0(n) time | 0(1) space
function isPalindrome(string) {
    let leftIdx = 0;
    let rightIdx = string.length - 1;

    while (leftIdx < rightIdx) {
        if (string[leftIdx] !== string[rightIdx]) {
            return false;
        }
        leftIdx++;
        rightIdx--;
    }
    return true;
}

// Three Number Sum
// function threeNumberSum(array, targetSum) {
//     let sortedArr = array.sort();

//     for (let i = 1; i < sortedArr.length; i++) {
//         let mid = sortedArr[i];
//         let left = sortedArr[i - 1];
//         let right = sortedArr[i + 1];
// 	}
// }

// Move Element to End
function moveEleToEnd(array, toMove) {
    let i = 0;
    let j = array.length - 1;

    while (i < j) {
        while (i < j && array[j] === toMove) j--;
        if (array[i] === toMove) swap(i, j, array);
        i++;
    }
    return array;
}

// helper function
function swap(i, j, array) {
    const temp = array[j];
    array[j] = array[i];
    array[i] = temp;
}


// Branch Sums
class BinaryTree {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }
}

function branchSums(root) {
    const sums = [];
    calcBranchSums(root, 0, sums);
    return sums;
}

function calcBranchSums(node, changingSum, sums) {
    if (!node) return;

    
}