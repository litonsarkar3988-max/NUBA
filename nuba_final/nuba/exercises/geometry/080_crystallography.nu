# Geometry: Crystallography

print("=== Crystallography ===")

fun distance(x1, y1, x2, y2) {
    return sqrt((x2-x1)**2 + (y2-y1)**2)
}

fun midpoint(x1, y1, x2, y2) {
    return [(x1+x2)/2, (y1+y2)/2]
}

fun slope(x1, y1, x2, y2) {
    if x2 == x1 { return null }
    return (y2-y1)/(x2-x1)
}

fun area_triangle(x1,y1,x2,y2,x3,y3) {
    return abs((x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2))/2)
}

fun area_circle(r) { return PI * r * r }
fun perimeter_circle(r) { return 2 * PI * r }
fun area_rectangle(w, h) { return w * h }
fun area_trapezoid(a, b, h) { return (a + b) * h / 2 }

fun dot_product(v1, v2) {
    return sum(map(fun(p) -> p[0]*p[1], zip(v1, v2)))
}

fun cross_product_2d(v1, v2) {
    return v1[0]*v2[1] - v1[1]*v2[0]
}

fun angle_between(v1, v2) {
    let dp = dot_product(v1, v2)
    let m1 = sqrt(sum(map(fun(x)->x*x, v1)))
    let m2 = sqrt(sum(map(fun(x)->x*x, v2)))
    return round(abs(dp/(m1*m2)), 6)
}

# Demo for Crystallography
print("Distance (0,0)-(3,4):", distance(0,0,3,4))
print("Midpoint:", midpoint(0,0,4,6))
print("Triangle area:", area_triangle(0,0,4,0,0,3))
print("Circle area (r=5):", round(area_circle(5),4))
let v1=[3,4]; let v2=[1,2]
print("Dot product:", dot_product(v1,v2))
print("Cross product:", cross_product_2d(v1,v2))
