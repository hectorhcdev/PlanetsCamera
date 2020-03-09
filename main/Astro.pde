
class Astro{
  
  private ArrayList<Astro> satelites = new ArrayList();
  private int size;
  private float rotationV,rotation,distance, rotationX;
  private PShape globe;
  PImage texture;
  
  public Astro(int size,float rotation,float rotationX,float distance,String texture){
    this.size=size;
    this.rotation=rotation;
    this.distance=distance;
    this.texture=loadImage(texture);
    this.texture.resize(500,250);
    this.rotationX=rotationX;
    this.rotationV=0;
  }
  
  void addAstro(Astro ad){
    satelites.add(ad);
  }
  
  void printAstro(){
    pushMatrix();
    stroke(255);
    
    rotateZ(radians(this.rotationX));
    
    rotateY(radians(this.rotationV));
    pushMatrix();
    rotateX(radians(90));
    ellipse(0,0,this.distance*2,this.distance*2);
    
    popMatrix();
    noStroke();
    translate(this.distance,0,0);
    noFill();
    globe=createShape(SPHERE,this.size);
    globe.setTexture(this.texture);
    //sphere(this.size);
    shape(globe);
    this.rotationV+=this.rotation;
  
    if(this.rotationV>=360){
      this.rotationV=0;
    }
    for(Astro sat:this.satelites){
      //println("pintando satelite");
      sat.printAstro();
    }
    popMatrix();
  }
}
