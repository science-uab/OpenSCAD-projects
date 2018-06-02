//Author Dogaru Narcis George
module bullet_launcher(thick) {

    union() {
        A(thick);
        
        translate([15,0,6])
        cube([25,thick/10,15],center=true);
        
        translate([17,0,18])
        cube([21,thick/10,15],center=true);
        
        translate([18.5,0,24])
        cube([18,thick/10,15],center=true);
        
        translate([19,0,31])
        rotate([0,90,0])
        cube([2,thick,16],center=true);
        
        translate([40,0,6])
        cube([3,thick/2,10], center=true);

        translate([26,0,-3])
        rotate([90,90,0])
        cylinder( h=thick, r1 = 5, r2 = 5, $fn = 3, center=true );
        
        translate([4,0,3])
        rotate([90,0,0])
        cylinder(h = thick * 2, r = 4, $fn=30, center=true); 
        
        translate([13,thick/2,27])
        rotate([90,0,0])
        cylinder(h = thick, r = 4, $fn=30, center=true); 
    }
}

module A(thick) {
    difference() {
        hull() {
            rotate([90,0,0])
            cylinder(h = thick, r = 2, center=true, $fn=30);
            
            translate([10,0,30])
            rotate([90,0,0])
            cylinder(h = thick, r = 2, center=true, $fn=30);
            
            translate([30,0,30])
            rotate([90,0,0])
            cylinder(h = thick, r = 2, center=true, $fn=30);
            
            translate([40,0,0])
            rotate([90,0,0])
            cylinder(h = thick, r = 2, center=true, $fn=30);
        }  
        
        translate([5,0,3])
        hull() {
            rotate([90,0,0])
            cylinder(h = thick * 5, r = 2, center=true, $fn=30);
            
            translate([10,0,30])
            rotate([90,0,0])
            cylinder(h = thick * 5, r = 2, center=true, $fn=30);
            
            translate([30,0,30])
            rotate([90,0,0])
            cylinder(h = thick * 5, r = 2, center=true, $fn=30);
            
            translate([40,0,0])
            rotate([90,0,0])
            cylinder(h = thick * 5, r = 2, center=true, $fn=30);
        }  
    }
}