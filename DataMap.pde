class DataMap {
    HashMap<String, String> data;

    DataMap() {
        data = new HashMap<String,String>();
        Load("init");
    }

    void Save(String filename) {
        PrintWriter writer = createWriter("Saves/" + filename + ".gdub");
        data.forEach((key, value) -> writer.println(key + "=" + value));
        writer.flush();
        writer.close();
    }

    void Load(String filename) {
        BufferedReader reader = createReader("Saves/" + filename + ".gdub");
        String line;
        try { line = reader.readLine(); } catch (IOException e) { line = null; }
        while (line != null) {
            String[] pair = split(line, '=');
            Update(pair[0], pair[1]);
            try { line = reader.readLine(); } catch (IOException e) { line = null; }
        }
        
    }

    void Update(String k, String v) {
        data.put(k, v);
    }

    int GetInt(String k) {
        return Integer.parseInt(data.get(k));
    }
}
