//import gifAnimation.*;
//GifMaker fichero;
import java.awt.Robot;
PShape s;
int count=0;
int scene_x, scene_y, scene_z;
PImage bg;
Robot robot;
boolean menuB=true;
boolean [] keys={false,false,false,false};
boolean [] cameras={true,false,false,false};
float vX, vY,vZ,camHeight,radius;
Astro sun;
void setup(){
  noCursor();
  //size(1000,750,P3D);
  fullScreen(P3D);
  surface.setLocation(0,0);
  s=loadShape("objeto/Robot_Eye.obj");
  s.scale(10);
  noStroke();
  //bg=loadImage("./textures/back.png");
  //bg.resize(width,height);
  sun= new Astro(100,0.1,1.0,0,"./textures/sun.jpg");
  Astro planet= new Astro(30,0.2,10,200,"textures/planet1.png");
  Astro planet1= new Astro(20,-30,-10,0.45,"textures/planet2.jpg");
  Astro planet2= new Astro(25,0.4,2,360,"textures/planet3.jpg");
  Astro planet3= new Astro(16,0.6,5,-400,"textures/planet4.jpg");
  Astro planet4= new Astro(45,0.3,-4,800,"textures/planet5.jpg");
  Astro planet5= new Astro(10,0.5,-2,-500,"textures/moon.png");
  Astro moon= new Astro(10,0.4,1.0,40,"textures/moon.png");
  Astro moon1= new Astro(10,0.2,1.0,-60,"textures/moon.png");
  Astro moon2= new Astro(10,0.2,1.0,-40,"textures/moon.png");
  Astro moon3= new Astro(16,0.5,60,110,"textures/moon.png");
  Astro moon4= new Astro(20,0.2,120,90,"textures/moon.png");
  planet.addAstro(moon);
  planet.addAstro(moon1);
  planet2.addAstro(moon2);
  planet4.addAstro(moon3);
  planet4.addAstro(moon4);
  sun.addAstro(planet);
  sun.addAstro(planet1);
  sun.addAstro(planet2);
  sun.addAstro(planet3);
  sun.addAstro(planet4);
  sun.addAstro(planet5);
  //count=0;
  //fichero= new GifMaker(this,"demo.gif");
  //fichero.setRepeat(0);
  vX=0;
  vY=0;
  vZ=0;
  camHeight=0;
  radius=360;
  scene_x=width/2;
  scene_y=height/2;
  scene_z=-500;
  try{
    robot= new Robot();
  } catch(Throwable e){
  }
  //robot.mouseMove(width/2,height/2);
  //bg.resize(width,height);
}

void draw(){
  
  float angle=0;
  float angle2=0;
    background(0);
    pushMatrix();
    translate(width/2,height/2,-700);
    //camera(vX,vY,vZ,mouseX+width/2,mouseY+height/2,-700+vZ,0,1,0);
    sun.printAstro();
    
    angle=map(mouseX,0,width,360,0);
    angle2=map(mouseY,0,height,360,0)/4+135;
    camHeight=map(mouseY,0,height,height+400,0);
    PVector camPos = new PVector();
    camPos.x = radius*sin(radians(angle)) + scene_x;
    camPos.y =radius*sin(radians(angle2)) + scene_y;
    camPos.z = radius*cos(radians(angle)) + scene_z;
    //camera (scene_x,scene_y,scene_z,camPos.x, camPos.y, camPos.z, 0.0, 1.0, 0.0);
    println("angle: "+angle2);
    pushMatrix();
    stroke(255);
    translate(scene_x-width/2-15,scene_y-height/2-15,scene_z+700-15);
    
    rotateY(radians(angle));
    rotateX(radians(angle2));
    //fill(144,144,0);
    //box(30);
    //pushMatrix();
    //translate(0,15,15);
    //fill(0,144,144);
    //box(10);
    //fill(255);
    //popMatrix();
    //noStroke();
    rotateX(radians(180));
    
    rotateZ(radians(180));
    
    shape(s);
    popMatrix();
    popMatrix();
    if(cameras[0]){
      camera (scene_x,scene_y,scene_z,camPos.x, camPos.y, camPos.z, 0.0, -cos(radians(angle2)), 0.0);
    }
    if(cameras[1]){ 
      
      camera(100,-200,-700,width/2,height,-700,0.0,1.0,0.0);
      //println("x= "+scene_x+" y= "+scene_y+" z= "+scene_z);
    }
  //pushMatrix();
  //translate(width/2,height/2-100,-700);
  //fill(255);
  //box(10);
  //noFill();
  //popMatrix();
  
  //pushMatrix();
  //translate(width/2,height,-700);
  //fill(140,144,0);
  //box(10);
  //noFill();
  //popMatrix();
  
  if(cameras[2]){
  }
  if(cameras[3]){
  }

  if(keys[0]){
    scene_z+=3*cos(radians(angle));
    scene_x+=3*sin(radians(angle));
    scene_y+=3*sin(radians(angle2));
  }
  if(keys[1]){
    scene_z-=3*cos(radians(angle));
    scene_x-=3*sin(radians(angle));
    scene_y-=3*sin(radians(angle2));
  }
  if(keys[2]){
    scene_y-=3;
  }
  if(keys[3]){
    scene_y+=3;
  }
  if(angle<=width/1000){
    robot.mouseMove(width-pmouseX,mouseY);
  }
  if(angle>=(width/1000)*360){
    robot.mouseMove(width-pmouseX,mouseY);
  }
  
  
  //if(angle2<=90.5 || mouseY+(mouseY-pmouseY)>= 3*height/4){
  //  robot.mouseMove(mouseX,3*height/4-(mouseY-pmouseY));
  //}
  //if(angle2>=269.8 || mouseY+(mouseY-pmouseY)<=height/4){
  //  robot.mouseMove(mouseX,height/4-(mouseY-pmouseY));
  //}
  //count++;
  //if(count>=5){
  //  count=0;
  //  fichero.addFrame();
  //}
  
}

void keyPressed(){
  if(keyCode==ENTER){
    menuB= !menuB;
  }
  if (key=='w'){
    keys[0]=true;
    camHeight++;
  }
  if(key=='s'){
    keys[1]=true;
    camHeight--;
  }
  if (key==' '){
    keys[2]=true;
  }
  if(keyCode==CONTROL){
    keys[3]=true;
  }
  if(key =='1'){
    cameras[0]=true;
    cameras[1]=false;
    cameras[2]=false;
    cameras[3]=false;
  }
  if(key =='2'){
    cameras[0]=false;
    cameras[1]=true;
    cameras[2]=false;
    cameras[3]=false;
  }
  //if(keyCode==ENTER){
  //  fichero.finish();
  //}
}


void keyReleased(){
    if (key=='w'){
    keys[0]=false;
  }
  if(key=='s'){
    keys[1]=false;
  }
  if (key==' '){
    keys[2]=false;
  }
  if(keyCode==CONTROL){
    keys[3]=false;
  }
};
