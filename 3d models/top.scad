include <base.scad>
include <smooth_prim.scad>

smooth_r = 0.7 * r;
thickness = 1;


// scale([1, 1, thickness / r])
// SmoothHole(
//     radius = mm(552.27),
//     height = 2 * r,
//     smooth_rad = smooth_r,
//     position = [mm(700), mm(1300), -r]
// )
// SmoothHole(
//     radius = mm(552.27),
//     height = 2 * r,
//     smooth_rad = smooth_r,
//     position = [mm(2600), mm(1300), -r]
// )
// SmoothHole(
//     radius = mm(250),
//     height = 2 * r,
//     smooth_rad = smooth_r,
//     position = [mm(900), mm(350), -r]
// )
SmoothHole(
    radius = mm(250),
    height = 2 * r,
    smooth_rad = smooth_r,
    position = [mm(2400), mm(350), -r]
)
case();