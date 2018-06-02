//Author Dogaru Narcis George
module linker(width, grip_radius) {
    
    difference() {
        union() {
            hull() {
                rotate([90,0,0])
                cylinder(h = grip_radius /3, r = grip_radius, center=true, $fn=30);
                
                translate([-width,0,0])
                rotate([90,0,0])
                cylinder(h = grip_radius /3, r = grip_radius, center=true, $fn=30);
            }
            
            translate([-width,grip_radius/2,0])
            rotate([90,0,0])
            cylinder(h = grip_radius, r = grip_radius, center=true, $fn=30);
        }
        
        translate([0,-1,0])
        rotate([90,0,0])
        cylinder(h = grip_radius * 3, r = grip_radius - 1, center=true, $fn=30);
        
        translate([-width,0,0])
        rotate([90,0,0])
        cylinder(h = grip_radius * 5, r = grip_radius - 1 , center=true, $fn=30);
    }
    

}