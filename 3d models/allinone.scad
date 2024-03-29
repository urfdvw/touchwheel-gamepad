include <smooth_prim.scad>

function mm(mil) = mil * 0.0254;
x = mm(3300);
y = mm(2000);
r = mm(100);
thickness = 1.5;
herr = 0.4;
object_thickness = 6;
wall = 1;
large_num = 200;
err = 0.01;

module case(){
    translate([-wall, -wall, -r])
    difference (){
        SmoothCube([x+herr+wall*2, y+herr+wall, 2* r], r+wall);
        translate([-0.5 * large_num, -0.5 * large_num, r - large_num])
        cube(size=[large_num, large_num, large_num]);
    }
}

module pcb(){
    translate([mm(1200), mm(1100), 0])
    cube([mm(900), mm(9000), object_thickness]);
    translate([mm(1000), mm(300), 0])
    cube([mm(1300), mm(900), object_thickness]);
    translate([0, 0, object_thickness - thickness])
    SmoothXYCube([x+herr, y+herr, thickness+err], r+herr);
}

smooth_r = 0.7 * r;
thickness = 1;

translate([0, 0, object_thickness])
scale([1, 1, thickness / r])
SmoothHole(
    radius = mm(552.27),
    height = 2 * (r + err),
    smooth_rad = smooth_r,
    position = [mm(700), mm(1300), -r-err]
)
SmoothHole(
    radius = mm(552.27),
    height = 2 * (r + err),
    smooth_rad = smooth_r,
    position = [mm(2600), mm(1300), -r-err]
)
SmoothHole(
    radius = mm(250),
    height = 2 * (r + err),
    smooth_rad = smooth_r,
    position = [mm(900), mm(350), -r-err]
)
SmoothHole(
    radius = mm(250),
    height = 2 * (r + err),
    smooth_rad = smooth_r,
    position = [mm(2400), mm(350), -r-err]
)
case();

difference(){
    translate([-wall, -wall, 0])
    SmoothXYCube([x+herr+wall*2, y+herr+wall, object_thickness], r+wall);
    translate([0, 0, -0.5*err])
    pcb();
}
