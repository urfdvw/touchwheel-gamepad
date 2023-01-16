include <smooth_prim.scad>

function mm(mil) = mil * 0.0254;
x = mm(3300);
y = mm(2000);
r = mm(100);
large_num = 200;

module case(){
    translate([0, 0, -r])
    difference (){
        SmoothCube([x, y, 2* r], r);
        translate([0, 0, r - large_num])
        cube(size=[x, y, large_num]);
    }
}

case();