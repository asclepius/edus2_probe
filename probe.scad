$fn = 20;

minkowski(){
difference() {
        cylinder (h = 1.5, r=10);
        translate ([0,6,0]) cube([11.5,8,4], center=true);
        translate ([8,-8,0]) cube([4,4,4], center=true);
        translate ([-8,-8,0]) cube([4,4,4], center=true);
        translate ([-11.5,2,0]) cylinder (h = 4, r=10, center = true);
        translate ([11.5,2,0]) cylinder (h = 4, r=10, center = true);
}

translate([0,-10,0]) sphere(1.5);
}