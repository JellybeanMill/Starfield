boolean circleRPov = true;
boolean circleGPov = true;
boolean circleBPov = true;
int circleColorR = 255;
int circleColorG = 255;
int circleColorB = 255;
int colorRandomVar = 5;
Particle [] flyingStars = new Particle[1500];
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
	background(0);
	for(int i=0;i<flyingStars.length;i++)
	{
		flyingStars[i].show();
		flyingStars[i].move();
	}
	midCircle();
}
void midCircle()
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
}
class NormalParticle implements Particle
{
	double myX,myY,myRad,mySpeed,prevX,prevY,mySize;
	int myColor;
	boolean ranShow;
	NormalParticle()
	{
		myX = (int)(Math.random()*100)+450;
		myY = (int)(Math.random()*100)+250;
		mySpeed = 1;
		myColor =color((int)(Math.random()*150)+56,(int)(Math.random()*150)+56,(int)(Math.random()*150)+56);
		mySize = (int)(Math.random()*6)+1;
		ranShow = false;
		prevX = 500;
		prevY = 300;
		myRad = (Math.random()*6.28318530718);
	}
	void show()
	{
		if (ranShow == true)
		{
			stroke(myColor);
			strokeWeight((int)mySize*0.25);
			line((float)myX,(float)myY,(float)prevX,(float)prevY);
		}
	}
	void move()
	{
		prevX = myX;
		prevY = myY;
		myX = myX+(Math.sin(myRad)*mySpeed);
		myY = myY+(Math.cos(myRad)*mySpeed);
		mySpeed = mySpeed + Math.random();
		mySize = mySize + (Math.random()*0.25);
		if(((myX<=-100)||(myX>=1100))&&((myY<=-100)||(myY>=700)))
		{
			ranShow = true;
			mySpeed = 1;
			myRad = (Math.random()*6.28318530718);
			myX = 500;
			myY = 300;
			prevX = 500;
			prevY = 300;
			mySize = (int)(Math.random()*6)+1;
		}
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	double myX,myY,myRad,mySpeed;
	int myColor,mySize;
	boolean ranShow;
	OddballParticle()
	{
		myRad = (Math.random()*6.28318530718);
		myX = (Math.sin(myRad)*600)+500;
		myY = (Math.cos(myRad)*350)+300;
		mySpeed = Math.random()*0.1;
		myColor = color((int)(Math.random()*100)+156,(int)(Math.random()*100)+156,(int)(Math.random()*100)+156);
		mySize = (int)(Math.random()*5);
		ranShow = false;
	}
	void show()
	{
		noStroke();
		triangle(myX,myY,myX-5,myY-5,myX-5,myY-10);
		triangle(myX,myY,myX-5,myY-5,myX-10,myY-5);
	}
	void move()
	{}
}
class JumboParticle //uses inheritance
{
	//your code here
}