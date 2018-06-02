//Author Dogaru Narcis George
module bullet_propeller_B(height, diameter, faces, cutter) {
    
    difference() {
        union() {
            difference() {
                rotate([0,90,0])
                cylinder(h = height, d = diameter, $fn=30);
                
                translate([-1,0,0])
                rotate([0,90,0])
                cylinder(h = height, d = diameter - 1, $fn=30);
            }
            
            union () {
                difference() {
                    color("blue")
                    translate([height,0,0])
                    rotate([0,90,0])
                    cylinder(h = height/6, d = diameter, $fn=30);
                    
                    color("blue")
                    translate([height + 1,0,0])
                    rotate([0,90,0])
                    cylinder(h = height/4, d = diameter - 1, $fn=30);
                }
                
                color("blue")
                translate([height + 1,0,0])
                rotate([0,90,0])
                cylinder(h = height/8, d = diameter/3, $fn=30);
            }
            
            translate([cutter/4,0,-height/2.5])
            cube([cutter/2,diameter/3,cutter], center=true);
            
            translate([cutter/4,0,-height/2])
            rotate([90,0,0])
            cylinder(h = diameter/3, d = cutter/2, $fn=30, center=true);
        }
        
            translate([-1,0,0])
            rotate([0,90,0])
            cylinder(h = height, d = diameter - 1, $fn=30);
    }
}