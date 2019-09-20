#include "colors.inc"

camera {
    location <5 , -1, -5> // <x, y, z>
    look_at  <0, -1,  1> // <x, y, z>

    
}



light_source {
    <4, 6, -10> // <x, y, z>
    White 
}

sky_sphere{
    pigment{
        gradient y
        color_map{
            [0 color White]
            [1 color Blue]
        }
    }
}


plane { <0,1,0> // normal vector
        , 0 // distance from origin
      pigment {
      checker color White, color Grey      
    }
    translate <0,-3,0>
    finish {
      ambient .4
      }
    
}

// =========== ASPAS INTERNAS =========

merge {
  // Aspa 1
    #declare Dist = 1.5;
    cylinder { <0,Dist,0>,<0,-Dist,0>, 0.2 open
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
      scale <1,1,0.5>
      rotate <0,0,10>
      finish {
      ambient .4
      }
    }
// Aspa 2
    cylinder { <0,Dist,0>,<0,-Dist,0>, 0.2 open
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
      scale <1,1,0.5>
      rotate <0,0,70>
      finish {
      ambient .4
      }
    }
// Aspa 3
    cylinder { <0,Dist,0>,<0,-Dist,0>, 0.2 open
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
      scale <1,1,0.5>
      rotate <0,0,130>
      finish {
      ambient .4
      }
    }

// Cilindro conector de aspas
    cylinder { <0,0,0.5>,<0,0,-0.5>, 0.45 
      rotate <90,0,0>
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
    rotate <-90,0,45>
       finish {
      ambient .5
      }
    }

// Cilindro lasgro central
    cylinder { <0,0,1>,<0,0,-1.5>, 0.2
      rotate <90,0,0>
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
      rotate <-90,0,45>
       finish {
      ambient .7
      }
    }

//Mini cilindro entre el mas gruso y mas delgado
    cylinder { <0,0,-0.5>,<0,0,-0.7>, 0.3
    rotate <90,0,0> 
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
      rotate <-90,0,45>
       finish {
      ambient .6
      }
    }

 // ======== Cilinro final ==============0
    cylinder { <0,0,-1.6>,<0,0,-1.8>, 0.26
      pigment { Black }
    }
   
    cylinder { <0,0,-1.5>,<0,0,-1.9>, 0.25
      pigment { Scarlet }
      finish{
        ambient .4
      }
    }

  difference{
      cylinder { <0,0,-1.9>,<0,0,-1.95>, 0.15
        pigment { BrightGold }
      }
      cylinder { <0,0,-1.9>,<0,0,-1.95>, 0.07 open
        pigment { BrightGold }
      }
  }    
}
difference{

//Aro sostenedor de bloques
difference {
    cylinder { <0,0,0.3>,<0,0,-0.8>, 1.5 
      texture{
        pigment {     
          image_map{
            jpeg "rotor2.jpg"
            map_type 2
          }   
        }
      }
       finish {
      ambient .6
      }
    }

    cylinder { <0,0,0.3>,<0,0,-0.8>, 1.43 open
      pigment { Silver }
       finish {
      ambient .3
      }
    }
}

// ========== aberturas sobre dicos superior ===========
#declare Nr1 = 0;
#declare End1 = 80;
#while (  Nr1 < End1)

  box { <0, 0, 0>,<0.05,0.05,0.12>
    translate <1.45,-0,-0.77>                       
    pigment { Silver }            
    rotate < 0,0, 360/End1 * Nr1>
  }
#declare Nr1 = Nr1 + 1;
#end
}

//=========== Bloques de color y aspas cuadradas =========
#declare Nr = 0;
#declare End = 24;
#declare cambio = 0;
#while (  Nr < End)

  box { <0, 0, 0>,<0.2,0.3,0>
    rotate <30,0,0>
    translate <1.5,0,-0.6>                       
    pigment { Gray }            
    rotate < 0,0, 360/End * Nr - 8>
    finish { ambient .3}
  }

  box { <0, 0, 0>,<0.2,0.3,0.5>
    translate <1.5,0,-0.25>
    //rotate <10,0,0>
    #if(cambio)
        pigment { Red }
        #declare cambio = 0;
    #else
        pigment { Yellow }
        #declare cambio = 1;
    #end
    rotate < 0,0, 360/End * Nr >
  }
#declare Nr = Nr + 1;
#end


// ======= areolas negras<==============
cylinder { <0,0,-0.15>,<0,0,-0.2>, 1.725 open
  pigment { Black }
  finish{
    ambient .4
  }
}

cylinder { <0,0,0.2>,<0,0,0.25>, 1.725 open
  pigment { Black }
  finish{
    ambient .4
  }
}


// =============== Pilar frontal 1=========0
prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  1, // ... up through here
  6, // the number of points making up the shape ...
  <0,2.5>, <0,0>, <0.6,0>, <0.6,1>, <0.4, 1.3>, <0.4,2.5>
  rotate<0,-90,-90>
  translate <-0.5,-3,-1.4>
  pigment { White }
  finish{ambient .2}
}

prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  0.35, // ... up through here
  4, // the number of points making up the shape ...
  <-0.4,0>, <0.4,0>, <0.2,0.4>, <-0.2,0.4>
  rotate<-90,-0,-0>
  translate <0,-0.5,-1>
  pigment { White }
  finish{ambient .4}
}

// =============== Pilar posterior 1=========0
prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  1, // ... up through here
  6, // the number of points making up the shape ...
  <0,2.5>, <0,0>, <-0.6,0>, <-0.6,1>, <-0.4, 1.3>, <-0.4,2.5>
  rotate<0,-90,-90>
  translate <-0.5,-3,1>
  pigment { White }
    finish{ambient .2}
}

  prism {
    linear_sweep
    linear_spline
    0, // sweep the following shape from here ...
    0.35, // ... up through here
    4, // the number of points making up the shape ...
    <-0.4,0>, <0.4,0>, <0.2,0.4>, <-0.2,0.4>
    rotate<-90,-0,-0>
    translate <0,-0.5,1>
    pigment { White }
  }

// =============== placa conmemorativa =========
box{
    <0, 0, 0>,<1,1,0>                    
  pigment { 
    image_map{
      jpeg "placa.jpg"
    }
   } 
  scale <0.6,0.4,1>  
  translate <-0.28,-2,-1.43>           
}


//======== aro figura trasera =========
difference{

// ============ orificios anillo trasero =============
  difference {
        cylinder { <0,0,4>,<0,0,4.7>, 2.1
          pigment {     
        image_map{
          jpeg "rotor2.jpg"
          map_type 2
        }   
      }
      finish {
      ambient .4
      }
    }

            cylinder { <0,0,4>,<0,0,4.7>, 1.75 open
    pigment { Silver }
      finish {
      ambient .2
      }
    }
  }
  #declare Stren = 1.00;
  #declare R = 0.05;
  #declare Nr2 = 0;
  #declare End2 = 10;
  #while (  Nr2 < End2)
  blob{
    threshold 0.6
    cylinder{<-0.06,0.00, 0>,<0.06,0.00,0>, R, Stren}
    scale 1
    rotate<0,0,0>
    translate<0,1.92,4>  
    pigment{ Black}
    rotate < 0,0, 360/End2 * Nr2 >
  }
  #declare Nr2 = Nr2 + 1;
  #end

}
//Cobre interno
difference {
  cylinder { <0,0,3.77>,<0,0,4.82>, 1.75
    pigment { BakersChoc }
  }

  cylinder { <0,0,3.77>,<0,0,4.82>, 1.7 open
    pigment { BakersChoc }
  }
}
//============== Pilares figura 2 =============0
prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  1, // ... up through here
  7, // the number of points making up the shape ...
  <0,0>, <1.25,0>, <1.25,1.3>, <0.7,2.5>, <0.35, 2.5>, <0.35, 1.3>, <0, 0.7>
  rotate<-90,-0,-0>
  translate <1.7,-3,4.8>
  pigment { White }
}

prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  1, // ... up through here
  7, // the number of points making up the shape ...
  <0,0>, <-1.25,0>, <-1.25,1.3>, <-0.7,2.5>, <-0.35, 2.5>, <-0.35, 1.3>, <0, 0.7>
  rotate<-90,-0,-0>
  translate <-1.7,-3,4.8>
  pigment { White }
}

// ============= figura derecha sobre el pilar =============0
prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  0.8, // ... up through here
  6, // the number of points making up the shape ...
  <0,0>, <0.25,0>, <0.25,0.1>, <0.35,0.1>, <0.2, 0.4>, <0, 0.4>
  rotate<-90,-0,-0>
  translate <2.1,-0.5,4.7>
  pigment { White }
  finish{ambient .3}
}

union{
  box { <0, 0, 0>,<0.2,0.08,1.05>
    translate <2.1,-0.09,3.8>
    pigment { Silver }
    finish{ambient .4}
  }

  box { <0, 0, 0>,<0.2,0.01,1.05>
    translate <2.1,-0.01,3.8>
    pigment { Silver }
  finish{ambient .1}
  }

  box { <0, 0, 0>,<0.2,0.08,1.05>
    translate <2.1,0,3.8>
    pigment { Silver }
    finish{ambient .4}
  }
}

// ============= figura izquierda sobre el pilar =============0

prism {
  linear_sweep
  linear_spline
  0, // sweep the following shape from here ...
  0.8, // ... up through here
  6, // the number of points making up the shape ...
  <0,0>, <-0.25,0>, <-0.25,0.1>, <-0.35,0.1>, <-0.2, 0.4>, <0, 0.4>
  rotate<-90,-0,-0>
  translate <-2.1,-0.5,4.7>
  pigment { White }
  finish{ambient .3}
}

union{
  box { <0, 0, 0>,<0.2,0.08,1.05>
    translate <-2.3,-0.09,3.8>
    pigment { Silver }
    finish{ambient .4}
  }

  box { <0, 0, 0>,<0.2,0.01,1.05>
    translate <-2.3,-0.01,3.8>
    pigment { Silver }
  finish{ambient .1}
  }

  box { <0, 0, 0>,<0.2,0.08,1.05>
    translate <-2.3,0,3.8>
    pigment { Silver }
    finish{ambient .4}
  }
}