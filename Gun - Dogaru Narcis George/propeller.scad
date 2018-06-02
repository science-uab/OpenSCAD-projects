//Author Dogaru Narcis George
module bullet_propeller() {
    height = 30;
    diameter = 15;
    faces = 30; 
    hitter_h = 15; 
    hitter_d = 5;
    cutter = 5;
    
    difference() {
        union() {
            A(height, diameter, faces, hitter_h, hitter_d);
            
            hull() {
                translate([height/1.8,0,-height/10])
                cube([height/1.5, 1, 1], center=true);
                
                translate([height/1.9,0,-height/2])
                cube([height/4, 1, 1], center=true);
            }
            
            translate([0,diameter/3,-height/5])
            cube([height,3,1], center=true);
            
            translate([0,-diameter/3,-height/5])
            cube([height,3,1], center=true);
        }
        
        translate([-6,0,0])
        rotate([0,90,0])
        cylinder(h = height + 10, d = diameter - 1, center = true, $fn = faces);
        
        translate([-height/2,0,-diameter/2])
        cube([cutter,diameter/2,5],center=true);
    }

}

module A(height, diameter, faces, hitter_h, hitter_d) {
    difference() {
        union() {
            difference() {
                rotate([0,90,0])
                cylinder(h = height, d = diameter, center = true, $fn = faces);
                
                translate([-15,0,0])
                rotate([0,90,0])
                cylinder(h = height + 10, d = diameter - 1, center = true, $fn = faces);
            }
            
            translate([height/1.5,0,0])
            rotate([0,90,0])
            cylinder(h = hitter_h, d = hitter_d, center = true, $fn = 30);
        }
        
            translate([height/1.5,0,0])
            rotate([0,90,0])
            cylinder(h = hitter_h * 10, d = hitter_d - 1, center = true, $fn = 30);
    }
}