//Author Dogaru Narcis George
module screw(height, coils, c_height, step, df_r, uf_r, c_diam) {
    
    difference() {
        union() {
            translate([0,0,height/2])
            cylinder(h=height, r=uf_r, center=true, $fn=30);
            
            for(i=[0:1:coils]) {
                translate([0,0,i*step])
                cylinder(h=c_height, r=uf_r + c_diam, center=true, $fn=30);
            }
            
            cylinder(h=c_height * 10, r=df_r, center=true, $fn=30);
        }

        translate([0,0,-2.5])
        cube([height / 3 - c_diam,c_diam,5], center=true);
        
        translate([0,0,-2.5])
        rotate([0,0,90])
        cube([height / 3,c_diam,5], center=true);
    }  
}