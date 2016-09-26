NormalParticle flyingStars = new NormalParticle[1000];
void setup()
{
	size(1000,300)
	for (int i=0;i<flyingStars.length;i++)
	{
		flyingStars[i] = new NormalParticle();
	}
}
void draw()
{
	//your code here
}
class NormalParticle
{
	double myX,myY,myRad,mySpeed;
	NormalParticle()
	{
		myX = 500;
		myY = 300;
		myRad = (Math.radnom()*6.28318530718);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

