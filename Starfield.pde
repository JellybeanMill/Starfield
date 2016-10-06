boolean circleRPov = true;
boolean circleGPov = true;
boolean circleBPov = true;
int circleColorR = 255;
int circleColorG = 255;
int circleColorB = 255;
int colorRandomVar = 5;
Particle [] flyingStars = new Particle[1500];
CenterPixels pixelUD = new CenterPixels(500,280,90.0);
CenterPixels pixelD1 = new CenterPixels(480,280,45.0);
CenterPixels pixelLR = new CenterPixels(480,300,00.0);
CenterPixels pixelD2 = new CenterPixels(480,320,315.0);
void setup()
{
	size(1000,600);
	for (int i=0;i<flyingStars.length;i++)
	{
		flyingStars[i] = new NormalParticle();
	}
}
void draw()
{
	pixelUD.show();
	pixelD1.show();
	pixelLR.show();
	pixelD2.show();
	pixelUD.move();
	pixelD1.move();
	pixelLR.move();
	pixelD2.move();
	background(0);
	for(int i=0;i<flyingStars.length;i++)
	{
		flyingStars[i].show();
		flyingStars[i].move();
	}
	//midCircle();
}
/*void midCircle()
{
	if (circleRPov == true)
	{
		circleColorR = circleColorR + ((int)(Math.random()*colorRandomVar));
		if (circleColorR >= 255)
		{
			circleRPov = false;
		}
	} else
	{
		circleColorR = circleColorR - ((int)(Math.random()*colorRandomVar));
		if (circleColorR <= 50)
		{
			circleRPov = true;
		}
	}
	if (circleGPov == true)
	{
		circleColorG = circleColorG + ((int)(Math.random()*colorRandomVar));
		if (circleColorG >= 255)
		{
			circleGPov = false;
		}
	} else
	{
		circleColorG = circleColorG - ((int)(Math.random()*colorRandomVar));
		if (circleColorG <= 50)
		{
			circleGPov = true;
		}
	}
	if (circleBPov == true)
	{
		circleColorB = circleColorB + ((int)(Math.random()*colorRandomVar));
		if (circleColorB >= 255)
		{
			circleBPov = false;
		}
	} else
	{
		circleColorB = circleColorB - ((int)(Math.random()*colorRandomVar));
		if (circleColorB <= 50)
		{
			circleBPov = true;
		}
	}
	noStroke();
	fill(circleColorR,circleColorG,circleColorB);
	ellipse(500,300,20,20);
}*/
void particleCreation()
{
	int emptNum=-15;
	for (int i = 0;i<flyingStars.length;i++)
	{
		if (flyingStars[i].checkDead() == false)
		{
			emptNum = i;
		}
	}
	double deciderNum = Math.random();
	if (deciderNum <0.97&&emptNum!=-15)
	{
		flyingStars[emptNum] = new NormalParticle();
	}else if (deciderNum < 0.999&&emptNum!=-15)
	{
		flyingStars[emptNum] = new OddballParticle();
	}else if (emptNum!=-15)
	{
		flyingStars[emptNum] = new JumboParticle();
	}
}
class NormalParticle implements Particle
{
	double myX,myY,myRad,mySpeed,prevX,prevY,mySize;
	int myColor, queueNum;
	boolean ranShow;
	NormalParticle()
	{
		myX = (int)(Math.random()*10)+495;
		myY = (int)(Math.random()*10)+295;
		mySpeed = 1;
		myColor =color((int)(Math.random()*150)+56,(int)(Math.random()*150)+56,(int)(Math.random()*150)+56);
		mySize = (int)(Math.random()*6)+1;
		ranShow = true;
		prevX = 500;
		prevY = 300;
		myRad = (Math.random()*6.28318530718);
	}
	public void show()
	{
		if (ranShow == true)
		{
			stroke(myColor);
			strokeWeight((int)mySize*0.25);
			line((float)myX,(float)myY,(float)prevX,(float)prevY);
		}
	}
	public void move()
	{
		prevX = myX;
		prevY = myY;
		myX = myX+(Math.sin(myRad)*mySpeed);
		myY = myY+(Math.cos(myRad)*mySpeed);
		mySpeed = mySpeed + Math.random();
		mySize = mySize + (Math.random()*0.25);
		if(((myX<=-100)||(myX>=1100))&&((myY<=-100)||(myY>=700)))
		{
			particleCreation();
			ranShow=false;
		}
	}
	public boolean checkDead()
	{
		return ranShow;
	}
}
interface Particle
{
	public void show();
	public void move();
	public boolean checkDead();
}
class OddballParticle implements Particle
{
	double myX,myY,prevX,prevY,myRad,mySpeed,mySize;
	int myColor,queueNum;
	boolean ranShow;
	OddballParticle()
	{
		if (Math.random()<=0.5)
		{
			myX = (int)(Math.random()*1200)-100;
			if(Math.random()<=0.5)
			{
				myY = (int)(Math.random()*100)-100;
			}else
			{
				myY = (int)(Math.random()*100)+600;
			}
		}else
		{
			myY = (int)(Math.random()*800)-100;
			if(Math.random()<=0.5)
			{
				myX = (int)(Math.random()*100)-100;
			}else
			{
				myX = (int)(Math.random()*100)+1000;
			}
		}
		myRad = Math.atan2(myX-500,myY-300); 
		prevX = myX;
		prevY = myY;
		mySpeed = (Math.random()*4)+5;
		myColor = color((int)(Math.random()*100)+156,(int)(Math.random()*100)+156,(int)(Math.random()*100)+156);
		mySize = (int)(Math.random()*7)+5;
		ranShow = true;
	}
	public void show()
	{
		strokeWeight((int)(mySize*0.5));
		stroke(255);
		line((float)myX,(float)myY,(float)prevX,(float)prevY);
	}
	public void move()
	{
		prevX = myX;
		prevY = myY;
		myX = myX-(Math.sin(myRad)*mySpeed);
		myY = myY-(Math.cos(myRad)*mySpeed);
		mySpeed = mySpeed - (mySpeed*Math.random()*0.01);
		mySize = mySize - (mySize*Math.random()*0.005);
		if(((myX<=510)&&(myX>=490)&&(myY<=310)&&(myY>=290))||((int)mySize==0))
		{
			particleCreation();
			ranShow=false;
		}
	}
	public boolean checkDead()
	{
		return ranShow;
	}
}
class JumboParticle extends NormalParticle
{
	void show()
	{
		if (ranShow == true)
		{
			stroke((int)(Math.random()*206)+50,(int)(Math.random()*206)+50,(int)(Math.random()*206)+50);
			strokeWeight((int)mySize*3);
			line((float)myX,(float)myY,(float)prevX,(float)prevY);
		}
	}
}
class CenterPixels
{
	int startX,startY,myX,myY;
	boolean posDir;
	double myRad;
	CenterPixels(int inputX,int inputY,float inputDegrees)
	{
		startX = inputX;
		startY = inputY;
		myX = startX;
		myY = startY;
		posDir = true;
		myRad = radians(inputDegrees);
	}
	void show()
	{
		noStroke();
		fill(255);
		ellipse(myX,myY,3,3);
	}
	void move()
	{
		double definedRandom = Math.random();
		if (posDir == true)
		{
			myX+=(int)(Math.cos(myRad)*2*definedRandom);
			myY+=(int)(Math.sin(myRad)*2*definedRandom);
		}else
		{
			myX-=(int)(Math.cos(myRad)*2*definedRandom);
			myY-=(int)(Math.sin(myRad)*2*definedRandom);
		}
		if (startX-myX>20||startY-myY>20||startX-myX<0||startY-myY<0)
		{
			if (posDir == true)
			{
				posDir = false;
			}else
			{
				posDir = true;
			}
		}
	}
}