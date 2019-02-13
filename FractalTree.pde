private double fractionLength = .7; 
private double smallestBranch = 5; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int endX1 = 0;//(int)(branchLength*Math.cos(angle1) + x);
  int endY1 = 0;//(int)(branchLength*Math.sin(angle1) + y);
  int endX2 = 0;
  int endY2 = 0;
  
  branchLength *= fractionLength;
  endX1 = (int)(branchLength*Math.sin(angle1) + x);
  endY1 = (int)(branchLength*Math.sin(angle1) + y);
  endX2 = (int)(-branchLength*Math.sin(angle1) + x);
  endY2 = (int)(branchLength*Math.sin(angle1) + y);
  
  System.out.println(branchLength);
  
  //line(x,y,endX2,endY2);
  //line(x,y,endX1,endY1);
  
  if(branchLength <= smallestBranch){
    System.out.print(branchLength);
    return;
  }else {
    stroke(0,255,0);
    line(x,y,endX1,endY1);
    line(x,y,endX2,endY2);
    drawBranches(endX1,endY1,branchLength,angle);
    drawBranches(endX2,endY2,branchLength,angle);
  }
  
} 
