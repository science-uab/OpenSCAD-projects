//Author Dogaru Narcis George
module right_side() {
    mirror([0,1,0])
    partF();   
}

module partA() {
    difference() {
        cube([150,10,10],center=true);
        
        translate([0,-1,1])
        cube([200,10,10],center=true);   
    }
}


module partB() {
    
    difference() {
        translate([0,0,50])
        rotate([90,0,0])
        cylinder(h = 5, r = 10, center=true, $fn=30);
        
        translate([0,0,75])
        cube([50,20,50], center=true);
        
        translate([10,0,46])
        rotate([90,0,0])
        cylinder(h = 10, r = 5, center=true, $fn=30);
        
        
        translate([-2,0,9])
        scale(1.2,0,0)
        hull() {
            
            translate([0,0,30])
            rotate([90,0,0])
            cylinder(h = 10, r = 3, center=true, $fn=30);
            
            translate([2,0,30])
            rotate([90,0,0])
            cylinder(h = 10, r = 3, center=true, $fn=30);
            
            translate([1,0,30])
            rotate([90,0,0])
            cylinder(h = 10, r = 3.1, center=true, $fn=30);
        }
    }
}


module partC() {
    union() {
        difference() {
            translate([-25,-0.5,-30])
            rotate([0,15,0])
            cube([50,11,90],center=true);
            
            translate([-32,0,-80])
            cube([100,50,30],center=true);
            
            translate([-32,-5,10])
            cube([100,50,30],center=true);
        }
        
        difference() {
            translate([-50,-0.5,-17])
            cube([50,11,25],center=true);
            
            translate([-68,0,-24])
            rotate([90,0,0])
            cylinder(h=20,r = 20, center=true);
        }
            

    }
}


module fragmentA() {
    difference() {
        union() {
            partA();
            
            difference() {
                translate([21,-9,-151])
                scale(3,0,1)
                partB();
                
                translate([18,-16,-10])
                cube([100,20,50],center=true);
                
            }
                 
            partC();     
       
        }
        translate([-62,-6.05,-80])
        rotate([0,15,0])
        cube([45,10,90]);
        
        translate([18,-4,6])
        cube([60,15,20],center=true);
        
       translate([-88,-10,0])
       rotate([0,30,0])
       cube([25,30,30]);
        
        translate([-49,-11,-12])
        cube([10,15,15]);
    }
    
    translate([-52,4,-1])
    rotate([90,0,0])
    cylinder(h=11, r=2, $fn=30);

    translate([-49,-6,-12])
    cube([1,10,17]);
    
    translate([-49,-6,-8])
    rotate([0,90,0])
    cube([1,10,5]);
    
    translate([-44,-6,-9])
    rotate([0,0,0])
    cube([1,10,5]);
    
    translate([-46.5,-1,-8])
    rotate([0,0,0])
    cube([1,5,5]);
}


module partD() {
    fragmentA();
    
    
    translate([-61.5,-6,-4])
    rotate([0,30,0,])
    cube([1,11,11]);
    
    translate([-60,-6,-65])
    rotate([0,90,0,])
    cube([1,11,18]);

    translate([-43,-1,-65])
    rotate([0,15,0,])
    cube([1,5,50]);
    
    translate([-29,-1,-17])
    rotate([0,-90,0,])
    cube([1,5,20]);
    
    translate([-16.5,2,-65])
    rotate([0,15,0,])
    cube([1,2.5,42]);
}

module fragmentB() {
    union() {
        partD();
        
        translate([-48,3.5,5])
        cube([65,0.5,3]);
            
        translate([33,3.5,3])
        cube([12,0.5,5]);
        
        translate([33,4,7.5])
        rotate([90,120,90])
        cylinder(h=12,r1=1,r2=1,$fn=3);
        
        translate([-56,-6,4])
        cube([10,10,1]);
        
        hull() {
            color("red")
            translate([-56,-6,4])
            cube([10,5,1]);
            
            translate([-50,-6,20])
            cube([4,5,1]);
        }
        
        hull() {
            translate([-54,-3.4,16])
            rotate([90,0,0])
            cylinder(h=5,r=4,$fn=30, center=true);
            
            translate([-54,-3.4,10])
            rotate([90,0,0])
            cylinder(h=5,r=1,$fn=30, center=true);
        }
    }
}

module partE() {
    difference() {
        union() {
            difference() {
                fragmentB();
                
                translate([-100,-24,-70])
                cube([200,20,100]);
            }
            
            
            difference() {
                translate([29.5,2,2.5])
                rotate([90,0,0])
                cylinder(h=5,r=2.5,$fn=30,center=true);
                
                translate([29.5,-1,2.5])
                rotate([90,0,0])
                cylinder(h=15,r=2.3,$fn=30,center=true);
            }
                
                
            difference() {
                translate([36.8,2,2.5])
                rotate([90,0,0])
                cylinder(h=5,r=2.5,$fn=30,center=true);
                
                translate([36.8,-1,2.5])
                rotate([90,0,0])
                cylinder(h=15,r=2.3,$fn=30,center=true);

            }
        }
        
        translate([15.5,-12,-6])
        cube([14,20,5],center=true);
    
    }  
}

module fragmentC() {
    difference() {
        union() {
            
            difference() {
                partE();
                
                difference() {
                    translate([16,2,-2])
                    rotate([90,0,0])
                    cylinder(h=4,r=2.3,$fn=30,center=true);
                    
                    translate([16,2,-2])
                    rotate([90,0,0])
                    cylinder(h=5,r=1.5,$fn=30,center=true);

                }
                
                translate([33.5,-5,-8])
                rotate([90,0,0])
                cylinder(h=5,r=1.5,$fn=30,center=true);

            }
            
            translate([-2,0,0.5])
            difference() {
                translate([19,3,-2.3])
                rotate([90,0,0])
                cylinder(h=3,r=1.5,$fn=30,center=true);
                
                translate([19,3,-2.3])
                rotate([90,0,0])
                cylinder(h=6,r=1.3,$fn=30,center=true);
            }
            
            translate([-1,0,1])
            difference() {
                translate([-32,3,2.5])
                rotate([90,0,0])
                cylinder(h=3,r=2,$fn=30,center=true);
            
                translate([-32,3,2.5])
                rotate([90,0,0])
                cylinder(h=5,r=1.5,$fn=30,center=true);
            }

        }
        
        translate([-52,-2,-1.1])
        rotate([90,0,0])
        cylinder(h=5,r=1,$fn=30,center=true);


        translate([-50,-4,11.5])
        rotate([90,0,0])
        cylinder(h=5,r=1,$fn=30,center=true);
        
        translate([-43,-10,-81])
        cube([50,20,20]);
    }
    

        translate([-43,-4,-66])
        cube([1,9,5]);       

        translate([-13,-4,-66])
        difference() {
            translate([-32,3,2.5])
            rotate([90,0,0])
            cylinder(h=7,r=2,$fn=30,center=true);
        
            translate([-32,3,2.5])
            rotate([90,0,0])
            cylinder(h=20,r=1,$fn=30,center=true);
        }
}

module partF() {
    difference() {
        fragmentC();
        
        translate([-13,-4,-66])
        translate([-32,3,2.5])
        rotate([90,0,0])
        cylinder(h=30,r=1,$fn=30,center=true);
        
        translate([-50,-4,11.5])
        rotate([90,0,0])
        cylinder(h=20,r=1,$fn=30,center=true);
        
        translate([-52,-2,-1.1])
        rotate([90,0,0])
        cylinder(h=30,r=1,$fn=30,center=true);
        
        translate([33.5,-5,-8])
        rotate([90,0,0])
        cylinder(h=20,r=1,$fn=30,center=true);
        
        translate([36.8,-1,2.5])
        rotate([90,0,0])
        cylinder(h=15,r=1,$fn=30,center=true);
    }
}