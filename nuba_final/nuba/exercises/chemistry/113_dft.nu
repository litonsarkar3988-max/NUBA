# Chemistry: Dft

print("=== Dft ===")

# Dft calculations and examples

fun molar_mass(formula_weights) {
    return sum(formula_weights)
}

fun percent_composition(element_mass, total_mass) {
    return round(element_mass * 100 / total_mass, 2)
}

fun moles_from_grams(grams, molar_mass_val) {
    return round(grams / molar_mass_val, 4)
}

fun grams_from_moles(moles, molar_mass_val) {
    return round(moles * molar_mass_val, 4)
}

fun molarity(moles_solute, liters_solution) {
    return round(moles_solute / liters_solution, 4)
}

fun dilution_volume(c1, v1, c2) {
    return round(c1 * v1 / c2, 4)
}

# Demo for Dft
print("Moles of H2O (18g):", moles_from_grams(18, 18.015))
print("Grams of NaCl (2 mol):", grams_from_moles(2, 58.44))
print("Molarity (0.5 mol in 250mL):", molarity(0.5, 0.250))
print("Dilution: 1M 100mL to 0.1M:", dilution_volume(1.0, 100, 0.1), "mL")

# Additional Dft specific demo
let avogadro = 6.022e23
let atomic_mass_unit = 1.66e-27
print("Avogadro:", avogadro, "molecules/mol")
print("AMU:", atomic_mass_unit, "kg")
