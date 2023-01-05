class Example implements Scene {
    ArrayList<Entity> entities;
    Example() {
        entities = new ArrayList<Entity>();
        entities.add(new Entity(g_data.GetInt("PLAYER:X"), g_data.GetInt("PLAYER:Y")));
        entities.get(0).Attach("Render", new Render("player_right"));
        entities.get(0).Attach("Input", new Input());
        entities.get(0).Attach("Movement", new Movement(1, 1));
        entities.add(new Entity(400, 400));
        entities.get(1).Attach("Render", new Render("player_right"));
        entities.get(1).Attach("Movement", new Movement(-1, -1));
    }

    void Draw() {
        background(0);
        for (Entity e: entities) e.Draw();
    }
    void Update() {
        Transform p_trans = (Transform)entities.get(0).GetComponent("Transform");
        g_data.Update("PLAYER:X", Integer.toString(p_trans.Prop("x")));
        g_data.Update("PLAYER:Y", Integer.toString(p_trans.Prop("y")));
        for (Entity e: entities) e.Update();
    }
    void KeyPressed() {
        if (keyCode == 81) g_data.Save("save");
        if (keyCode == 69) {
            g_data.Load("save");
            entities.get(0).GetComponent("Transform").SetProp("x", g_data.GetInt("PLAYER:X")); 
            entities.get(0).GetComponent("Transform").SetProp("y", g_data.GetInt("PLAYER:Y"));
        }
        for (Entity e: entities) e.KeyPressed();
    }
    void KeyReleased() {
        for (Entity e: entities) e.KeyReleased();
    }
}
