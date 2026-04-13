# Utility: Clamp value between min and max

fun clamp(v,lo,hi){ return max([lo,min([hi,v])]) }
print(clamp(15,0,10))
print(clamp(-5,0,10))
print(clamp(5,0,10))
