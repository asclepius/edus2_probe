include <M2_holes.scad>
$fn = 20;

module M2_2(x,y)
{
	M2(x,y);
	M2(-x,y);
}

difference(){
	//minkowski(){
		linear_extrude(height = 20, center = true) import_dxf(file = "drawing.dxf");
	//	sphere(5);
	//}
	//translate([0,0,12.5]) linear_extrude(height = 20) import_dxf(file = "logo.dxf");
	//linear_extrude(height = 20, center = true) import_dxf(file = "drawing.dxf");
	cube([22.5,70,10], center=true);
	translate([75,160,0]) cube([25,40,15], center = true);
}


M2_2(18,2);
M2_2(32,40);
M2_2(34,86);
