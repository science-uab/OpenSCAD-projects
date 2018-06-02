//Author Dogaru Narcis George
module ul_right_side() {
    mirror([0,1,0])
    difference() {
        union() {
            partB();
            
            translate([62.5,-1,-16])
            cube([45,5,1],center=true);
            
            translate([-1,0,-25])
            scale([1,1,2])
            hull() {
                translate([84,-3,23])
                rotate([90,0,0])
                cylinder(h=1,r=2,center=true,$fn=30);
                
                translate([74,-3,23])
                rotate([90,0,0])
                cylinder(h=1,r=2,center=true,$fn=30);
            }
            
            translate([-53,-2,22])
            hull() {
                translate([-9,0,3])
                cube([12,3,1],center=true);
                
                translate([-5,0,-1])
                cube([20,3,1],center=true);
            }
            
            translate([-62,-2.75,24])
            hull() {
                translate([-0.5,0,3])
                cube([8,1.5,1],center=true);
                
                translate([0,0,2])
                cube([11,1.5,1],center=true);
            }
            
            translate([-20,4.5,5])
            cube([2,1,15],center=true);
            
            translate([-50,4.5,5])
            cube([2,1,15],center=true);
            
            translate([14,4.5,5])
            cube([70,1,2],center=true);
            
            translate([-18,4.5,-1.5])
            cube([5,1,2],center=true);
            
            difference() {
                translate([60,4,-12])
                rotate([90,0,0])
                cylinder(h=8,r=2.5,$fn=30);
                

            }
        }
        
        translate([60,6,-12])
        rotate([90,0,0])
        cylinder(h=8,r=2.3,$fn=30);
        
        translate([60,10,-12])
        rotate([90,0,0])
        cylinder(h=15,r=1.3,$fn=30);
    
        translate([-65,5,24])
        rotate([90,0,0])
        cylinder(h=15,r=1.3,$fn=30);
    }
    


}

module partA() {
    difference() {
        translate([0,0,1.5])
        union() {
            translate([0,1,0])
            cube([170,12,20], center=true);
            
            translate([0,-5,8])
            rotate([0,90,0])
            cylinder(h=170,r=12,$fn=30,center=true);
            
            translate([40,-6,-18])
            cube([45,10,10]);
            
            translate([28.5,-2,-149.5])
            scale(3,1,1)
            translate([19,-.5,50])
            rotate([0,90,0])
            cylinder(h = .5, r = 2.5, center = true, $fn = 30);
            
            translate([28.5,-2,-163])
            scale(3,1,1)
            translate([19,-.5,50])
            rotate([0,90,0])
            cylinder(h = .5, r = 0.8, center = true, $fn = 30);
        }
        
        
        translate([0,-13.5,2])
        cube([200,20,50], center=true);
        
        translate([-98,0,0])
        rotate([0,30,0])
        cube([30,50,80],center=true);
        
        translate([-10,-2,-148])
        scale(3,1,1)
        translate([19,-.5,50])
        rotate([0,90,0])
        cylinder(h = 50, d = 4, center = true, $fn = 30);
            
    }
    
}

 module partB() {
     difference() {
        partA();
        
        translate([0,-3,-1])
        scale([0.95,0.95,0.95])
        partA();
        
        translate([-5,-2,-11.5])
        cube([170, 10,5],center=true);
        
        translate([-86,-5,-7])
        rotate([0,30,0])
        cube([20,10,40],center=true);
        
        translate([26,-3,12])
        rotate([0,90,0])
        cylinder(h=75, r=10, $fn=30, center=true);
         
        translate([5,-5,1.8])
        cube([150,20,18],center=true);
    }
    

 }