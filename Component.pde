// Processing-GDUB -- Component.pde
// Developed by Spencer W. Smith 
// Last updated 29 December 2022
interface Component {
    void Draw(Entity e);
    void Update(Entity e);
    void KeyPressed(Entity e);
    void KeyReleased(Entity e);
}

class Transform implements Component {
    int x, y;
    Transform(int x, int y) {
        this.x = x;
        this.y = y;
    }
    void Draw(Entity e) {}
    void Update(Entity e) {}
    void KeyPressed(Entity e) {}
    void KeyReleased(Entity e) {}
}

class Render implements Component {
    PImage texture;
    Render(String file) {
        texture = loadImage("Pics/"+file+".png");
    }
    void Draw(Entity e) {
        image(texture, e.transform.x, e.transform.y);
    }
    void Update(Entity e) {}
    void KeyPressed(Entity e) {}
    void KeyReleased(Entity e) {}
}

class Movement implements Component {
    int xv, yv;
    Movement(int xv, int yv) {
        this.xv = xv;
        this.yv = yv;
    }
    void Draw(Entity e) {}
    void Update(Entity e) {
        Input input;
        if (e.HasComponent("Input")) {
            input = (Input)e.GetComponent("Input");
            if (input.upKey) yv = -1;
            else if (input.dwnKey) yv = 1;
            else yv = 0;

            if (input.rtKey) xv = 1;
            else if (input.ltKey) xv = -1;
            else xv = 0;
        }
        e.transform.x += xv;
        e.transform.y += yv;
    }
    void KeyPressed(Entity e) {}
    void KeyReleased(Entity e) {}
}

class Input implements Component {
    boolean upKey, dwnKey, rtKey, ltKey;
    void Draw(Entity e) {}
    void Update(Entity e) {}
    void KeyPressed(Entity e) {
        if (keyCode == 65) ltKey = true;
        if (keyCode == 68) rtKey = true;
        if (keyCode == 83) dwnKey = true;
        if (keyCode == 87) upKey = true;
    }
    void KeyReleased(Entity e) {
        if (keyCode == 65) ltKey = false;
        if (keyCode == 68) rtKey = false;
        if (keyCode == 83) dwnKey = false;
        if (keyCode == 87) upKey = false;
    }
}
