# Physics Exercise 2: Projectile Motion

fun projectile_range(v, angle_deg) {
    let angle = angle_deg * PI / 180
    return v*v * sin(2*angle) / 9.8
}
fun max_height(v, angle_deg) {
    let angle = angle_deg * PI / 180
    return (v * sin(angle))**2 / (2*9.8)
}
fun time_of_flight(v, angle_deg) {
    let angle = angle_deg * PI / 180
    return 2 * v * sin(angle) / 9.8
}
print("=== Projectile Motion ===")
let v = 50.0
for angle in [15, 30, 45, 60, 75] {
    print(format("Angle {0}°: Range={1}m MaxH={2}m Time={3}s",
        angle,
        round(projectile_range(v, angle),2),
        round(max_height(v, angle),2),
        round(time_of_flight(v, angle),2)))
}
