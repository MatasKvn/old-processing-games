
public class Enemy {
  boolean active;
  float health;

  PVector position;
  PVector velocity;
  int Height;
  int Width;

  int type;

  Enemy(int eType, PVector ePosition, PVector eVelocity, int eHeight, int eWidth) {
    type = eType;
    position = ePosition;
    velocity = eVelocity;
    Height = eHeight;
    Width = eWidth;

    if (type == 0) {
      health = 50;
    }
  }

  void update() {
    if (active == false) return;
    if (type == 0) {
      updateType_0();
    }
  }
  void setActivity(boolean active) {
    this.active = active;
  }
  void checkColision() {
    if(this.active == false) return;
    for (int i=0; i<maxProjectiles; ++i) {
      if (projectiles[i].active == true) {
        if ( (projectiles[i].position.x >= this.position.x-this.Width) && (projectiles[i].position.x <= this.position.x+this.Width) ) { // checking x collision
          if ( (projectiles[i].position.y <= this.position.y+this.Height) && (projectiles[i].position.y >= this.position.y) ) {  // chekcing y colision
            --projectiles[i].penetration;
            this.health -= projectiles[i].damage;
          }
        }
      }
    }
  }

  void updateType_0() {
    position.add(velocity);
    fill(255);
    rect(position.x + shiftX, position.y + shiftY, Width, Height);
    if (position.x > width-Width) velocity.x *= -1;
    if (position.x <= 0) velocity.x *= -1;
    if (position.y > height/2) velocity.y *= -1;
    if (position.y <= 0) velocity.y *= -1;
    println("posX = " + position.x);
    println("posY = " + position.y);
    println("health = " + this.health);
    if (this.health <= 0) this.active = false;
  }
}
