//Author Dogaru Narcis George
module trigger(grip_size, grip_radius) {
    
    difference() {
        rotate([90,0,0])
        cylinder(h=10, r= 40, center=true, $fn=30);
        
        translate([-10,0,-5])
        rotate([90,0,0])
        cylinder(h=10 + 10, r= 35, center=true);
        
        translate([0,0,51])
        rotate([0,-5,0])
        cube([100, 100, 100], center=true);

    }
    
    translate([37.5,0,1.5])
    rotate([90,0,0])
    cylinder(h = 10 * grip_size / 1.7, r = grip_radius, center=true, $fn=30);
    
    translate([38,-14,2])
    rotate([0,-45,0])
    hull() {
        rotate([90,0,0])
        cylinder(h = 10/9, r = grip_radius, center=true, $fn=30);
        
        translate([15,0,0])
        rotate([90,0,0])
        cylinder(h = 10/9, r = grip_radius, center=true, $fn=30);
    }
    
    translate([49,-16,13])
    rotate([90,0,0])
    cylinder(h = 5, r = grip_radius, center=true, $fn=30);
}