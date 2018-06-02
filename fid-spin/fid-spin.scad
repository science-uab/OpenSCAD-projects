module fid_spin() {
    fid_spin_body();
    translate([0,0,-32]){
        weights();
    }
}

module fid_spin_body() {

    difference() {
        difference() {
            translate([-180,-150,0]) {
                linear_extrude(height = 16, center = true, $fn = 100, convexity = 10)import(file = "res/fid-spin-from-png.dxf");
            }
            translate([0,0,-32]){
                weigh_holes();
            }
        }
        cylinder(h = 22, r1 = 32, r2 = 32, center = true);
    }
}

module weight_shape(height) {
        color([0,0,1])cylinder(h = height, r1 = 48, r2 = 48, center = true);
}

module pt_scobit() {
    minkowski() {
        cylinder(h = 2, r1 = 24, r2 = 24, center = true);
        sphere($fn = 0, $fa = 12, $fs = 2, r = 12);
    }
}

module weight() {    
    difference() {
        difference() {
            difference() {
                weight_shape(16);
                translate([0,0,16])pt_scobit();
            }
            translate([0,0,-16])pt_scobit();
        }
        cylinder(h = 18, r1 = 20, r2 = 20, center = true);
    }
}

//cylinder(h = 24, r1 = 18, r2 = 18, center = true);

module weights() {
    //blue
    translate([92,-53,32]) {
        color([0,0,1])weight();
    }

    //red
    translate([-92,-53,32]) {
        color([1,0,0])weight();
    }

    //green
    translate([0,109,32]) {
        color([0,1,0])weight();
    }
}

module weigh_holes() {
    //blue
    translate([92,-53,32]) {
        color([0,0,1])weight_shape(18);
    }

    //red
    translate([-92,-53,32]) {
        color([1,0,0])weight_shape(18);
    }

    //green
    translate([0,109,32]) {
        color([0,1,0])weight_shape(18);
    }
}


//weight();

fid_spin();
