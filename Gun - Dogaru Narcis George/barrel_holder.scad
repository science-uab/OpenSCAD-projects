//Author Dogaru Narcis George

module barrel_holder() {
    
    difference() {
    
        union() {
            difference() {
                
                union() {
                    D();
                    translate([17,2.5,-8.5])
                    rotate([90,0,0])
                    cylinder(h=5,r=3,$fn=30);
                    
                    translate([9,2.5,-8.5])
                    rotate([90,0,0])
                    cylinder(h=5,r=3,$fn=30);
                    
                    translate([7,2.5,-2.5])
                    rotate([90,0,0])
                    cylinder(h=5,r=3,$fn=30);
                    
                    translate([-17,-2,-8])
                    rotate([90,0,0])
                    cylinder(h=3,r=1.5,$fn=30);
                }
                
                translate([17,10,-8.5])
                rotate([90,0,0])
                cylinder(h=15,r=2.5,$fn=30);
                
                translate([9,10,-8.5])
                rotate([90,0,0])
                cylinder(h=15,r=2.5,$fn=30);
                
                translate([7,10,-2.5])
                rotate([90,0,0])
                cylinder(h=15,r=2.5,$fn=30);
            }
            
            translate([7,-1,-2.5])
            rotate([90,0,0])
            cylinder(h=0.1,r=3,$fn=30);
        }
        
        translate([7,0,-2.5])
        rotate([90,0,0])
        cylinder(h=10,r=1.5,$fn=30);
        
        translate([-21,0,-5])
        cube([10,10,10]);
    
    }
}

module A() {
    difference() {
        union() {
            difference() {
                cube([40,5,24], center=true);
                
                translate([-14,0,5]) 
                cube([13,6,15], center=true);
                
                translate([-12,0,-12])
                cube([20,6,5], center=true);
            }
            
            translate([-15,0,6])
            hull() {
                translate([0,0,-15])
                cube([10,5,1], center=true);
                
                translate([-4,0,-21])
                cube([4,5,1], center=true);
            }
        }
        
        translate([-30,-5,-16])
        cube([10,11,10]);
    }
}

module B() {
    union() { 
      difference() {
            A();
            
            translate([-0.5,0.5,0.5])
            A();
            
        }
        
        translate([-2.5,-2.5,-12])
        cube([0.5,5,3]);
        
        translate([-20,-2.5,-3])
        cube([7,5,0.5]);
        
    }
}

module C() {
    union() {
        difference() {
            union() {
                B();
                
                translate([-7.5,0,7])
                rotate([0,90,0])
                cylinder(h=27.5,r=6,$fn=30);
                
                translate([2,0,7])
                rotate([0,90,0])
                cylinder(h=11,r=6.5,$fn=30);      
            }
            
            translate([-10,1,7])
            rotate([0,90,0])
            cylinder(h=40,r=5,$fn=30);
            
            translate([-11,2,0])
            cube([30,20,20]);
            
            translate([2,2,7])
            rotate([0,90,0])
            cylinder(h=11,r=6,$fn=30);
            
            translate([11,2,0])
            cube([10,10,50]);
            
            translate([-7.9,-7.5,0])
            cube([10,5,15]);
            
            translate([-7.9,-2,0])
            cube([10,20,10]);
        }
                
        translate([-7.5,-2.5,2])
        cube([10,0.5,10]);
        
        translate([2.1,-4,2])
        cube([0.1,2,10]);
    }
}

module D() {
    union() {
        C();
        translate([2,-2.5,0.8])
        cube([18,4,0.5]);
        
        translate([2,-2.5,1])
        rotate([0,141.2,0])
        cube([18,5,0.5]);
        
        union() {
            translate([18.5,4,-1])
            rotate([90,0,0])
            cylinder(h=2,r=1,$fn=30);
            
            translate([18.5,5,-1])
            rotate([90,0,0])
            cylinder(h=1,r1=0.2, r2=1,$fn=30);
            
            translate([17,-2.5,-2.5])
            cube([3,5,3]);

        }
        
        translate([-19.5,0,-9.5])
        union() {
            translate([20.5,4,-1])
            rotate([90,0,0])
            cylinder(h=2,r=1,$fn=30);
            
            translate([20.5,5,-1])
            rotate([90,0,0])
            cylinder(h=1,r1=0.2, r2=1,$fn=30);
            
            translate([19,-2.5,-2.5])
            cube([3,5,3]);
        }
        
        translate([-37,0,-13])
        union() {
            translate([18.5,4,-1])
            rotate([90,0,0])
            cylinder(h=2,r=1,$fn=30);
            
            translate([18.5,5,-1])
            rotate([90,0,0])
            cylinder(h=1,r1=0.2, r2=1,$fn=30);
            
            translate([17,-2.5,-2.5])
            cube([3,5,3]);
        }
    }
}