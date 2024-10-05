var input = readLine()!
var result = ""
var tempWord = ""
var insideTag = false

for char in input {
    if char == "<" {
        result += String(tempWord.reversed())
        tempWord = ""
        insideTag = true
        result.append(char)
    } else if char == ">" {
        insideTag = false
        result.append(char)
    } else if insideTag {
        result.append(char)
    } else if char == " " {
        result += String(tempWord.reversed()) + " "
        tempWord = ""
    } else {
        tempWord.append(char)
    }
}
result += String(tempWord.reversed())
print(result)