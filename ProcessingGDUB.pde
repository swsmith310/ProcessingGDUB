DataMap g_data;
SceneList g_scenes;

void setup() {
    g_data = new DataMap();
    g_scenes = new SceneList(new Example());
    size(640, 480);
}

void draw() {
    g_scenes.Update();
    g_scenes.Draw();
}

void keyPressed() {
    g_scenes.KeyPressed();
}

void keyReleased() {
    g_scenes.KeyReleased();
}
