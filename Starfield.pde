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
		flyingStars[i] = new NormalParticle(i);
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
void particleCreation(int inputQueueNum)
{
	double deciderNum = Math.random();
	if (deciderNum <0.97)
	{
		flyingStars[inputQueueNum] = new NormalParticle(inputQueueNum);
	}else /*if (deciderNum < 0.99)*/
	{
		flyingStars[inputQueueNum] = new OddballParticle(inputQueueNum);
	}/*else
	{
		flyingStars[inputQueueNum] = new JumboParticle();
	}*/
}
class NormalParticle implements Particle
{
	double myX,myY,myRad,mySpeed,prevX,prevY,mySize;
	int myColor, queueNum;
	boolean ranShow;
	NormalParticle(int inputQueueNum)
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
		queueNum = inputQueueNum;
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
			/*
			ranShow = true;
			mySpeed = 1;
			myRad = (Math.random()*6.28318530718);
			myX = 500;
			myY = 300;
			prevX = 500;
			prevY = 300;
			mySize = (int)(Math.random()*6)+1;
			*/
			particleCreation(queueNum);
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
	double myX,myY,prevX,prevY,myRad,mySpeed,mySize;
	int myColor,queueNum;
	boolean ranShow;
	OddballParticle(int inputQueueNum)
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
				myx = (int)(Math.random()*100)+1000;
			}
		}
		prevX = myX;
		prevY = myY;
		mySpeed = Math.random()*10;
		myColor = color((int)(Math.random()*100)+156,(int)(Math.random()*100)+156,(int)(Math.random()*100)+156);
		mySize = (int)(Math.random()*6)+1;
		ranShow = true;
		queueNum = inputQueueNum;
	}
	public void show()
	{
		strokeWeight((int)(mySize));
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
		if(((myX<=520)&&(myX>=480)&&(myY<=320)&&(myY>=280))||(((myX<=-100)||(myX>=1100))&&((myY<=-100)||(myY>=700))))
		{
			/*
			ranShow = true;
			mySpeed = 1;
			myRad = (Math.random()*6.28318530718);
			myX = (Math.sin(myRad)*600)+500;
			myY = (Math.cos(myRad)*350)+300;
			prevX = (Math.sin(myRad)*600)+500;
			prevY = (Math.cos(myRad)*350)+300;
			mySize = (int)(Math.random()*6)+1;
			*/
			particleCreation(queueNum);
		}
	}
}
/*
class JumboParticle extends NormalParticle
{
}
*/