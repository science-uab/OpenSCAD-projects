//Author Dogaru Narcis George
use <barrel.scad>
use <rubber.scad>
use <barrel_holder.scad>
use <barrel_holdeR_B.scad>
use <propeller.scad>
use <propeller_B.scad>
use <left_side.scad>
use <trigger.scad>
use <launcher.scad>
use <tl_linker.scad>
use <spring.scad>
use <right_side.scad>
use <screw.scad>
use <cartige_release_button.scad>
use <up_left_side.scad>
use <up_right_side.scad>
use <silver_piece.scad>

difference() {
    main();

//    translate([20,-29,0])
//    cube([200,50,200],center=true);
    
//    mirror([0,1,0])
//    translate([20,-22,0])
//    cube([200,50,200],center=true);
}
    


module main() {
    left_group();
     
    right_group();
    
    color("Silver")
    translate([50,-3.5,14])
    silver_piece();
    
    barrel_group();
    
    bullet_launcher_group();
    
    trigger_part_group();
    
    color("DarkSlateGray")
    translate([-1,-2,-20])
    rotate([-90,20,0])
    cartige_release(2.8,10,5,1.5);

    color("lime")
    add_springs();
    
    color("Navy")
    add_screws();
}

module barrel_group() {
    translate([20,-1.5,-134])
    scale(3,1,1)
    union() {
        color("red")
        translate([13,-.5,50])
        rotate([0,90,0])
        bullet_barrel(19,3,30);
        
        color("blue")
        translate([2.5,-.5,50])
        rotate([0,90,0])
        rubber_barrel(2.2,3,30);
        
        color("green")
        translate([.5,-1,48])
        scale(0.3,1,1)
        barrel_holder();
    
        color("green")
        translate([.5,-0.1,48])
        scale(0.3,1,1)
        barrel_holder_B();
        
        color("DarkKhaki")
        translate([19.2,-.5,50])
        rotate([0,90,0])
        bullet_barrel(26,3.5,30);
    }
}
module bullet_launcher_group() {
    translate([20,-1.5,-134])
    scale(3,1,1)
    union() {
        translate([-2.5,0,0])
        color("orange")
        translate([-6.5,-.6,50])
        scale(0.3,1,1)
        bullet_propeller();
        
        translate([-9,0,0])
        color("yellow")
        translate([-12,-.6,50])
        scale(0.3,1,1)
        bullet_propeller_B(20,14,30,4);
    }
}
module trigger_part_group() {
    color("purple")
    translate([29,-4,-9.3])
    scale(0.38,1,1)
    rotate([0,30,0])
    rotate([0,0,180])
    trigger(6, 3.5);
    
    translate([-32,-3,4.5])
    rotate([180,0,180])
    color("cyan")
    scale(0.35,0,0)
    bullet_launcher(15);
    
    translate([15,2,4.2])
    scale(.8,0,0)
    rotate([180,-10,0])
    color("LightSteelBlue")
    linker(65,2.5);
}
module left_group() {
    color("Grey")
    translate([30,0,14])
    ul_left_side();
    
    color("DimGray")
    left_side();
}

module right_group() {
    color("Grey")
    translate([30,-7,14])
    ul_right_side();

    color("DimGray")
    translate([0,-8,0])
    right_side();
}
module add_springs() {
    translate([-46,-3,-7.8])
    spring(2, 0.1, 39, 0.3, 30);
     
    translate([-45.5,-3,15.3])
    rotate([0,90,0])
    spring(5.3, 0.5, 15, 1, 30);
    
    translate([-1,0,-20])
    rotate([90,0,0])
    spring(2, 0.1, 39, 0.3, 30);
    
    translate([41,-3,16])
    rotate([0,90,0])
    spring(6, 0.5, 23, 3, 30);
}

module add_screws() {
    
    translate([-13,-16,-66])
    translate([-32,3,2.5])
    rotate([90,0,180])
    screw(15,30,0.2,0.5, 2, 1, 0.3);
    
    translate([-50,-7.5,11.5])
    rotate([90,0,180])
    screw(7.5,15,0.2,0.5, 2, 1, 0.3);
    
    translate([-52,-13.5,-1.1])
    rotate([90,0,180])
    screw(15,30,0.2,0.5, 2, 1, 0.3);
    
    translate([33.5,-7,-8])
    rotate([90,0,180])
    screw(5,10,0.2,0.5, 2, 1, 0.3);
    
    translate([36.8,-13.5,2.5])
    rotate([90,0,180])
    screw(18,36,0.2,0.5, 2, 1, 0.3);
    
    translate([90,-10,2])
    rotate([90,0,180])
    screw(13,25,0.2,0.5, 2, 1, 0.3);
    
    translate([-35,-6.5,38])
    rotate([90,0,180])
    screw(5,10,0.1,0.5, 1.5, 1, 0.3);
}

