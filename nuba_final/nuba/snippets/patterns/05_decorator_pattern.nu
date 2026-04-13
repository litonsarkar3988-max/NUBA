# Pattern: Decorator design pattern

fun logged(fn,name){
    fun wrapper(x){
        print("[LOG] "+name+"("+str(x)+")")
        let r=fn(x)
        print("[LOG] "+name+" returned "+str(r))
        return r
    }
    return wrapper
}
fun timed_wrap(fn,name){
    fun wrapper(x){
        let t=time()
        let r=fn(x)
        print("["+name+"] took "+str(round((time()-t)*1000,2))+"ms")
        return r
    }
    return wrapper
}
fun square(x){ return x*x }
let enhanced=timed_wrap(logged(square,"square"),"square")
print(enhanced(7))
