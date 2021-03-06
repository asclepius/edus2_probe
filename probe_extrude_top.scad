include <M3.scad>
$fn = 20;

M3_length = 23;
M3_head = 3;
// Make the bolts distribute symmetrically autmatically
module two_screws(x,y)
{
	M3(x,y,M3_length - M3_head);
	M3(-x,y,M3_length - M3_head);
}

// Make the bolts distribute symmetrically automatically
pole_radius = 4;
module poles(x,y)
{
	translate([x,y,-2]) cylinder(h = 22, r = pole_radius, center = true);
	translate([-x,y,-2]) cylinder(h = 22, r = pole_radius, center = true);

}

// Define the usb rfid reader
reader_thickness = 11;
reader_width = 23;
reader_length = 55;
reader_breather_block_length = 6;
usb_cable_height = 7;
usb_cable_width = 15;
module reader(scale)
{
	union(){
		cube([reader_length,reader_thickness,reader_width],center=true);
		// Breather blocks for heat vent (more just so the edges work nicely)
		translate([reader_length/2 - reader_breather_block_length/2,0,0])
			cube([reader_breather_block_length,30,reader_width],center=true);
		translate([-(reader_length/2 - reader_breather_block_length/2),0,0])
			cube([reader_breathedifferencer_block_length,30,reader_width],center=true);
		// Hole for the usb cable
		translate([25,0,0])cube([reader_length,usb_cable_height,usb_cable_width],center=true);
	}
}

base_shape_extrude = 15;
usb_cable_radius = 2.5;
reader_offset = 82;
sphere_radius = 5;
hollow_height = base_shape_extrude + 0.5*sphere_radius;//M3_length - M3_head - 3;
pole_stopper_y_offset = reader_offset - reader_thickness/2 - pole_radius;

module probe(){
	union(){
		difference(){
			minkowski(){
              // Traced probe, extrude
				linear_extrude(height = base_shape_extrude, center = true) import_dxf(file = "drawing.dxf");
				sphere(sphere_radius);
			}
			translate([0,-30,base_shape_extrude/2 + 0.75* sphere_radius]) linear_extrude(height = base_shape_extrude) import_dxf(file = "logo.dxf");
			// Use the drawing again to hollow the object
			linear_extrude(height = hollow_height, center = true) import_dxf(file = "drawing.dxf");

          // Hole near base for USB cable inlet
			rotate([90,0,0]) cylinder(r=usb_cable_radius, h=20, center = true);
          // Hole near head for USB cable outlet
			# translate([20,45,0]) rotate([0,90,0]) cylinder(r=usb_cable_radius, h=20, center = true);
		
			// Fastener holes
			two_screws(18,20);
			two_screws(34,75);

		
			// Make a slot for the rfid reader
			translate([0,reader_offset,0]) reader(1);
          // Cut it in half for printing
		  	translate([-80,-50,-50]) cube([320,320,50]);
		}

		}

}

probe();



