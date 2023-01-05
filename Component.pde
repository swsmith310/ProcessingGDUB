// Processing-GDUB -- Component.pde
// Developed by Spencer W. Smith 
// Last updated 5 January 2023
interface Component<T> {
    void Draw(Entity e);
    void Update(Entity e);
    void KeyPressed(Entity e);
    void KeyReleased(Entity e);
    T Prop(String p);
    void SetProp(String p, T val);
}

class Transform implements Component<Integer> {
    int x, y;
    Transform(int x, int y) {
        this.x = x;
        this.y = y;
    }
    void Draw(Entity e) {}
    void Update(Entity e) {}
    void KeyPressed(Entity e) {}
    void KeyReleased(Entity e) {}
    Integer Prop(String p) {
        switch(p) {
            case "x":
                return x;
            case "y":
                return y;
            default:
                return null;
        }
    }
    void SetProp(String p, Integer val) {
        switch(p) {
            case "x":
                x = val;
                break;
            case "y":
                y = val;
                break;
        }
    }
}

class Render implements Component<PImage> {
    PImage tex;
    Render(String file) {
        tex = loadImage("Pics/"+file+".png");
    }
    void Draw(Entity e) {
        image(tex, (int)e.GetComponent("Transform").Prop("x"), (int)e.GetComponent("Transform").Prop("y"));
    }
    void Update(Entity e) {}
    void KeyPressed(Entity e) {}
    void KeyReleased(Entity e) {}
    PImage Prop(String p) {
        switch(p) {
            case "tex":
                return tex;
            default:
                return null;
        }
    }
    void SetProp(String p, PImage val) {}
}

class Movement implements Component<Integer> {
    int xv, yv;
    Movement(int xv, int yv) {
        this.xv = xv;
        this.yv = yv;
    }
    void Draw(Entity e) {}
    void Update(Entity e) {
        Transform transform = (Transform)e.GetComponent("Transform");
        Input input;
        if (e.HasComponent("Input")) {
            input = (Input)e.GetComponent("Input");
            if (input.Prop("rt")) xv = 1;
            else if (input.Prop("lt")) xv = -1;
            else xv = 0;
            if (input.Prop("up")) yv = -1;
            else if (input.Prop("dwn")) yv = 1;
            else yv = 0;
        }
        transform.SetProp("x", transform.x + xv);
        transform.SetProp("y", transform.y + yv);
    }
    void KeyPressed(Entity e) {}
    void KeyReleased(Entity e) {}
    Integer Prop(String p) {
        switch(p) {
            case "xv":
                return xv;
            case "yv":
                return yv;
            default:
                return null;
        }
    }
    void SetProp(String p, Integer val) {
        switch(p) {
            case "xv":
                xv = val;
                break;
            case "yv":
                yv = val;
                break;
        }
    }
}

class Input implements Component<Boolean> {
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
    Boolean Prop(String p) {
        switch(p) {
            case "up":
                return upKey;
            case "dwn":
                return dwnKey;
            case "rt":
                return rtKey;
            case "lt":
                return ltKey;
            default:
                return null;
        }
    }
    void SetProp(String p, Boolean val) {}
}
