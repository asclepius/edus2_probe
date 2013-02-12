module M3(x,y,h){
translate([x,y,0])
	union(){
		translate([0,0,0]) cylinder(h=30,r=1.5,center=true);
		translate([0,0,h/2]) cylinder(h=15,r=3);
		translate([0,0,-h/2]) rotate([180,0,0])cylinder(h=15,r=3);
	}

}
