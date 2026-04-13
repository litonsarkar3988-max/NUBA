# Helper: Create URL slug from string

fun slugify(s){
    let result=""
    for ch in lower(s).chars() {
        let c=ord(ch)
        if (c>=97 and c<=122) or (c>=48 and c<=57) { result+=ch }
        elif ch==" " or ch=="-" {
            if len(result)>0 and substr(result,len(result)-1,len(result))!="-" { result+="-" }
        }
    }
    return result
}
print(slugify("Hello World! 123"))
print(slugify("Nuba Programming Language"))
