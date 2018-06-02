include <write/Write.scad>;
Length = 170;
Width  = 15;
Thickness = 2;

Scale = 1;
UnitNumbersEvery=10;

Subdivisions=10;
ScaleThickness=0.7;

Clearance=1.2;
Offset=0.15;

// Main body
module main_body(){
cube([Length,Width,Thickness]);
rotate([45,0,0]) cube([Length,Thickness/sqrt(2),Thickness/sqrt(2)]);
translate([0,Width,0]) rotate([45,0,0]) cube([Length,Thickness/sqrt(2),Thickness/sqrt(2)]);
}
//Top Caliper
module top_caliper(){
linear_extrude(height = Thickness) polygon([[0,0],[-Offset,0],[-Offset,-40],[-10,-30],[-20,0],[-20,Width],[-15+Offset,Width],[-15+Offset,Width+15],[-10,Width+5],[-10,Width],[0,Width]]);
}
// Main Body Scale
module body_scale(){
for(i=[0:Scale*UnitNumbersEvery/Subdivisions:Length-Scale*UnitNumbersEvery/Subdivisions]){translate([i+1,-1,Thickness-ScaleThickness]) cube([0.3,Width*StripeLenght(i/Scale),ScaleThickness*2]);}
}
// Main Body Scale Numbers
module body_scale_numbers(){
for(i=[0:Scale*UnitNumbersEvery:Length-Scale*UnitNumbersEvery]){
translate([i+2,Width/1.5,Thickness-ScaleThickness]) write(str(floor(i/Scale)),h=Width/4,t=ScaleThickness*2,font="write/Letters.dxf");
echo(i);
}
}

//Slider bottom part
module bottom_part(){
translate([30,-30-Width,0]) linear_extrude(height = Thickness) polygon([[Offset,-Thickness],[Offset,-40],[10,-30],[20,-Thickness],[50,-Thickness],[50,Width+Thickness+Clearance],[-15-Offset,Width+Thickness+Clearance],[-15-Offset,Width+15],[-20,Width+10],[-20,-Thickness]]);
}

//Slider
module slider(){    
difference(){
union(){
//Thumb grip
translate([75,-30-Thickness-Width]) cylinder(r=4,h=Thickness);

translate([30,-30-Width,Thickness]) linear_extrude(height = Thickness) polygon ([[Offset,-Thickness],[Offset,-40],[10,-30],[20,-Thickness],[50,-Thickness],[50,Width+Thickness+Clearance],[0,Width+Thickness+Clearance]]);
}
// Scale Slider
translate([30+1,-30-Width,0]) for(i=[0:Subdivisions]){
translate([i*Scale*UnitNumbersEvery/Subdivisions*1.9,-StripeLenght(i)*4,Thickness*2-ScaleThickness]) cube([0.3,Width,ScaleThickness*2]);}

translate([30,-30-Width,Thickness]) {
translate([-1,0,0]) cube([60,Width+Clearance,Thickness*2]);
rotate([45,0,0]) cube([60,Thickness/sqrt(2),Thickness/sqrt(2)]);
translate([0,Width+Clearance,0]) rotate([45,0,0]) cube([60,Thickness/sqrt(2),Thickness/sqrt(2)]);
}
}
}

  function StripeLenght(Value)=0.4+0.3*floor(1/(((Value)%10)+1))+0.25*floor(1/(((Value)%5)+1))+0.05*floor(1/(((Value)%2)+1));  

// Module call
color([0.7,0.8,0.7]) {
difference(){
union(){
main_body();
top_caliper();
}
body_scale();
body_scale_numbers();
}
bottom_part();
slider();
}