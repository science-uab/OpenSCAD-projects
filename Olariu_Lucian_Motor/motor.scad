$fn = 30;

// Motor Body cylinder
$h_body_cy = 10;
$r_body_cy = 10;
$r2_body_cy = 10;

// Tip base cylinder
$h_tip_cy = 2;
$r_tip_cy = 3;
$r2_tip_cy = 3;

// Tip translation
$tip_translation = [6, 0, 5];

// Tip top cylinder
$h_tip_t_cy = 6;
$r_tip_t_cy = 1;
$r2_tip_t_cy = 1;

// Tip difference cube
$tip_diff_cube = [2, 1, 4];

// Tip translation
$tip_m_translation = [6, 0, 7];

// Hindges cube
$h_cube = [5, 24, 0.5];

// Hindges cylinder union
$h_diff_cy_h = 0.5;
$h_diff_cy_r = 2.5;
$h_diff_cy_r2 = 2.5;

// Hindges diff cylinder translation
$h_diff_cy_t1 = [0, 12, 0];
$h_diff_cy_t2 = [0, -12, 0];

// Hindges diff cylinders
$h_diff_cy2 = 1;
$r_diff_cy2 = 1.5;
$r2_diff_cy2 = 1.5;


// Hindges diff cylinders translations
$hi_diff_translation1 = [0, 12, 0];
$hi_diff_translation2 = [0, -12, 0];

// Hindge module translation
$h_m_translation = [0, 0, 4.7];

// Blue module cube dimensions
$b_cube1 = [3, 11, 8];
$b_cube2 = [1, 8, 10];

// Blue module cube translations
$b_cube1_trans = [0, 0, -1];
$b_cube2_trans = [-1, 0, 0];

// Blue module translation
$blue_module_trans = [-9, 0, 0];

module motor_body(h_body_cy, h_body_cy, r2_body_cy, h_tip_cy, r_tip_cy, r2_tip_cy, tip_translation, h_tip_t_cy, r_tip_t_cy, r2_tip_t_cy, tip_diff_cube, tip_m_translation) {
cylinder(h = h_body_cy, r1 = h_body_cy, r2 = r2_body_cy, center = true);

translate(tip_translation) 
    cylinder(h = h_tip_cy, r1 = r_tip_cy, r2 = r2_tip_cy, center = true);
    module tip(h_tip_t_cy, r_tip_t_cy, r2_tip_t_cy, tip_diff_cube) {
        difference() {
            difference() {
                cylinder(h = h_tip_t_cy, r1 = r_tip_t_cy, r2 = r2_tip_t_cy, center = true);
                translate([-1, 0.5, 0])
                    cube(tip_diff_cube);
            }
            translate([-1, -1.5, 0])
                cube(tip_diff_cube);
        }
    }

translate(tip_m_translation)
tip(h_tip_t_cy, r_tip_t_cy, r2_tip_t_cy, tip_diff_cube);
}

motor_body($h_body_cy, $r_body_cy, $r2_body_cy, $h_tip_cy, $r_tip_cy, $r2_tip_cy, $tip_translation, $h_tip_t_cy, $r_tip_t_cy, $r2_tip_t_cy, $tip_diff_cube, $tip_m_translation);

module hindges(h_cube, h_diff_cy_h, h_diff_cy_r, h_diff_cy_r2, h_diff_cy_t1, h_diff_cy_t2, h_diff_cy2, r_diff_cy2, r2_diff_cy2, hi_diff_translation1, hi_diff_translation2) {
    difference() {
        difference() {
            union() {
                cube(h_cube, center=true);
                translate(h_diff_cy_t1)
                cylinder(h = h_diff_cy_h, r1 = h_diff_cy_r, r2 = h_diff_cy_r2, center = true);
                translate(h_diff_cy_t2)
                cylinder(h = h_diff_cy_h, r1 = h_diff_cy_r, r2 = h_diff_cy_r2, center = true);
            }

            translate(hi_diff_translation1)
            cylinder(h = h_diff_cy2, r1 = r_diff_cy2, r2 = r2_diff_cy2, center = true);
        }
        translate(hi_diff_translation2)
        cylinder(h = h_diff_cy2, r1 = r_diff_cy2, r2 = r2_diff_cy2, center = true);
    }
}

translate($h_m_translation)
hindges($h_cube, $h_diff_cy_h, $h_diff_cy_r, $h_diff_cy_r2, $h_diff_cy_t1, $h_diff_cy_t2, $h_diff_cy2, $r_diff_cy2, $r2_diff_cy2, $hi_diff_translation1, $hi_diff_translation2);

module blue(b_cube1, b_cube2, b_cube1_trans, b_cube2_trans) {
    translate(b_cube1_trans)
    cube(b_cube1, center=true);
    translate(b_cube2_trans)
    cube(b_cube2, center=true);
}
translate($blue_module_trans)
blue($b_cube1, $b_cube2, $b_cube1_trans, $b_cube2_trans);
