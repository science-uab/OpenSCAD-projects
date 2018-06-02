//$fn=100;

// Ear cup
module ear_cup(width, height){
    // Exteranl part of cup
    external_part_depth = 70;
    //height=160;
    //width=120;
    
    difference(){        
        union(){    
            translate([-15, 0, 0])
            hull(){
                translate([-20,0,0]) resize([external_part_depth*2*0.35, 0, height*0.85]) sphere(60*0.85);
                resize([80, 0, height]) sphere(60);
                
                translate([10,0,0]) resize([80, 0, height]) sphere(60);
            }
        }
        
        translate([external_part_depth/2, 0, 0]) cube([external_part_depth, width+20, height+20], center=true);
    }
    
    
    translate([0, 0, 0])
    rotate([0, 90, 0])
    resize([height+10, width+10, 35])
    rotate_extrude()
    translate([height*1.6, 0, 0])
    circle(external_part_depth);

}