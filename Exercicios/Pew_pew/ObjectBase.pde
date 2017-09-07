public class ObjectBase {
  
  public String class_name = "ObjectBase";
  
  public ObjectPhysic physic = new ObjectPhysic();
  public ObjectImage image = new ObjectImage();
  public ObjectCollision collision = new ObjectCollision();
  
  public void move() {
    physic.move();
  }
  
  public void draw() {
    image.preDraw(this);
  }
  
  public boolean isColliding(ObjectBase other_object) {
    if(other_object == null) {
      print("null");
      return false;
    }
    return collision.isColliding(this, other_object);
  }
  
}