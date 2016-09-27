Particle [] flyingStars = new Particle[2000];
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
}
class NormalParticle implements Particle
{
	double myX,myY,myRad,mySpeed;
	int myColor,mySize;
	boolean ranShow;
	NormalParticle()
	{
		myX = (int)(Math.random()*100)+450;
		myY = (int)(Math.random()*100)+250;
		myRad = (Math.random()*6.28318530718);
		mySpeed = 1;
		myColor =color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		mySize = (int)(Math.random()*6)+1;
		ranShow = false;
	}
	void show()
	{
		if (ranShow == true)
		{
			stroke(myColor);
			fill(myColor);
			ellipse((float)myX,(float)myY,mySize,mySize);
		}
	}
	void move()
	{
		myX = myX+(Math.sin(myRad)*mySpeed);
		myY = myY+(Math.cos(myRad)*mySpeed);
		mySpeed = mySpeed + Math.random();
		if(((myX<=-100)||(myX>=1100))&&((myY<=-100)||(myY>=700)))
		{
			ranShow = true;
			myX = (int)(Math.random()*100)+450;
			myY = (int)(Math.random()*100)+250;
			mySpeed = 1;
			myRad = (Math.random()*6.28318530718);
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

