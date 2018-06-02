// Melentii Evghenii

module phone(clr){
    body(clr, 137, 69, 10, 3);
    translate([13, 24, 9]) rotate([0, 0, 90]) color("White") logo("lenovo", 5, ":style=Bold");
    screen("White");
    rear_camera(10,10);
}

module body(clr, height, width, thickness, radius){
    color(clr) hull(){ 
        translate([radius, radius, 0]) cylinder(h=thickness, r=radius);
        translate([height-radius, radius, 0]) cylinder(h=thickness, r=radius);
        translate([radius, width-radius, 0]) cylinder(h=thickness, r=radius);
        translate([height-radius, width-radius, 0]) cylinder(h=thickness, r=radius);
    } 
}

module screen(clr){
    translate([15, 5, 9]) color(clr) cube([105, 60, 1]);
}

module logo(txt, s, style = "") {
    linear_extrude(height = 1)
      text(txt, size = s, font = str("Liberation Sans", style), $fn = 16);
}

module rear_camera(height, width){
    translate([10, 29, 0]) body("Black", height, width, 2, 2);
    color("White") translate([15, 34, 0]) cylinder(2, 2);
}

phone("Silver");