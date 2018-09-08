function mm(i) = i*25.4;

module rounded(size, r) {
    union() {
        translate([r, 0, 0]) cube([size[0]-2*r, size[1], size[2]]);
        translate([0, r, 0]) cube([size[0], size[1]-2*r, size[2]]);
        translate([r, r, 0]) cylinder(h=size[2], r=r);
        translate([size[0]-r, r, 0]) cylinder(h=size[2], r=r);
        translate([r, size[1]-r, 0]) cylinder(h=size[2], r=r);
        translate([size[0]-r, size[1]-r, 0]) cylinder(h=size[2], r=r);
    }
}

module bit() {
    w = mm(1/4);
    difference() {
        translate([-w/2, 0, 0]) cube([w, mm(1), w]);
        translate([-mm(5/128), 0, 0]) rotate([0, 0, 135]) cube([w, w, w]);
        translate([mm(5/128), 0, 0]) rotate([0, 0, -45]) cube([w, w, w]);
    }
}

module kw1(bits) {
    thickness = mm(0.080);
    length = mm(9/8);
    width = mm(.337);
    
    shoulder = mm(.247);
    pin_spacing = mm(.15);
    depth_inc = mm(.023);

    fudge = 0.5;
    
    h_l = mm(1);
    h_w = mm(1);
    h_d = mm(1/16);
    difference() {
        union() {
            translate([-h_l, -h_w/2 + width/2, 0]) rounded([h_l, h_w, thickness], mm(1/4));
            // cut a little off the tip to avoid going too long
            cube([length - mm(1/64), width, thickness]);
        }

        translate([length, mm(1/8), 0]) {
            rotate([0, 0, 45]) cube([10, 10, thickness]);
            rotate([0, 0, 225]) cube([10, 10, thickness]);
        }
        

        translate([-h_l + mm(3/16), width/2, 0]) cylinder(h=thickness, r=mm(1/8));
        union() {
            translate([-h_d, mm(.105), mm(.025)]) rotate([225, 0, 0]) cube([length + h_d, width, width]);
            translate([-h_d, mm(.105), mm(.05)]) rotate([260, 0, 0]) cube([length + h_d, thickness/2, mm(1/32)]);
            translate([-h_d, mm(.105), 0]) cube([length + h_d, mm(7/128), mm(.05)]);
            translate([-h_d, mm(.105) + mm(7/128), mm(.05)]) rotate([225, 0, 0]) cube([length + h_d, mm(3/64), thickness]);
        }
        
        translate([-h_d, width - mm(9/64), mm(.043)]) {
            cube([length + h_d, width - (width - mm(10/64)), thickness]);
            rotate([50, 0, 0]) cube([length + h_d, width, thickness]);
        }
        
        union() {
            translate([-h_d, mm(0.015), mm(.03)]) cube([length + h_d, mm(15/256), thickness]);
            translate([-h_d, mm(0.015) + mm(13/256), thickness - mm(1/64)]) rotate([45, 0, 0]) cube([length + h_d, mm(1/16), mm(1/16)]);
        }

        for (b = [0:4]) {
            translate([shoulder + fudge + b*pin_spacing, width - mm(.008) - (bits[b] - 1)*depth_inc - fudge, 0]) bit();
        }
    }
}

kw1([1,3,3,2,3]);
