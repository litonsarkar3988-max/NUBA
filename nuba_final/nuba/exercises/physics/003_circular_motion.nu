# Physics Exercise 3: Circular Motion

fun centripetal_acc(v, r)  { return v*v / r }
fun centripetal_force(m, v, r) { return m * centripetal_acc(v, r) }
fun angular_velocity(v, r) { return v / r }
fun period(r, v)           { return 2 * PI * r / v }
fun frequency(r, v)        { return 1 / period(r, v) }

print("=== Circular Motion ===")
let m=2.0; let r=5.0; let v=10.0
print("Mass:", m, "kg | Radius:", r, "m | Speed:", v, "m/s")
print("Centripetal acc:", round(centripetal_acc(v,r),2), "m/s²")
print("Centripetal force:", round(centripetal_force(m,v,r),2), "N")
print("Angular velocity:", round(angular_velocity(v,r),2), "rad/s")
print("Period:", round(period(r,v),2), "s")
print("Frequency:", round(frequency(r,v),2), "Hz")
