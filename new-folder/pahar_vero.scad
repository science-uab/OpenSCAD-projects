pahar_sampanie(raza_baza = 50, grosime_baza = 5, raza_picior = 3, inaltime_picior = 100, raza_cupa = 50, grosime_perete = 2);

//----------------------------------------------------
module baza_pahar(raza_baza, grosime_baza, raza_picior)
{
    cylinder(h = grosime_baza, r1 = raza_baza, r2 = raza_picior);
}
//----------------------------------------------------
module picior_pahar(inaltime_picior, raza_picior)
{
   cylinder(h = inaltime_picior, r = raza_picior);
}
//----------------------------------------------------
module cupa_pahar(raza_cupa, grosime_perete)
{
    difference(){
        sphere(r = raza_cupa);
        translate ([- raza_cupa, -raza_cupa, 0]) cube([2 * raza_cupa, 2 * raza_cupa, raza_cupa]);
        
        sphere(r = raza_cupa - grosime_perete);
    }
}
//----------------------------------------------------
module pahar_sampanie(raza_baza, grosime_baza, raza_picior, inaltime_picior, raza_cupa, grosime_perete)
{
    baza_pahar(raza_baza, grosime_baza, raza_picior);
    translate ([0, 0, grosime_baza]) picior_pahar(inaltime_picior, raza_picior);
    translate ([0, 0, grosime_baza + inaltime_picior + raza_cupa]) cupa_pahar(raza_cupa, grosime_perete);
}





tresolution = 50; 


radius = 80;


height = 10;


Message = "Bine ați venit la..."; 


To = "Pagina Vero";

$fn = resolution;

scale([1, 0.5]) difference() {
    cylinder(r =radius , h = 2 * height, center = true);
    translate([0, 0, height])
        cylinder(r = radius - 10, h = height + 1, center = true);
}
linear_extrude(height = height) {
    translate([0, --4]) text(Message, halign = "center");
    translate([0, -16]) text(To, halign = "center");
}



$fn = 100;
number_of_holes = 10;

for(i = [1 : 360 / number_of_holes : 360]) {
   
    make_cylinder(i);
}

module make_cylinder(i) {
    
    rotate([0, 0, i]) translate([100, 0, 0]) cylinder(h = 4, r = 20);
}


