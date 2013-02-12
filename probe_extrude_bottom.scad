include <M3.scad>
$fn = 5;

// Make the bolts distribute symmetrically autmatically
module two_screws(x,y)
{
	M3(x,y,22);
	M3(-x,y,22);
}

// Make the bolts distribute symmetrically automatically
module poles(x,y)
{
	translate([x,y,-2]) cylinder(h = 22, r = 4, center = true);
	translate([-x,y,-2]) cylinder(h = 22, r = 4, center = true);

}

// Define the usb rfid reader
module reader(scale)
{
	//difference(){
	union(){
		cube([55,11,23],center=true);
		translate([24.5,0,0])cube([6,30,15],center=true);
		translate([-24.5,0,0])cube([6,30,15],center=true);

		translate([25,0,0])cube([55,7,15],center=true);
	}
   //rotate([0,45,0])translate([32.5,0,0])cube([55,11,23],center=true);
   //}
}

base_shape_extrude = 18;
usb_cable_radius = 2.5;

difference(){
	union(){
		difference(){
			minkowski(){
              // Traced probe, extrude
				linear_extrude(height = base_shape_extrude, center = true) import_dxf(file = "drawing.dxf");
				sphere(7);
			}
			translate([0,0,14]) linear_extrude(height = 20) import_dxf(file = "logo.dxf");
			linear_extrude(height = base_shape_extrude + 2, center = true) import_dxf(file = "drawing.dxf");
          // Hole near base for USB cable inlet
			rotate([90,0,0]) cylinder(r=usb_cable_radius, h=20, center = true);
          // Hole near head for USB cable outlet
			translate([56,120,0]) rotate([0,90,0]) cylinder(r=usb_cable_radius, h=20, center = true);

			//translate([75,160,0]) cube([25,40,15], center = true);
		
			// Fastener holes
			two_screws(18,1);
			two_screws(33,40);
			two_screws(34,84);
			two_screws(58.5,110);
			two_screws(46,138);
		
			// Make a slot for the rfid reader
			translate([0,147,0]) reader(1);
          // Cut it in half for printing
		  	translate([-80,-50,0]) cube([320,320,50]);
		}
		   poles(15,137.5);
		   poles(0,70);
		
		}
   two_screws(15,137.5);
   two_screws(0,70);
}



