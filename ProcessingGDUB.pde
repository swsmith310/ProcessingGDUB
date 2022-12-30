SceneList scenes;

void setup() {
    scenes = new SceneList(new Example());
    size(640, 480);
}

void draw() {
    scenes.Update();
    scenes.Draw();
}

void keyPressed() {
    scenes.KeyPressed();
}

void keyReleased() {
    scenes.KeyReleased();
}
