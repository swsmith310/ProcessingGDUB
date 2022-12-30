class Example implements Scene {
    ArrayList<Entity> entities;
    Example() {
        entities = new ArrayList<Entity>();
        entities.add(new Entity(150, 150));
        entities.get(0).Attach("Render", new Render("player_right"));
        entities.get(0).Attach("Input", new Input());
        entities.get(0).Attach("Movement", new Movement(1, 1));
    }

    void Draw() {
        background(0);
        for (Entity e: entities) e.Draw();
    }
    void Update() {
        for (Entity e: entities) e.Update();
    }
    void KeyPressed() {
        for (Entity e: entities) e.KeyPressed();
    }
    void KeyReleased() {
        for (Entity e: entities) e.KeyReleased();
    }
}
