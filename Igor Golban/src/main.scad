include <config.scad>
// figures
include <arc.scad>
include <ear_cup.scad>

// Head arc
module head_arc(width){    
    translate([0, width/2, 0])    
    rotate([0, -90, 90])
    for(i=[1:width]){
        translate([0,0,i]) resize([190, 230, 0]) arc(100, 4, 240); 
    }
}


translate([-80, 0, -50]) ear_cup(120, 160);
mirror([1,0,0]) translate([-80, 0, -50]) ear_cup(120, 160);


translate([0, 0, 60]) head_arc(35);




