ArrayList<Asteroids> ceres = new ArrayList<Asteroids>();
SpaceShip starfox; 
Star [] raul = new Star [200];
boolean up,down,left, right;
public void setup() 
{
  size(800,800);
  starfox = new SpaceShip();
    for(int i=0; i<raul.length; i++)
  {
      raul[i]=new Star();
  }
  for(int i=0 ; i<20 ; i++)
  {
    ceres.add(i, new Asteroids());
  }
}
public void draw() 
{
  background (0);
  for(int i=0;i<raul.length;i++){
    raul[i].show();
  }

  for(int i=0 ; i<ceres.size() ; i++){
    ceres.get(i).show();
    ceres.get(i).move();
  }

   for(int i=0 ; i<ceres.size() ; i++){
    ceres.get(i).move();
    ceres.get(i).show(); 
    if(dist(starfox.getX(), starfox.getY(), ceres.get(i).getX(), ceres.get(i).getY())<40){
      ceres.remove(i);
    }
  }
if(up==true) starfox.accelerate(.3);
  if(down==true) starfox.accelerate(-.3);
  if(left==true) starfox.rotate(-10);
  if(right==true) starfox.rotate(10);
  starfox.move();
  starfox.show();
}
public void keyPressed() {
  if (key=='a') left=true;
  if (key=='d') right=true;
  if (key=='s') down=true;
  if (key=='w') up=true;
  if (key=='h') {
    starfox.setX((int)(Math.random()*800));
    starfox.setY((int)(Math.random()*800));
    starfox.setDirectionX(0);
    starfox.setDirectionY(0);
    starfox.setPointDirection((int)(Math.random()*361));
  }
}

public void keyReleased() {
    if(key=='w') up=false;
    if(key=='a') left=false;
    if(key=='s') down=false;
    if(key=='d') right=false;
  }

class Star {
  private float x,y;
     public Star(){
        x=(float)Math.random()*800;
        y=(float)Math.random()*800;
    }

      public void show(){
        ellipse(x,y,1,1);
      }
}

class Asteroids extends Floater
{
    int rotate1;
    public Asteroids(){
      corners=6;
      int[] xA = new int[6];
      int[] yA = new int[6];
      int constant = (int)(Math.random()*2);
      if(constant==1){
        xA[0]=(int)(Math.random()*16)-40;
        xA[1]=(int)(Math.random()*16)+25;
        xA[2]=(int)(Math.random()*11)+30;
        xA[3]=(int)(Math.random()*16)+25;
        xA[4]=(int)(Math.random()*16)-40;
        xA[5]=(int)(Math.random()*11)-50;
        yA[0]=(int)(Math.random()*16)-40;
        yA[1]=(int)(Math.random()*16)-40;
        yA[2]=0;
        yA[3]=(int)(Math.random()*16)+25;
        yA[4]=(int)(Math.random()*16)+25;
        yA[5]=0;

      } else {
        xA[0]=(int)(Math.random()*16)-20;
        xA[1]=(int)(Math.random()*16)+5;
        xA[2]=(int)(Math.random()*11)+10;
        xA[3]=(int)(Math.random()*16)+5;
        xA[4]=(int)(Math.random()*16)-20;
        xA[5]=(int)(Math.random()*11)-30;
        yA[0]=(int)(Math.random()*16)-20;
        yA[1]=(int)(Math.random()*16)-20;
        yA[2]=0;
        yA[3]=(int)(Math.random()*16)+5;
        yA[4]=(int)(Math.random()*16)+5;
        yA[5]=0;
      }
      xCorners = xA;
      yCorners = yA;
      myColor = 100;
      myCenterX = (double)(Math.random()*3*width)-width;
      myCenterY = (double)(Math.random()*3*height)-height;
      myDirectionX = (double)(Math.random()*3)-1.5;
      myDirectionY = (double)(Math.random()*3)-1.5;
      myPointDirection= (double)(Math.random()*361);
      rotate1=(int)(Math.random()*3);
    }
    public void move ()
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    rotate(rotate1);
      super.move(); 

    //wrap around screen    
    /*if(myCenterX >width+width)
    {     
      myCenterX = -width;    
    }    
    else if (myCenterX<-width)
    {     
      myCenterX = width+width;    
    }    
    if(myCenterY >height+height)
    {    
      myCenterY = -height;    
    }   
    else if (myCenterY < -height)
    {     
      myCenterY = height+height;    
    } 
    */  
  }
    public void setX (int x){
      myCenterX=x;
    }
    public int getX(){
      return (int)(myCenterX);
    }
    public void setY (int y){
      myCenterY=y;
    }
    public int getY(){
      return (int)(myCenterY);
    }
    public void setDirectionX(double x){
      myDirectionX=x;
    }
    public double getDirectionX(){
      return myDirectionX;
    }
    public void setDirectionY(double y){
      myDirectionY=y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection=degrees;
    }
    public double getPointDirection(){
      return myPointDirection;
    }
 
}

    class SpaceShip extends Floater
{  
    public SpaceShip() {
      corners = 3;
      int[] xS = {-8,16,-8};
      int[] yS = {-8,0,8};
      xCorners = xS;
      yCorners = yS;
      myColor = 225;
      myCenterX = 500;
      myCenterY = 500;
      myDirectionX = 0;
    }
    public void setX (int x){
      myCenterX=x;
    }
    public int getX(){
      return (int)(myCenterX);
    }
    public void setY (int y){
      myCenterY=y;
    }
    public int getY(){
      return (int)(myCenterY);
    }
    public void setDirectionX(double x){
      myDirectionX=x;
    }
    public double getDirectionX(){
      return myDirectionX;
    }
    public void setDirectionY(double y){
      myDirectionY=y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection=degrees;
    }
    public double getPointDirection(){
      return myPointDirection;
    }

      public void move () //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myDirectionX=myDirectionX/friction;
    myDirectionY=myDirectionY/friction;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{  
  protected float friction=1.008;
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)  
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move () //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;


   // wrap around screen    
     if(myCenterX >width)
     {     
       myCenterX = 0;    
     }    
     else if (myCenterX<0)
     {     
       myCenterX = width;    
     }    
     if(myCenterY >height)
     {    
       myCenterY = 0;    
     }   
     else if (myCenterY < 0)
     {     
     myCenterY = height;    
     }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
