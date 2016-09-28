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
	int mainColor = color((int)(Math.random()*150)+56,(int)(Math.random()*150)+56,(int)(Math.random()*150)+56);
	stroke(mainColor);
	fill(mainColor);
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
			stroke(255);
			strokeWeight((int)mySize*0.25);
			line((float)myX,(float)myY,(float)prevX,(float)prevY);
			stroke(myColor);
			strokeWeight(1);
			fill(myColor);
			ellipse((float)myX,(float)myY,(int)mySize,(int)mySize);
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
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

