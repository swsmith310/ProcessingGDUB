class DataMap {
    HashMap<String, String> data;

    DataMap() {
        data = new HashMap<String,String>();
        Init();
        data.forEach((key, value) -> println(key + "=" + value));
    }

    void Save(String filename) {
        PrintWriter writer = createWriter("Saves/" + filename + ".gdub");
        data.forEach((key, value) -> writer.println(key + "=" + value));
        writer.flush();
        writer.close();
    }

    void Init() {
        BufferedReader reader = createReader("Saves/init.gdub");
        String line;
        String prefix = new String();
        try { line = reader.readLine(); } catch (IOException e) { line = null; }
        while (line != null) {
            if (line.contains("#") || line.contains("END")) {
                try { line = reader.readLine(); } catch (IOException e) { line = null; }
                continue;
            }
            if (line.contains("DEF")) {
                String[] def = split(line, ' ');
                prefix = def[1];
                try { line = reader.readLine(); } catch (IOException e) { line = null; }
                continue;
            }
            String[] pair = split(trim(line), '=');
            Update(prefix + pair[0], pair[1]);
            try { line = reader.readLine(); } catch (IOException e) { line = null; }
        }
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
