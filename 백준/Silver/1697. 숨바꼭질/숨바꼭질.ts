const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let input: number[] = []; // 입력값을 저장할 배열 선언

rl.on("line", function (line: any) {
  input = line.split(" ").map(Number); //숫자를 띄워쓰기 마다 끊어서 input 배열에 저장
}).on("close", function () {
  const answer = solution(input);
  console.log(answer);
});

const solution = (input: number[]) => {
  const n = input[0]; // 수빈이의 위치
  const k = input[1]; // 동생의 위치
  const queue: any = []; //큐 배열 생성
  const visited: boolean[] = new Array(n).fill(false);; // 이미 방문한 위치 넣어놓을 배열 생성
  queue.push([n, 0]); // 배열 초기값 추가

  while (queue.length > 0) {
    let [target, cnt] = queue.shift(); // 배열 하나씩 꺼내오기

    if (target == k) {
      // 동생의 위치에 도착했으면 cnt 출력
      return cnt;
    }

    for (let cal of [ - 1,  + 1, target]) {
        let dx = target + cal
      // 현재위치 -1, +1, *2 를 각각 구하기
      if (!visited[dx] && dx >= 0 && dx <= 100000) {
        // 구해 놓은 값이
        // 1. 이미 방문한 위치가 아님
        // 2. 0보다 클것 (동생위치의 최솟값)
        // 3. 100000 보다 작을것 (동생위치의 최댓값)
        queue.push([dx, cnt + 1]); // 조건에 부합하면 큐에 cnt + 1 을 하고 추가
        visited[dx] = true; // 이미 방문한 위치 배열에 추가
      }
    }
  }
};
