include <base.scad>
include <smooth_prim.scad>

smooth_r = 0.7 * r;
thickness = 3;


scale([1, 1, thickness / r])
difference(){
    case();
    translate([mm(1200), mm(1100), -0.5 * large_num])
    cube([mm(900), mm(900), large_num]);
    translate([mm(1000), mm(300), -0.5 * large_num])
    cube([mm(1300), mm(900), large_num]);
}