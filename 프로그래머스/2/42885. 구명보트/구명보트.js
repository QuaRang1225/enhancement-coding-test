function solution(people, limit) {
    people.sort((a,b) => a-b);
    let result = 0;
    let start = 0;
    let end = people.length - 1;
    
    while (start <= end) {
        if (people[start] + people[end] <= limit) {
            start += 1;
            end -= 1;
        } else {
            end -= 1;
        }
        result += 1;
    }
    return result;
}