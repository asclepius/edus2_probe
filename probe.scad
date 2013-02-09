$fn = 10;

difference(){
minkowski(){
difference() {
        cylinder (h = 1.5, r=10, center=true);
        translate ([0,6,0]) cube([11.5,8,4], center=true);
        translate ([8,-8,0]) cube([4,4,4], center=true);
        translate ([-8,-8,0]) cube([4,4,4], center=true);
        translate ([-11.5,2,0]) cylinder (h = 4, r=10, center = true);
        translate ([11.5,2,0]) cylinder (h = 4, r=10, center = true);
}

sphere(0.75);
}

difference() {
        cylinder (h = 1.5, r=10, center=true);
        translate ([0,6,0]) cube([11.5,8,4], center=true);
        translate ([8,-8,0]) cube([4,4,4], center=true);
        translate ([-8,-8,0]) cube([4,4,4], center=true);
        translate ([-11.5,2,0]) cylinder (h = 4, r=10, center = true);
        translate ([11.5,2,0]) cylinder (h = 4, r=10, center = true);
}

# cube([1.5,6,1], center=true);

translate([0,-10,0])  cube([7,1,2.25], center=true);
translate([-3.5,-10,0])  cube([7,1,1.75], center=true);
}


