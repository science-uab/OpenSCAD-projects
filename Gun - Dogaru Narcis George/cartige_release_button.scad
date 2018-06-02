//Author Dogaru Narcis George
module cartige_release(radius,h1,h2,ajust) {
    
    difference() {
        cylinder(h=h1, r=radius,center=true,$fn=30);
        translate([0,0,-6])
        cylinder(h=h1 + 10, r=radius - radius/5,center=true,$fn=30);
    }
    
    translate([0,0,h1/1.5])
    cylinder(h=h2, r=radius - radius/5,center=true,$fn=30);
    
    translate([-radius*ajust,0,-h1/2.3])
    rotate([-60,0,0])
    rotate([0,90,0])
    cylinder(h=h2, r=radius - radius/2,center=true,$fn=3);
}