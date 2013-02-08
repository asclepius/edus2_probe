$fn = 20;
difference() {
        cylinder (h = 3, r=10, center = true);
        translate ([0,6,0]) cube([11.5,8,3], center=true);
        translate ([-11.5,2,0]) cylinder (h = 3, r=10, center = true);
        translate ([11.5,2,0]) cylinder (h = 3, r=10, center = true);
}