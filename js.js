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

// Palindrome Check
function isPalindrome(string) {
    let revString = string.split('')
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