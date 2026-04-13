# Physics Exercise 5: Work and Energy

fun work(f, d, angle_deg) {
    return f * d * cos(angle_deg * PI / 180)
}
fun kinetic_energy(m, v) { return 0.5 * m * v * v }
fun potential_energy(m, h) { return m * 9.8 * h }
fun total_mechanical_energy(m, v, h) {
    return kinetic_energy(m,v) + potential_energy(m,h)
}
fun power(w, t) { return w / t }

print("=== Work and Energy ===")
let m=5.0; let v=10.0; let h=20.0
print("KE:", kinetic_energy(m,v), "J")
print("PE:", potential_energy(m,h), "J")
print("Total ME:", total_mechanical_energy(m,v,h), "J")
print("Work (100N, 10m, 30°):", round(work(100,10,30),2), "J")
print("Power (500J, 10s):", power(500,10), "W")
