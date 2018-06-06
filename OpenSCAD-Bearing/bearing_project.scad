/*
Author: Radu Goada
Materie: Roboti Inteligenti, ANUL I MASTER
*/

include <units.scad>
include <materials.scad>

// Vizualizare rulmenti (cu functii, unitati, materiale, culoare, etc)
test_bearing();
test_bearing_hole();

module test_bearing(){
    bearing();
    bearing(pos=[5*cm, 0,0], angle=[90,0,0]);
    bearing(pos=[-3.5*cm, 0,0], model=688);
}

module test_bearing_hole(){
    
rotate_extrude(){
difference()
   {
    union(){      
        translate([10.5,0,0]) square ([5,7], center = true);
        translate([19.5,0,0]) square ([5,7], center = true);
        }
    translate([14.75,0,0]) circle(3.5);
   }
}

for(ball = [0:45:360] )
{
    rotate([0,0,ball])
    translate([14.75,0,0])
    color( "Gray", 1.0 )
    sphere(r=3.25);
    }
    
}

BEARING_INNER_DIAMETER = 0;
BEARING_OUTER_DIAMETER = 1;
BEARING_WIDTH = 2;

// Model rulment cunoscut pentru skateboards (in general)
SkateBearing = 608;

function bearingDimensions(model) =
  model == 603 ? [3*mm,  9*mm,  5*mm]:
  model == 604 ? [4*mm, 12*mm,  4*mm]:
  model == 605 ? [5*mm, 14*mm,  5*mm]:
  model == 606 ? [6*mm, 17*mm,  6*mm]:
  model == 607 ? [7*mm, 19*mm,  6*mm]:
  model == 608 ? [8*mm, 22*mm,  7*mm]:
  model == 609 ? [9*mm, 24*mm,  7*mm]:

  model == 623 ? [3*mm, 10*mm,  4*mm]:
  model == 624 ? [4*mm, 13*mm,  5*mm]:
  model == 625 ? [5*mm, 16*mm,  5*mm]:
  model == 626 ? [6*mm, 19*mm,  6*mm]:
  model == 627 ? [7*mm, 22*mm,  7*mm]:
  model == 628 ? [8*mm, 24*mm,  8*mm]:
  model == 629 ? [9*mm, 26*mm,  8*mm]:

  model == 633 ? [3*mm, 13*mm,  5*mm]:
  model == 634 ? [4*mm, 16*mm,  5*mm]:
  model == 635 ? [5*mm, 19*mm,  6*mm]:
  model == 636 ? [6*mm, 22*mm,  7*mm]:
  model == 637 ? [7*mm, 26*mm,  9*mm]:
  model == 638 ? [8*mm, 28*mm,  9*mm]:
  model == 639 ? [9*mm, 30*mm, 10*mm]:

  model == 673 ? [3*mm,  6*mm,  2.5*mm]:
  model == 674 ? [4*mm,  7*mm,  2.5*mm]:
  model == 675 ? [5*mm,  8*mm,  2.5*mm]:
  model == 676 ? [6*mm, 10*mm,  3*mm]:
  model == 677 ? [7*mm, 11*mm,  3*mm]:
  model == 678 ? [8*mm, 12*mm,  3.5*mm]:

  model == 683 ? [3*mm,  7*mm,  3*mm]:
  model == 684 ? [4*mm,  9*mm,  4*mm]:
  model == 685 ? [5*mm, 11*mm,  5*mm]:
  model == 686 ? [6*mm, 13*mm,  5*mm]:
  model == 687 ? [7*mm, 14*mm,  5*mm]:
  model == 688 ? [8*mm, 16*mm,  5*mm]:
  model == 689 ? [9*mm, 17*mm,  5*mm]:

  model == 693 ? [3*mm,  8*mm,  4*mm]:
  model == 694 ? [4*mm, 11*mm,  4*mm]:
  model == 695 ? [5*mm, 13*mm,  4*mm]:
  model == 696 ? [6*mm, 15*mm,  5*mm]:
  model == 697 ? [7*mm, 17*mm,  5*mm]:
  model == 698 ? [8*mm, 19*mm,  6*mm]:
  model == 699 ? [9*mm, 20*mm,  6*mm]:

  [8*mm, 22*mm, 7*mm]; // dimensiunea de baza al unui rulment


function bearingWidth(model) = bearingDimensions(model)[BEARING_WIDTH];
function bearingInnerDiameter(model) = bearingDimensions(model)[BEARING_INNER_DIAMETER];
function bearingOuterDiameter(model) = bearingDimensions(model)[BEARING_OUTER_DIAMETER];

module bearing(pos=[3,40,0], angle=[0,0,0], model=SkateBearing, outline=false,
                material=Steel, sideMaterial=Brass) {
    model =
    model == "Skate" ? 608 :
    model;

  w = bearingWidth(model);
  innerD = outline==false ? bearingInnerDiameter(model) : 0;
  outerD = bearingOuterDiameter(model);

  innerRim = innerD + (outerD - innerD) * 0.2;
  outerRim = outerD - (outerD - innerD) * 0.2;
  midSink = w * 0.1;

  translate(pos) rotate(angle) union() {
    color(material)
      difference() { 
                    
        // Inelul de baza al rulmentului
        Ring([0,0,0], outerD, innerD, w, material, material);

        if (outline==false) {
          // Invelisul exterior metalic al rulmentului
          Ring([0,0,-epsilon], outerRim, innerRim, epsilon+midSink, sideMaterial, material);
          Ring([0,0,w-midSink], outerRim, innerRim, epsilon+midSink, sideMaterial, material);
        }
      }
  }

  module Ring(pos, od, id, h, material, holeMaterial) {
    color(material) {
      translate(pos)
        difference() {
          cylinder(r=od/2, h=h,  $fs = 0.01);
          color(holeMaterial)
           translate([0,0,-10*epsilon])
            cylinder(r=id/2, h=h+20*epsilon,  $fs = 0.01); 
         }
    }
  } 

}