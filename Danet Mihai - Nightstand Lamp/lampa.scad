module base(height, radius)
{
    difference(){
        color("bisque") resize(newsize=[height,height,radius])  sphere(r=radius);
        translate([-20,-20,-8]) color("black") cube([40,40,5]);
    }
}

module support(height, bottomRadius, topRadius, culoare)
{
    color(culoare) cylinder(h = height, r1 = bottomRadius, r2 = topRadius);
}

module thinTopSupport()
{
    color("white") 
    translate([3.5,0,18.7])
        rotate([0,90,0])
            cylinder(2.5,0.2,0.2);
    
    color("white")
    translate([6,0,18.7])
        rotate([0,110,0])
            cylinder(10,0.2,0.2);
}

module topSupport(height, bottomRadius, topRadius)
{
    
    difference(){
       color("white") cylinder(height, bottomRadius, topRadius);
        cylinder(height, bottomRadius-1.7, topRadius-1.7);
    }
}

module top()
{
    difference(){
        color("bisque") cylinder(20,16,16);
       color("white") translate([0,0,-0.1]) cylinder(20.2,15.5,15.5);
    }
}    

base(30, 10);
translate([0,0,5]) support(5,1,1,"LightGrey");
translate([0,0,10]) support(1,2,3,"black");
translate([0,0,11]) support(10,3,3,"black");
translate([0,0,16]) support(1,5,5,"black");
translate([0,0,17]) support(1,3.5,3.5,"black");

translate([0,0,18]) topSupport(0.5,5,5);
translate([0,0,15]) top();

for( i=[1:1:3] ) {
    rotate([0,0,i*360/3]) thinTopSupport();
}