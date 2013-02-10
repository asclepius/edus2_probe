include <M2_holes.scad>
$fn = 5;

// Make the bolts distribute symmetrically autmatically
module M2_2(x,y)
{
	M2(x,y);
	M2(-x,y);
}

// Make the bolts distribute symmetrically autmatically
module poles(x,y)
{
	translate([x,y,0]) cylinder(h = 22, r = 4, center = true);
	translate([-x,y,0]) cylinder(h = 22, r = 4, center = true);

}

// Define the usb rfid reader
module reader(scale)
{
	union(){
		cube([55,11,23],center=true);
		translate([25,0,0])cube([55,7,15],center=true);
	}
}

difference(){
	union(){
		difference(){
			minkowski(){
              // Traced probe, extrude
				linear_extrude(height = 20, center = true) import_dxf(file = "drawing.dxf");
				sphere(5);
			}
			translate([0,0,12.5]) linear_extrude(height = 20) import_dxf(file = "logo.dxf");
			linear_extrude(height = 20, center = true) import_dxf(file = "drawing.dxf");
          // Hole near base for USB cable inlet
			rotate([90,0,0]) cylinder(r=2.5, h=20, center = true);
          // Hole near head for USB cable outlet
			translate([56,120,0]) rotate([0,90,0]) cylinder(r=2.5, h=20, center = true);


			translate([75,160,0]) cube([25,40,15], center = true);
		
			// Fastener holes
			M2_2(18,2);
			M2_2(31,40);
			M2_2(34,86);
			M2_2(56.5,110);
			M2_2(42,140);
		
			
			translate([0,145,0]) reader(1);
		  // translate([-80,0,0]) cube([160,160,50]);
		}
		   poles(15,135.5);
		   poles(0,80);
		
		}
   M2_2(15,135.5);
   M2_2(0,80);
}



