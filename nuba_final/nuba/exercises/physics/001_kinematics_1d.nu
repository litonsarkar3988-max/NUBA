# Physics Exercise 1: 1D Kinematics

fun velocity_final(u, a, t) { return u + a * t }
fun displacement(u, a, t) { return u*t + 0.5*a*t*t }
fun velocity_squared(u, a, s) { return sqrt(abs(u*u + 2*a*s)) }
fun time_to_stop(u, a) { if a == 0 { return null }; return -u/a }

print("=== 1D Kinematics ===")
let u=20.0; let a=-9.8; let t=2.0
print("Initial velocity:", u, "m/s")
print("Acceleration:", a, "m/s²")
print("After", t, "s:")
print("  Final velocity:", round(velocity_final(u,a,t),2), "m/s")
print("  Displacement:", round(displacement(u,a,t),2), "m")
print("  Max height:", round(u*u/(2*9.8),2), "m")
print("  Time to max:", round(u/9.8,2), "s")
