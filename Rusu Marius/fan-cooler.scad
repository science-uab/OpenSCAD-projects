//RUSU MARIUS PROIECT MASTER OPENSCAD

$fn=60;  //Working
//$fn=720;  //Show on
ventilator(50, 15, 40);

module ventilator(width, depth, mount, mount_diameter=3.4, corner_radius=10, blade_angle=45)// lățime, adâncime, montare, diametru de montare = 3.4, raza colțului = 10, unghiul paletei = -45
{
  bore_diameter = width - 3;//diametru gaurii

  color ("lime")
  {
    corp(width, depth, bore_diameter, mount, mount_diameter, corner_radius);//lățime, adâncime, diametrul găurii, montare, diametru de montare, raza colțului
    ventilatoare(bore_diameter, depth, blade_angle);//ventilatoare-diametrul găurii, adâncimea, unghiul lamei 
  }
}

module corp(width, depth, bore_diameter, mount, mount_diameter, corner_radius)//lățime, adâncime, diametrul găurii, montare, diametru de montare, raza colțului
{
  difference()
  {
    linear_extrude(height=depth, center = true, convexity = 4, twist = 0)//linear_extrude (înălțime = adâncime, centru = adevărat, convexitate = 4, răsucire = 0
    {
      difference()
      {
        square([width, width], center=true);
        gaura_interioara(bore_diameter, width/2 + 2);
        gaurilor_demontare(mount/2, mount_diameter/2, depth+0.2);
        colturi_rotunjite(width/2, corner_radius);//pătrat ([lățime, lățime], centru = adevărat); gaură interioară (diametrul găurii, lățimea / 2 + 2); gauri de montare (suport / 2, diametru montant / 2, adâncime + 0,2); colțuri rotunjite (cu latimea / 2, raza de colț)
      }
    }

    inel_exterior(width, depth);//inel exterior (lățime, adâncime)
  }
}

module gaura_interioara(diameter, hub)//diametru, butuc
{
  difference()
  {
    circle(r=diameter/2,center=true);
    circle(r=hub/2,center=true);
  }
}

module gaurilor_demontare(offset, r, h)
{
  for (i=[0:3])
  {
    rotate([0,0,i*90])
    {
      translate([offset, offset])
      {
        circle(r=r, h=h, center=true);
      }
    }
  }
}

module colturi_rotunjite(offset, r=5)
{
  for(i=[0:3])
  {
    rotate([0,0,i*90])
    {
      translate([offset,offset])
      {
        difference()
        {
          translate([-r+0.1, -r-0.1])
          {
            square([r+0.2, r+0.2]);
          }

          translate([-r, -r])
          {
            circle(r=r);
          }
        }
      }
    }
  }
}

module inel_exterior(width, depth, surface_thickness=3.6)
{
  difference()
  {
    cylinder(r=width*.75, h=depth-2*surface_thickness, center=true);
    cylinder(r=(width+2)/2, h=depth-2*surface_thickness+0.2, center=true);
  }
}

module ventilatoare(width, depth, angle)
{
  linear_extrude(height=depth-1, center = true, convexity = 4, twist = angle)
  {
    for(i=[0:6])
    rotate((360*i)/7)
    rotate([0,0,$t*360]) square([width/2-0.75,1.5]);
  }
}

