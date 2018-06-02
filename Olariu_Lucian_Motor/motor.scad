$fn = 30;
module motor_body() {
cylinder(h = 10, r1 = 10, r2 = 10, center = true);

translate([6, 0, 5]) 
    cylinder(h = 2, r1 = 3, r2 = 3, center = true);
    module tip() {
        difference() {
            difference() {
                cylinder(h = 6, r1 = 1, r2 = 1, center = true);
                translate([-1, 0.5, 0])
                    cube([2, 1, 4]);
            }
            translate([-1, -1.5, 0])
                cube([2, 1, 4]);
        }
    }

translate([6, 0, 7])
tip();
}

motor_body();

module hindges() {
    difference() {
        difference() {
            union() {
                cube([5, 24, 0.5], center=true);
                translate([0, 12, 0])
                cylinder(h = 0.5, r1 = 2.5, r2 = 2.5, center = true);
                translate([0, -12, 0])
                cylinder(h = 0.5, r1 = 2.5, r2 = 2.5, center = true);
            }

            translate([0, 12, 0])
            cylinder(h = 1, r1 = 1.5, r2 = 1.5, center = true);
        }
        translate([0, -12, 0])
        cylinder(h = 1, r1 = 1.5, r2 = 1.5, center = true);
    }
}

translate([0, 0, 4.7])
hindges();

module blue() {
    translate([0, 0, -1])
    cube([3, 11, 8], center=true);
    translate([-1, 0, 0])
    cube([1, 8, 10], center=true);
}
translate([-9, 0, 0])
blue();