//Author Iancu Mihai-Ovidiu

toleranta = 1;

module roata(diametru_exterior, diametru_interior)
{  
    rotate_extrude(){
        difference(){
            union(){
            translate([100,0,0]) circle(diametru_exterior);
            translate([50,0,0]) circle(diametru_exterior);
            translate([15,0,0]) circle(diametru_interior);
            }
        }
    }
}

module far(raza_far, dimensiune_lentila)
{
 sphere(raza_far);
 rotate([0,90,0])translate([0,0,15]) cylinder(15,dimensiune_lentila,dimensiune_lentila);
}

module parbriz(lungime_masina)
{
  difference(){
    cube([20,lungime_masina,190]);
    rotate([0,-90,0]) translate([100,110,-21]) cylinder(30,30,30);
      
    rotate([0,-90,0]) translate([100,390,-21]) cylinder(30,30,30);
  }  
}

module scaun(latime_masina, latime_scaun, grosime_scaun){
    cube([latime_scaun,latime_masina - 40,grosime_scaun]);
}

module bara()
{
    cube([70,600,30]);
    translate([35,5, 0]) cylinder(30,35,35);
    translate([35,580, 0]) cylinder(30,35,35);
}

module volan(dimensiune_volan)
{
    sphere(dimensiune_volan);
    rotate([0,120,0])translate([0,0,15]) cylinder(100,20,20);
}

module cadru(lungime_masina, latime_masina)
{
    difference(){
        cube([800,latime_masina,250]);
        translate([300,20,0])cube([500 + toleranta,460,250+toleranta]);
    }
    
    difference(){ 
        translate([800, 0, 20]) linear_extrude(height = 280)  polygon (points=[[0,500],[1000,250],[0,0]]);
        
    translate([1400,20,20 - toleranta])cube([400 + toleranta,460,280 + 2 * toleranta]);
    }
    
    difference(){ 
        translate([1400,150,20])cube([30 ,200,280]);  
        translate([1420,170,20 - toleranta])cube([30 + toleranta ,30 + toleranta,250 + toleranta]);
        translate([1420,235,20 - toleranta])cube([30 + toleranta ,30 + toleranta,250 + toleranta]);
        translate([1420,300,20 - toleranta])cube([30 + toleranta ,30 + toleranta,250 + toleranta]);
    }
    
    // far dreapta
    translate([1400,400,290]) far(raza_far = 40, dimensiune_lentila = 40);
    // far stanga
    translate([1400,100,290]) far(raza_far = 40, dimensiune_lentila = 40);
    // parbriz
    color("Brown") translate([780,0,250]) parbriz(latime_masina);
    
    // bara fata
    color("Brown")translate([lungime_masina,-40,0]) bara();
    
    // bara spate
    color("Brown")translate([-70,-50,0]) bara();
    
    // scaun
    color("Brown") translate([150,0,250]) cube([120,latime_masina,50]);
    
    translate([250,20,250]) scaun(latime_masina, latime_scaun = 50, grosime_scaun = 40);
    
    translate([300,20,20]) scaun(latime_masina, latime_scaun = 150, grosime_scaun = 60);
   
    // volan   
    translate([700,250,200]) volan(dimensiune_volan=40);
    
    // lateral
    difference(){
        color("Brown") rotate([90,0,0])translate([200,0,-580]) cylinder(81,250,25);  
        rotate([90,0,0])translate([200,-100,-581]) cylinder(83,270,270);
    }
    
    difference(){
        color("Brown")rotate([90,0,0])translate([750,-50,-580]) cylinder(79,400,400);
        rotate([90,0,0])translate([730,500,-581]) cylinder(83,450,450);
        rotate([0,0,90])translate([499,-1150,-500]) cube([82,800,500]);
        rotate([90,0,0])translate([200,-100,-581]) cylinder(82,270,270);
        rotate([90,0,0])translate([700,480,-581]) cylinder(82,450,450);
        rotate([90,0,0])translate([1250,-90,-581]) cylinder(82,320,320);
    } 
    
    difference(){
        color("Brown") rotate([90,0,0])translate([1200,-30,-580]) cylinder(80,300,300);
        rotate([90,0,0])translate([1250,-90,-581]) cylinder(82,320,320);
        rotate([0,0,90])translate([499,-1150,-500]) cube([82,800,500]);
    }
  
    // lateral 2
    difference(){
        color("Brown") rotate([90,0,0])translate([200,0,1]) cylinder(81,250,250);
        rotate([90,0,0])translate([200,-100,-1]) cylinder(85,270,270);
    }
    
    difference(){
        color("Brown") rotate([90,0,0]) translate([750,-50,1]) cylinder(80,400,400);
        rotate([90,0,0]) translate([730,500,-1]) cylinder(81,450,450);
        rotate([0,0,90]) translate([-82,-1150,-502]) cube([85,800,500]);
        rotate([90,0,0]) translate([200,-100,-1]) cylinder(83,270,270);
        rotate([90,0,0]) translate([700,480,-1]) cylinder(83,450,450);
        rotate([90,0,0]) translate([1250,-90,-2]) cylinder(84,320,320);
    } 
    
    difference(){
        color("Brown") rotate([90,0,0]) translate([1200,-30,1]) cylinder(80,300,300);
        rotate([90,0,0]) translate([1250,-90,-1]) cylinder(83,320,320);
        rotate([0,0,90]) translate([-82,-1150,-502]) cube([85,800,500]);
    }

}



module masina(lungime_masina, latime_masina, inaltime_masina, offset_roata_x, offset_roata_y, raza_roata)
{
    color ("Goldenrod") cube([lungime_masina, latime_masina, inaltime_masina]); 
    cadru(lungime_masina, latime_masina);
    
    // roata 1
    translate ([offset_roata_x,  -offset_roata_y, 0]) rotate([90, 0, 0]) roata(diametru_exterior = 25, diametru_interior = 10);
    
    // roata 2
    translate ([offset_roata_x, latime_masina +offset_roata_y, 0]) rotate([90, 0, 0]) roata(diametru_exterior = 25, diametru_interior = 10);
    
    // roata 3
    translate ([lungime_masina - offset_roata_x, -offset_roata_y, 0]) rotate([90, 0, 0]) roata(diametru_exterior = 25, diametru_interior = 10);
    
    // roata 4
    translate ([lungime_masina - offset_roata_x, latime_masina + offset_roata_y, 0]) rotate([90, 0, 0]) roata(diametru_exterior = 25, diametru_interior = 10);

    // ax fatza
    translate ([offset_roata_x, -offset_roata_y - raza_roata, 0]) rotate([-90, 0, 0]) cylinder (h = latime_masina + 2 * offset_roata_y + 2 * raza_roata, r = 10);
    
    // ax spate
    translate ([lungime_masina - offset_roata_x, -offset_roata_y - raza_roata, 0]) rotate([-90, 0, 0]) cylinder (h = latime_masina + 2 * offset_roata_y + 2 * raza_roata, r = 10);
}


masina(lungime_masina = 1460, latime_masina = 500, inaltime_masina = 20, offset_roata_x = 200, offset_roata_y = 40, raza_roata = 3);