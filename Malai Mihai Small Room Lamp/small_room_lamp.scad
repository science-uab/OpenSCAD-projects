//@author Malai Mihai

$fn = 100;

module cylinder_md(height, radiusBot, radiusTop) {
    difference() { 
      cylinder(h=height, r1=radiusBot, r2=radiusTop, center=false); 
      translate([1, 0, -1]) {
          cylinder(h=height, r1=radiusBot, r2=radiusTop, center=false); 
      }
      translate([0,0, height - 2]) {
        cylinder(h=3, r=radiusBot);
      }
    } 
}

module cylinder_hd(radiusBot) {
    translate([0, 0, 1]) {
        difference() {
            cylinder(h=0.5, r1=radiusBot - 0.5, r2=radiusBot - 0.5);
            translate([1, -radiusBot, -1]) {
                cube([radiusBot, (radiusBot) * 2, 3]);
            }
            translate([0, 0, -1]) {
                cylinder(h = 3, r = radiusBot / 6);
            }
            translate([-((radiusBot / 6) + 1), 0, 0]) {
                cube([radiusBot / 5, radiusBot / 5, 3], center = true);
            } 
        }
    }
}

module sniff(px, py, pz) {
    translate([px, py, pz]) {
        rotate([0, 90, 0]) {
            cylinder(h = 2, r = 0.5);
        }
    }
    translate([px + 2, py,pz]) {
        rotate([0, 90, 0]) {
            cylinder(h = 2, r = 0.4);
        }
    }
}

module snuff(x, y, z) {
    intersection() {          
        cube([x, y, z], center = true);
        cylinder(h = z, r = (x / 2) + (x / 10));
    }
    sniff(4.5, -1.5, 2);
    sniff(4.5, 1.5, 2);
}

module lamp_ring(height, pozZ, r1, r2) {
    translate([0, 0, pozZ]) {
        cylinder(h = height, r1 = r1, r2 = r2);
    }
}

module lamp_holder(radius) {
    lamp_ring(0.5, radius / 2, radius / 2.5, radius / 2.5);
    lamp_ring(0.5, radius / 2 + 0.5, radius / 3, radius / 3);
    lamp_ring(0.5, radius / 2 + 1, radius / 2.5, radius / 2.5);
    lamp_ring(0.5, radius / 2 + 1.5, radius / 3, radius / 3);
    lamp_ring(0.5, radius / 2 + 2, radius / 2.5, radius / 2.5);

    difference() {
        translate([0,0, radius / 2 + 2.5]) {
            cylinder(h = 2, r = radius / 4);
        }
        translate([0, 0, radius / 2 + 3.5]) {
            cylinder(h = 1.5, r = radius / 5);
        }
        translate([0, 0, radius / 2 + 2.6]) {
            cylinder(h = 1, r = radius / 6);
        }
    }
}

module lamp(radius) {
    //leg
    lamp_ring(2.5, radius + 2.6, radius / 3, radius / 3);
    
    //bulb
    lamp_ring(0.5, radius + 5.1, radius / 3, radius / 2.6 );
    lamp_ring(0.5, radius + 5.6, radius / 2.6, radius / 2.3 );
    lamp_ring(0.5, radius + 6.1, radius / 2.3, radius / 2 );
    lamp_ring(0.5, radius + 6.6, radius / 2, radius / 1.8 );
    lamp_ring(0.5, radius + 7.1, radius / 1.8, radius / 1.7 );
    lamp_ring(0.5, radius + 7.6, radius / 1.7, radius / 1.7 );
    lamp_ring(0.5, radius + 8.1, radius / 1.7, radius / 1.8 );
    lamp_ring(0.5, radius + 8.6, radius / 1.8, radius / 1.9 );
    lamp_ring(0.5, radius + 9.1, radius / 1.9, radius / 2 );
    lamp_ring(0.5, radius + 9.6, radius / 2, radius / 2.1 );
    lamp_ring(0.5, radius + 10.1, radius / 2.1, radius / 2.2 );
    lamp_ring(0.5, radius + 10.6, radius / 2.2, radius / 2.3 );
    lamp_ring(0.5, radius + 11.1, radius / 2.3, radius / 2.4 );
    lamp_ring(0.5, radius + 11.6, radius / 2.4, radius / 2.5 );
    lamp_ring(0.5, radius + 12.1, radius / 2.5, radius / 3 );
    
    //top
    translate([0,0, 15.8]) {
        sphere(1.767);
    }
}

module skeleton(height, radiusBot, radiusTop) {
    translate([0,0, 4.75]) {
        cylinder_md(height, radiusBot, radiusTop);
        cylinder_hd(radiusBot);
    }
}

module lampStuff(radiusBot){
    snuff(radiusBot / 2, radiusBot / 2, radiusBot / 2);
    lamp_holder(radiusBot / 2);
    lamp(radiusBot / 4);
}

module final (height, radiusBot, radiusTop) {
    skeleton(height, radiusBot, radiusTop);
    lampStuff(radiusBot);
}

final(30, 17, 9);
