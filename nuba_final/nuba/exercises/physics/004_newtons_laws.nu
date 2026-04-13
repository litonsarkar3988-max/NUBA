# Physics Exercise 4: Newton's Laws

fun force(m, a) { return m * a }
fun acceleration(f, m) { return f / m }
fun weight(m) { return m * 9.8 }
fun normal_force(m, angle_deg) {
    let angle = angle_deg * PI / 180
    return m * 9.8 * cos(angle)
}
fun friction_force(mu, normal) { return mu * normal }
fun net_force(forces) { return reduce(fun(a,b)->a+b, forces) }

print("=== Newton's Laws ===")
let m=10.0; let f=50.0
print("F =", f, "N, m =", m, "kg")
print("Acceleration:", acceleration(f,m), "m/s²")
print("Weight:", weight(m), "N")
let mu=0.3; let normal=weight(m)
print("Friction (mu=0.3):", friction_force(mu,normal), "N")
print("Net force [50,−29.4]:", net_force([50.0,−29.4]), "N")
