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
}

// Three Number Sum
function threeNumberSum(array, targetSum) {
    let sortedArr = array.sort();

    for (let i = 1; i < sortedArr.length; i++) {
        let mid = sortedArr[i];
        let left = sortedArr[i - 1];
        let right = sortedArr[i + 1];
	}
}