module M2(x,y){
translate([x,y,0])
	union(){
		translate([0,0,0]) cylinder(h=30,r=1,center=true);
		translate([0,0,12.5]) cylinder(h=5,r=3);
		translate([0,0,-12.5]) rotate([180,0,0])cylinder(h=5,r=3);
	}

}
