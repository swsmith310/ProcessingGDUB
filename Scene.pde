// Processing-GDUB -- Scene.pde
// Developed by Spencer W. Smith
// Last updated 29 December 2022
interface Scene {
  void Draw();
  void Update();
  void KeyPressed();
  void KeyReleased();
}

class SceneList {
 ArrayList<Scene> scenes;

 SceneList(Scene scene) {
   scenes = new ArrayList<Scene>();
   Push(scene);
 }
 
 void Push(Scene scene) {
   scenes.add(scene);
 }
 
 void Pop() {
   scenes.remove(scenes.size() - 1);
 }
 
 void Draw() {
   // introduce range-based for loops
   for (Scene scene : scenes) scene.Draw();
 }
 
 void Update() {
   scenes.get(scenes.size() - 1).Update();
 }
 
 void KeyPressed() {
   scenes.get(scenes.size() - 1).KeyPressed();
 }
 
 void KeyReleased() {
   scenes.get(scenes.size() - 1).KeyReleased();
 }
}
