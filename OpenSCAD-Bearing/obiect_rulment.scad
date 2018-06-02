/*
Autor: Goada Radu
Materie: Roboti Inteligenti
Proiect: INFOR MASTER ANUL I SEM II
*/


$fn = 100;

rotate_extrude(){
difference()
   {
    union(){      
        translate([10.5,0,0]) square ([5,7], center = true);
        translate([19.5,0,0]) square ([5,7], center = true);
        }
    translate([14.75,0,0]) circle(3.5);
   }
}

for(ball = [0:45:360] )
{
    rotate([0,0,ball])
    translate([14.75,0,0])
    color( "Gray", 1.0 )
    sphere(r=3.25);
    }