// Processing-GDUB -- Entity.pde
// Developed by Spencer W. Smith
// Last updated 29 December 2022
class Entity {
    HashMap<String,Component> components;

    Entity(int x, int y) {
        components = new HashMap<String,Component>();
        // Every entity has a transform component by default
        components.put("Transform", new Transform(x, y));
    }

    boolean HasComponent(String key) {
        return components.containsKey(key);
    }

    Component GetComponent(String key) {
        return components.get(key);
    }

    void Attach(String key, Component c) {
        components.put(key, c);
    }

    void Draw() {
        components.forEach((key, value) -> value.Draw(this));
    }

    void Update() {
        components.forEach((key, value) -> value.Update(this));
    }

    void KeyPressed() {
        components.forEach((key, value) -> value.KeyPressed(this));
    }

    void KeyReleased() {
        components.forEach((key, value) -> value.KeyReleased(this));
    }
}
