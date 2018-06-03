fid_spin(
    thikness = 20,
    center_hole_r = 32,
    weight_r = 48,
    weight_center_hole_r = 20,
    weight_chamfere_c_r = 24, 
    weight_chamfere_s_r = 12
);

// fid_spin(
//     thikness = 14,
//     center_hole_r = 12,
//     weight_r = 66,
//     weight_center_hole_r = 20,
//     weight_chamfere_c_r = 44, 
//     weight_chamfere_s_r = 14
// );

module fid_spin(thikness, center_hole_r = 32, weight_r = 48, weight_center_hole_r = 20, weight_chamfere_c_r = 24, weight_chamfere_s_r = 12) {
    fid_spin_body(
            center_hole_r = center_hole_r,
            weigh_holes_r = weight_r + 0.5,
            weigh_holes_height = thikness + 2,
            thickness = thikness
        );
    translate([0,0,-32]){
        weights(
            weight_center_hole_r = weight_center_hole_r,
            weight_chamfere_c_r = weight_chamfere_c_r,
            weight_chamfere_s_r = weight_chamfere_s_r,
            weight_thickness = thikness,
            weight_r = weight_r
        );
    }
}

module fid_spin_body(thickness, center_hole_r, weigh_holes_r, weigh_holes_height) {

    difference() {
        difference() {
            translate([-180,-150,0]) {
                linear_extrude(height = thickness, center = true, $fn = 100, convexity = 10)import(file = "res/fid-spin-from-png.dxf");
            }
            translate([0,0,-32]){
                weigh_holes(height = weigh_holes_height, r = weigh_holes_r);
            }
        }
        cylinder(h = 22, r1 = center_hole_r, r2 = center_hole_r, center = true);
    }
}

module weight_shape(height, r) {
        cylinder(h = height, r1 = r, r2 = r, center = true);
}

module chamfere(c_r, s_r) {
    minkowski() {
        cylinder(h = 2, r1 = c_r, r2 = c_r, center = true);
        sphere($fn = 0, $fa = 12, $fs = 2, r = s_r);
    }
}

module weight(weight_thickness, weight_r, weight_center_hole_r, chamfere_c_r, chamfere_s_r) {    
    difference() {
        difference() {
            difference() {
                weight_shape(height = weight_thickness, r = weight_r);
                translate([0,0,16])chamfere(c_r = chamfere_c_r, s_r = chamfere_s_r);
            }
            translate([0,0,-16])chamfere(c_r = chamfere_c_r, s_r = chamfere_s_r);
        }
        cylinder(h = 12, r1 = weight_center_hole_r, r2 = weight_center_hole_r, center = true);
    }
}

module weights(weight_thickness, weight_r, weight_center_hole_r, weight_chamfere_c_r, weight_chamfere_s_r) {
    //blue
    translate([92,-53,32]) {
        color([0,0,1])weight(weight_thickness, weight_r, weight_center_hole_r, chamfere_c_r = weight_chamfere_c_r, chamfere_s_r = weight_chamfere_s_r);
    }

    //red
    translate([-92,-53,32]) {
        color([1,0,0])weight(weight_thickness, weight_r, weight_center_hole_r, chamfere_c_r = weight_chamfere_c_r, chamfere_s_r = weight_chamfere_s_r);
    }

    //green
    translate([0,109,32]) {
        color([0,1,0])weight(weight_thickness, weight_r, weight_center_hole_r, chamfere_c_r = weight_chamfere_c_r, chamfere_s_r = weight_chamfere_s_r);
    }
}

module weigh_holes(height, r) {
    //blue
    translate([92,-53,32]) {
        color([0,0,1])weight_shape(height = height, r = r);
    }

    //red
    translate([-92,-53,32]) {
        color([1,0,0])weight_shape(height = height, r = r);
    }

    //green
    translate([0,109,32]) {
        color([0,1,0])weight_shape(height = height, r = r);
    }
}
