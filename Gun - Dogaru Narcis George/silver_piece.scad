//Author Dogaru Narcis George
module silver_piece() {
   difference() {
      union() { 
        translate([6,0,10])
        rotate([0,90,0])
        cylinder(h=75,r=9,$fn=30,center=true);
          
        translate([0,0,6])
        cube([50,17,0.5],center=true);
      }
       
        translate([6,0,10])
        rotate([0,90,0])
        cylinder(h=90,r=8.5,$fn=30,center=true);
       
        translate([0,0,-9])
        cube([90,20,30],center=true);
   }
   

}