var count = Int(readLine()!)!

func recursion(count:Int,repeating:Int){
    let text = String(repeating: "____", count: repeating)
    print("\(text)\"재귀함수가 뭔가요?\"")
    if count > 0{
        print("\(text)\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.")
        print("\(text)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.")
        print("\(text)그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"")
        recursion(count:  count - 1 ,repeating: repeating + 1)
    }else{
        print("\(text)\"재귀함수는 자기 자신을 호출하는 함수라네\"")
    }
    print("\(text)라고 답변하였지.")
}
print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
recursion(count: count,repeating: 0)